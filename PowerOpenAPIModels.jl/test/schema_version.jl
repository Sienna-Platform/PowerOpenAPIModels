# Schema-version stamping and the reader gate (SiennaSchemas docs/VERSIONING.md): the shared
# reader-rule vectors, the check-before-decode guarantee, stamping on write, and `source`-
# version writes validated against a strict bundle built from the sibling schema checkout.

const ICORE = InfrastructureCoreOpenAPIModels

function _cases_path()
    checkout = joinpath(SCHEMA_DIR, "tests", "fixtures", "versioning")
    if isdir(checkout)
        return joinpath(checkout, "cases.json")
    end
    return joinpath(@__DIR__, "fixtures", "versioning", "cases.json")
end

const CASES_PATH = _cases_path()
const BUILD_BUNDLES = joinpath(SCHEMA_DIR, "scripts", "build_bundles.py")

function _bus(id, extras)
    return PowerCoreOpenAPIModels.ACBus(;
        id=id,
        name="b$id",
        number=id,
        bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
        available=true,
        additional_properties=extras,
    )
end

function _requirement(id, extras)
    return PowerInvestmentsOpenAPIModels.MaximumCapacityRequirements(;
        id=id,
        name="r$id",
        available=true,
        additional_properties=extras,
    )
end

_system(extras...) = _filled(PowerCoreOpenAPIModels.SystemDocument(), _bus, extras...)
_portfolio(extras...) = _filled(
    PowerInvestmentsOpenAPIModels.PortfolioDocument("Zone"),
    _requirement,
    extras...,
)

function _filled(doc, make, extras...)
    for extra in extras
        PowerCoreOpenAPIModels.add_component!(
            doc,
            make(PowerCoreOpenAPIModels.next_id!(doc), extra),
        )
    end
    return doc
end

function _raw(doc)
    return ICORE.JSON.parse(
        ICORE.JSON.json(PowerCoreOpenAPIModels.document_tree(doc));
        dicttype=Dict{String, Any},
    )
end

_stamp!(raw, ::Nothing) = delete!(raw, "schema_version")
_stamp!(raw, stamp) = (raw["schema_version"] = stamp)

function _caught(T, f)
    return (@test_throws T f()).value
end

# Derived from the reader so tests hold for any shipped version.
function _stamps(reader)
    major, minor, patch = ICORE._parse_version(reader)[1:3]
    next_line = "$major.$(minor + 1).0"
    if !iszero(major)
        next_line = "$(major + 1).0.0"
    end
    return (
        (:missing, nothing),
        (:newer, "$major.$minor.$(patch + 1)"),
        (:incompatible, next_line),
        (:malformed, "v$reader"),
    )
end

@testset "schema version" begin
    @testset "reader version comes from the shipped schema-version file" begin
        shipped = strip(read(joinpath(pkgdir(ICORE), "schema-version"), String))
        @test ICORE.READER_VERSION == lstrip(shipped, 'v')
        @test !startswith(ICORE.READER_VERSION, "v")
    end

    @testset "shared vectors" begin
        if !isfile(CASES_PATH)
            @warn "cases.json not found; skipping shared vectors" CASES_PATH
        else
            cases = ICORE.JSON.parsefile(CASES_PATH; dicttype=Dict{String, Any})["cases"]
            @test !isempty(cases)
            for c in cases
                @test ICORE._check_schema_version(c["reader"], c["document"]) ==
                      Symbol(c["outcome"])
                if haskey(c, "expected_message")
                    e = _caught(
                        ICORE.SchemaVersionError,
                        () -> ICORE._checked_schema_version(c["document"], c["reader"]),
                    )
                    @test e.outcome == Symbol(c["outcome"])
                    @test e.message == c["expected_message"]
                end
            end
        end
    end

    @testset "canonical messages" begin
        raw(v) = Dict{String, Any}("schema_version" => v)
        err(reader, document) = _caught(
            ICORE.SchemaVersionError,
            () -> ICORE._checked_schema_version(document, reader),
        )
        e = err("0.1.0", Dict{String, Any}())
        @test e.outcome == :missing
        @test e.message ==
              "document has no schema_version: it predates versioning; re-export it with a " *
              "current producer (psy5 bundles: PowerSystemsUpdater)"
        e = err("0.1.0", raw("v0.1.0"))
        @test e.outcome == :malformed
        @test e.message == "document schema_version \"v0.1.0\" is not a valid version"
        @test err("0.1.0", raw(0.1)).message ==
              "document schema_version 0.1 is not a valid version"
        @test err("0.1.0", raw(nothing)).message ==
              "document schema_version null is not a valid version"
        e = err("0.1.0", raw("0.1.7"))
        @test e.outcome == :newer
        @test e.message ==
              "document written by schema 0.1.7; this reader understands up to 0.1.0; " *
              "update the model package to one built from >= 0.1.7"
        e = err("0.2.0", raw("0.1.5"))
        @test e.outcome == :incompatible
        @test e.message ==
              "document written by schema 0.1.5 (line 0.1) cannot be read by schema 0.2.0 " *
              "(line 0.2): documents do not cross compatibility lines; migrating between " *
              "lines is a separate upgrade tool's job (psy5 bundles: PowerSystemsUpdater)"
        e = err("0.2.0-rc.1", raw("0.2.0"))
        @test e.message ==
              "document written by schema 0.2.0 cannot be read by schema 0.2.0-rc.1: dev " *
              "builds read only their own output"
        @test err(ICORE.READER_VERSION, Dict{String, Any}()).outcome == :missing
    end

    @testset "$kind reader rejects before decoding" for (
        kind,
        doc,
        from_json,
        read_path,
        reader_from_json,
    ) in (
        (
            "SystemDocument",
            _system(Dict{String, Any}()),
            PowerCoreOpenAPIModels.document_from_json,
            PowerCoreOpenAPIModels.read_document,
            PowerCoreOpenAPIModels._document_from_json,
        ),
        (
            "PortfolioDocument",
            _portfolio(Dict{String, Any}()),
            PowerInvestmentsOpenAPIModels.portfolio_document_from_json,
            PowerInvestmentsOpenAPIModels.read_portfolio_document,
            PowerInvestmentsOpenAPIModels._portfolio_document_from_json,
        ),
    )
        base = _raw(doc)
        # Unknown keys would trip strict decoding; the version check must win.
        base["surprise"] = 1
        base["components"]["Surprise"] = []

        for reader in (ICORE.READER_VERSION, "0.1.0", "0.1.9", "1.2.3")
            for (outcome, stamp) in _stamps(reader)
                raw = deepcopy(base)
                _stamp!(raw, stamp)
                e = _caught(
                    ICORE.SchemaVersionError,
                    () -> reader_from_json(raw, "doc", reader),
                )
                @test e.outcome == outcome
            end
        end

        for (outcome, stamp) in _stamps(ICORE.READER_VERSION)
            raw = deepcopy(base)
            _stamp!(raw, stamp)
            e = _caught(ICORE.SchemaVersionError, () -> from_json(raw))
            @test e.outcome == outcome

            mktempdir() do dir
                path = joinpath(dir, "doc.json")
                write(path, ICORE.JSON.json(raw))
                @test_throws ICORE.SchemaVersionError read_path(path)
            end
        end
    end

    @testset "round trip stamps the reader version and keeps the source version" begin
        r = ICORE.READER_VERSION
        for (doc, read_path) in (
            (_system(Dict{String, Any}()), PowerCoreOpenAPIModels.read_document),
            (
                _portfolio(Dict{String, Any}()),
                PowerInvestmentsOpenAPIModels.read_portfolio_document,
            ),
        )
            @test ICORE.get_source_schema_version(doc) == r
            mktempdir() do dir
                path = joinpath(dir, "doc.json")
                PowerCoreOpenAPIModels.write_document(doc, path)
                written = ICORE.JSON.parsefile(path; dicttype=Dict{String, Any})
                @test written["schema_version"] == r
                text = read(path, String)
                @test startswith(text, "{\"schema_version\":\"$r\"")
                @test ICORE.get_source_schema_version(read_path(path)) == r
            end
        end

        # An upgradable document (older patch, same line) reads, remembers its own version, and
        # is re-stamped by a `current` write. `0.1.5` stands in as the reader.
        raw = _raw(_system(Dict{String, Any}()))
        raw["schema_version"] = "0.1.0"
        old = PowerCoreOpenAPIModels._document_from_json(raw, "doc", "0.1.5")
        @test ICORE.get_source_schema_version(old) == "0.1.0"
        mktempdir() do dir
            path = joinpath(dir, "old.json")
            PowerCoreOpenAPIModels.write_document(old, path)
            @test ICORE.JSON.parsefile(path)["schema_version"] == ICORE.READER_VERSION
        end
        raw = _raw(_portfolio(Dict{String, Any}()))
        raw["schema_version"] = "0.1.0"
        @test ICORE.get_source_schema_version(
            PowerInvestmentsOpenAPIModels._portfolio_document_from_json(
                raw,
                "doc",
                "0.1.5",
            ),
        ) == "0.1.0"
    end

    @testset "upgrade_document re-stamps" begin
        mktempdir() do dir
            for (doc, upgrade, read_path) in (
                (
                    _system(Dict{String, Any}()),
                    PowerCoreOpenAPIModels.upgrade_document,
                    PowerCoreOpenAPIModels.read_document,
                ),
                (
                    _portfolio(Dict{String, Any}()),
                    PowerInvestmentsOpenAPIModels.upgrade_portfolio_document,
                    PowerInvestmentsOpenAPIModels.read_portfolio_document,
                ),
            )
                src = joinpath(dir, "src.json")
                dst = joinpath(dir, "dst.json")
                rm(src; force=true)
                rm(dst; force=true)
                PowerCoreOpenAPIModels.write_document(doc, src)
                upgrade(src, dst)
                @test ICORE.get_source_schema_version(read_path(dst)) ==
                      ICORE.READER_VERSION
                @test_throws ICORE.DocumentFormatError upgrade(src, dst)
                upgrade(src, dst; force=true)

                raw = ICORE.JSON.parsefile(src; dicttype=Dict{String, Any})
                raw["schema_version"] = _stamps(ICORE.READER_VERSION)[2][2]
                write(src, ICORE.JSON.json(raw))
                @test_throws ICORE.SchemaVersionError upgrade(src, dst; force=true)
            end
        end
    end

    @testset "canonical encoding" begin
        sys = _system(Dict{String, Any}())
        tree = PowerCoreOpenAPIModels.document_tree(sys)
        @test collect(keys(tree)) ==
              ["schema_version"; sort(collect(setdiff(keys(tree), ["schema_version"])))]
        @test !haskey(tree, "trading_hub_associations")
        @test tree["ext"] == Dict{String, Any}()
        push!(sys.trading_hub_associations, :row)
        @test haskey(PowerCoreOpenAPIModels.document_tree(sys), "trading_hub_associations")

        pf = _portfolio(Dict{String, Any}())
        ptree = PowerCoreOpenAPIModels.document_tree(pf)
        @test collect(keys(ptree)) ==
              ["schema_version"; sort(collect(setdiff(keys(ptree), ["schema_version"])))]
        @test ptree["ext"] == Dict{String, Any}()
        @test haskey(ptree, "base_system_file")
        @test haskey(ptree, "time_series_storage_file")
    end

    @testset "source write without a validator names the extra" begin
        # JSONSchema.jl is loaded in this suite, so reach the no-extension fallback directly.
        function no_validator()
            return invoke(
                ICORE._bundle_problems,
                Tuple{Any, Any},
                Dict{String, Any}(),
                Dict{String, Any}(),
            )
        end
        e = _caught(ICORE.DocumentFormatError, no_validator)
        @test occursin("JSONSchema.jl", sprint(showerror, e))
    end

    @testset "source write without a bundle or validator names the extra" begin
        sys = _system(Dict{String, Any}())
        sys.source_schema_version[] = "0.1.0"
        ICORE._VALIDATOR_LOADED[] = false
        try
            function validate()
                return ICORE._validate_target(
                    Val(:source),
                    sys,
                    Dict{String, Any}(),
                    "0.1.5",
                    mktempdir(),
                )
            end
            e = _caught(ICORE.DocumentFormatError, validate)
            @test occursin("JSONSchema.jl", sprint(showerror, e))
        finally
            ICORE._VALIDATOR_LOADED[] = true
        end
    end

    @testset "huge version components are valid versions" begin
        raw = Dict{String, Any}("schema_version" => "99999999999999999999.0.0")
        @test ICORE._check_schema_version("0.1.0", raw) == :incompatible
        @test ICORE._check_schema_version("99999999999999999999.0.0", raw) == :current
    end

    @testset "check_schema_version rejects a non-object root" begin
        for root in (Any[1], "0.1.0", 1, nothing)
            @test_throws ICORE.DocumentFormatError ICORE.check_schema_version(root)
        end
    end

    @testset "non-object root is a format error" begin
        mktempdir() do dir
            path = joinpath(dir, "array.json")
            write(path, "[1, 2]")
            for read_path in (
                PowerCoreOpenAPIModels.read_document,
                PowerInvestmentsOpenAPIModels.read_portfolio_document,
            )
                @test_throws ICORE.DocumentFormatError read_path(path)
            end
        end
    end

    @testset "bundle walk lists every offending path" begin
        minmax = Dict{String, Any}(
            "type" => "object",
            "required" => ["min", "max"],
            "additionalProperties" => false,
            "properties" => Dict{String, Any}(
                "min" => Dict("type" => "number"),
                "max" => Dict("type" => "number"),
            ),
        )
        bundle = Dict{String, Any}(
            "definitions" => Dict{String, Any}("MinMax" => minmax),
            "type" => "object",
            "properties" => Dict{String, Any}(
                "m" => Dict{String, Any}(
                    "type" => "object",
                    "additionalProperties" =>
                        Dict{String, Any}("\$ref" => "#/definitions/MinMax"),
                ),
                "kind" => Dict("type" => "string", "enum" => ["a"]),
            ),
        )
        tree = Dict{String, Any}(
            "m" => Dict{String, Any}(
                "12" => Dict{String, Any}("min" => 1, "max" => 2, "newkey" => 3),
                "A" => Dict{String, Any}("min" => 1),
            ),
            "kind" => "z",
        )
        problems = ICORE._bundle_problems(tree, bundle)
        @test problems == [
            "/kind: enum",
            "/m/12/newkey: property unknown to this schema",
            "/m/A/max: required property missing",
        ]
        @test problems == sort(problems)
        slashed = Dict{String, Any}("m" => Dict{String, Any}("a/b~c" => Dict("min" => 1)))
        @test ICORE._bundle_problems(slashed, bundle) ==
              ["/m/a~1b~0c/max: required property missing"]
        ext = Base.get_extension(ICORE, :InfrastructureCoreOpenAPIModelsJSONSchemaExt)
        issue = JSONSchema.validate(
            JSONSchema.Schema(Dict{String, Any}("required" => ["min"])),
            Dict{String, Any}(),
        )
        reported = String[]
        ext._report!(reported, issue, "")
        @test occursin("min", only(reported))
    end

    @testset "source write validates against the strict bundle" begin
        if !isfile(BUILD_BUNDLES)
            @warn "build_bundles.py not found; skipping source-write tests" BUILD_BUNDLES
        else
            mktempdir() do bundles
                run(
                    pipeline(
                        `python3 $BUILD_BUNDLES --root $SCHEMA_DIR --version 0.1.0 --out $bundles`;
                        stdout=devnull,
                    ),
                )
                @testset "composed schemas name every unknown key" begin
                    fixture = joinpath(
                        @__DIR__,
                        "fixtures",
                        "case14_operations.NATURAL_UNITS.json",
                    )
                    bundle = ICORE.JSON.parsefile(
                        joinpath(bundles, "0.1.0", "SystemDocument.json");
                        dicttype=Dict{String, Any},
                    )
                    tree = ICORE.JSON.parsefile(fixture; dicttype=Dict{String, Any})
                    components = tree["components"]
                    components["TransformerCircuit"][1]["new_a"] = 1
                    components["SwitchedAdmittance"][1]["new_b"] = 1
                    components["ThermalStandard"][1]["operation_cost"]["new_c"] = 1
                    tree["supplemental_attributes"][1]["new_d"] = 1
                    tree["supplemental_attributes"][1]["new_e"] = 2
                    problems = join(ICORE._bundle_problems(tree, bundle), "\n")
                    for key in (
                        "/components/TransformerCircuit/0/new_a",
                        "/components/SwitchedAdmittance/0/new_b",
                        "/components/ThermalStandard/0/operation_cost/new_c",
                        "/supplemental_attributes/0/new_d",
                        "/supplemental_attributes/0/new_e",
                    )
                        @test occursin(key * ": property unknown", problems)
                    end
                end

                reader = "0.1.5"
                function write_source(doc, path)
                    return ICORE._write_document(
                        doc,
                        path,
                        false,
                        false,
                        Val(:source),
                        reader,
                        bundles,
                    )
                end

                mktempdir() do dir
                    @testset "$kind" for (kind, make, from_json) in (
                        (
                            "SystemDocument",
                            _system,
                            PowerCoreOpenAPIModels._document_from_json,
                        ),
                        (
                            "PortfolioDocument",
                            _portfolio,
                            PowerInvestmentsOpenAPIModels._portfolio_document_from_json,
                        ),
                    )
                        ok = make(Dict{String, Any}())
                        ok.source_schema_version[] = "0.1.0"
                        path = joinpath(dir, "$kind-ok.json")
                        write_source(ok, path)
                        @test ICORE.JSON.parsefile(path)["schema_version"] == "0.1.0"
                        # Stamped at the source version, so the reader at `0.1.5` takes it.
                        back = from_json(
                            ICORE.JSON.parsefile(path; dicttype=Dict{String, Any}),
                            path,
                            reader,
                        )
                        @test ICORE.get_source_schema_version(back) == "0.1.0"

                        bad = make(
                            Dict{String, Any}("brand_new" => 1),
                            Dict{String, Any}("also_new" => 2, "third_new" => 3),
                        )
                        bad.source_schema_version[] = "0.1.0"
                        bad_path = joinpath(dir, "$kind-bad.json")
                        e = _caught(
                            ICORE.DocumentFormatError,
                            () -> write_source(bad, bad_path),
                        )
                        message = sprint(showerror, e)
                        @test count("property unknown", message) == 3
                        @test occursin(
                            r"/components/\w+/1/third_new: property unknown",
                            message,
                        )
                        @test occursin(
                            r"/components/\w+/0/brand_new: property unknown",
                            message,
                        )
                        @test occursin(
                            r"/components/\w+/1/also_new: property unknown",
                            message,
                        )
                        @test occursin("schema_version = :current", message)
                        @test !isfile(bad_path)

                        missing = make(Dict{String, Any}())
                        missing.source_schema_version[] = "0.1.3"
                        m_path = joinpath(dir, "m.json")
                        e = _caught(
                            ICORE.DocumentFormatError,
                            () -> write_source(missing, m_path),
                        )
                        @test occursin(
                            joinpath(bundles, "0.1.3", "$kind.json"),
                            sprint(showerror, e),
                        )

                        same = make(Dict{String, Any}("brand_new" => 1))
                        ICORE._write_document(
                            same,
                            joinpath(dir, "$kind-same.json"),
                            false,
                            false,
                            Val(:source),
                            ICORE.READER_VERSION,
                            bundles,
                        )
                        @test ICORE.JSON.parsefile(joinpath(dir, "$kind-same.json"))["schema_version"] ==
                              ICORE.READER_VERSION
                    end
                end
            end
        end
        @test_throws ArgumentError PowerCoreOpenAPIModels.write_document(
            _system(Dict{String, Any}()),
            tempname();
            schema_version=:bogus,
        )
    end
end
