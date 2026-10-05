# The umbrella suite: cross-package invariants, the two hand-written document containers,
# and serde against real PowerFlowFileParser output. None of these is visible from inside a
# single package, which is why they live here; each generated package tests its own types.

using PowerOpenAPIModels
using InfrastructureCoreOpenAPIModels
using InfrastructureTimeSeriesOpenAPIModels
using PowerCoreOpenAPIModels
using PowerOperationsOpenAPIModels
using PowerInvestmentsOpenAPIModels
using PowerDynamicsOpenAPIModels
using Dates
using JSONSchema
using TOML
using Test

# SiennaSchemas tests/fixtures/single_time_series.json
time_series_row() = Dict{String, Any}(
    "association_id" => 1,
    "owner_id" => 42,
    "owner_type" => "ThermalStandard",
    "owner_category" => "Component",
    "time_series_type" => "SingleTimeSeries",
    "name" => "max_active_power",
    "features" => Dict{String, Any}("model_year" => 2030),
    "uri" => "infrastore://systems/base.h5",
    "element_type" => "f64",
    "element_shape" => Any[],
    "array_shape" => Any[8760],
    "units" => "MW",
    "quantity_kind" => "ActivePower",
    "unit_system" => "NATURAL_UNITS",
    "time_reference" => "America/Denver",
    "component_field" => "max_active_power",
    "initial_timestamp" => "2030-01-01T00:00:00Z",
    "resolution" => "PT1H",
    "length" => 8760,
)

"""
A document holding the decoded (schema-checked) `rows` as its association table.
"""
function time_series_document(rows)
    doc = PowerCoreOpenAPIModels.SystemDocument()
    for row in rows
        push!(
            doc.time_series_associations,
            InfrastructureCoreOpenAPIModels.decode(
                InfrastructureTimeSeriesOpenAPIModels.TimeSeriesAssociation,
                row,
            ),
        )
    end
    return doc
end

# Set SCHEMA_DIR to point the drift checks at a SiennaSchemas checkout; without one they
# warn and skip, so `Pkg.test` works from a plain registry install.
const SCHEMA_DIR =
    get(ENV, "SCHEMA_DIR", joinpath(dirname(dirname(@__DIR__)), "..", "SiennaSchemas"))

# DEGOV and DEGOV1 are BOTH real PowerSystems structs (src/models/generated/, 10 and 14
# fields) and both are declared in the dynamics selector, so the inline-alias check below
# flags a pair it cannot tell from a generated copy -- `SteamTurbineGov1` survives only
# because `SteamTurbineGov` happens not to exist. Exempted by name rather than fixed: the real
# fix is to check membership of the selector's published names, which generate_native.jl
# already computes as PUBLISHED_NAMES, instead of inferring from the name shape.
const REAL_SUFFIXED_TYPES = Set(["DEGOV1"])
_type_name(::Type{T}) where {T} = string(nameof(T))
_type_name(::Any) = ""

@testset "PowerOpenAPIModels" begin
    @testset "time_series_association_json is the table in wire form" begin
        second = merge(
            time_series_row(),
            Dict{String, Any}("association_id" => 2, "name" => "other"),
        )
        doc = time_series_document([time_series_row(), second])
        json = PowerCoreOpenAPIModels.time_series_association_json(doc)
        # The encoder writes initial_timestamp with milliseconds.
        wire(row) =
            merge(row, Dict{String, Any}("initial_timestamp" => "2030-01-01T00:00:00.000Z"))
        JSON = InfrastructureCoreOpenAPIModels.JSON
        @test JSON.parse(json) ==
              JSON.parse(JSON.json([wire(time_series_row()), wire(second)]))
        @test PowerCoreOpenAPIModels.time_series_association_json(
            PowerCoreOpenAPIModels.SystemDocument(),
        ) == "[]"
    end

    @testset "No duplicate type definitions" begin
        pkgs = [
            InfrastructureCoreOpenAPIModels,
            InfrastructureTimeSeriesOpenAPIModels,
            PowerCoreOpenAPIModels,
            PowerOperationsOpenAPIModels,
            PowerInvestmentsOpenAPIModels,
            PowerDynamicsOpenAPIModels,
        ]
        seen = Dict{Symbol, Module}()
        duplicates = String[]
        for pkg in pkgs
            for name in names(pkg)
                isdefined(pkg, name) || continue
                val = getfield(pkg, name)
                (val isa Type && parentmodule(val) == pkg) || continue
                if haskey(seen, name)
                    push!(duplicates, "$name in both $(seen[name]) and $pkg")
                end
                seen[name] = pkg
            end
        end
        @test isempty(duplicates)
    end

    # The check above catches one name claimed by two packages. It cannot see the other way a
    # generated type gets duplicated: the generator materializes an anonymous copy of a shared
    # schema at every reference site it cannot resolve to a named component, then disambiguates
    # the copies with a numeric suffix. Those copies are byte-identical to the original apart
    # from the name, and they fragment the API -- a value deserialized at one field site cannot
    # be passed where another site's copy is expected. So a `<Base><N>` type whose `<Base>` also
    # exists means a reference site failed to resolve, and the fix belongs in the bundle.
    #
    # Keyed on the base existing, not on the suffix: `SteamTurbineGov1` is a real
    # PowerSystems type name and must not be flagged.
    @testset "No unmapped inline schema aliases" begin
        pkgs = [
            InfrastructureCoreOpenAPIModels,
            InfrastructureTimeSeriesOpenAPIModels,
            PowerCoreOpenAPIModels,
            PowerOperationsOpenAPIModels,
            PowerInvestmentsOpenAPIModels,
            PowerDynamicsOpenAPIModels,
        ]
        defined = Set{String}()
        for pkg in pkgs
            for name in names(pkg)
                isdefined(pkg, name) || continue
                n = _type_name(getfield(pkg, name))
                if !isempty(n)
                    push!(defined, n)
                end
            end
        end
        aliases = filter(defined) do n
            base = replace(n, r"\d+$" => "")
            base != n && base in defined
        end
        @test sort(collect(setdiff(aliases, REAL_SUFFIXED_TYPES))) == String[]
    end

    # A selector declares every schema its domain reaches, shared types a base package owns
    # included, so a domain's declared set is wider than what its package defines. Unit methods
    # must follow ownership, not declaration: a method on a base package's type, emitted a second
    # time here, is a redefinition of that package's method. Julia makes that fatal -- "Method
    # overwriting is not permitted during Module precompilation" -- so the package silently stops
    # precompiling and every downstream load pays for it and warns. `owned_definitions` in
    # scripts/selector.jl is what keeps the two sets apart; this is the backstop.
    @testset "Unit methods are defined once, by the package that owns the type" begin
        unit_sources = Dict{Symbol, Vector{String}}()
        for pkg in [
            InfrastructureCoreOpenAPIModels,
            InfrastructureTimeSeriesOpenAPIModels,
            PowerCoreOpenAPIModels,
            PowerOperationsOpenAPIModels,
            PowerInvestmentsOpenAPIModels,
            PowerDynamicsOpenAPIModels,
        ]
            units = joinpath(pkgdir(pkg), "src", "units.jl")
            isfile(units) || continue
            for m in eachmatch(r"::Type\{([A-Za-z0-9_.]+)\}", read(units, String))
                name = Symbol(last(split(m.captures[1], '.')))
                push!(get!(unit_sources, name, String[]), string(pkg))
            end
        end
        overlapping = [
            "$name annotated in $(join(unique(pkgs), ", "))" for
            (name, pkgs) in unit_sources if length(unique(pkgs)) > 1
        ]
        @test isempty(overlapping)
    end

    @testset "Infrastructure packages carry no power dependency" begin
        for pkg in [InfrastructureCoreOpenAPIModels, InfrastructureTimeSeriesOpenAPIModels]
            deps = keys(TOML.parsefile(joinpath(pkgdir(pkg), "Project.toml"))["deps"])
            power = filter(startswith("Power"), collect(deps))
            @test isempty(power)
        end
        # ACBusType and ThermalFuels are the canaries: power enums that must not be
        # reachable from the generic packages.
        for sym in [:ACBusType, :ThermalFuels]
            @test !isdefined(InfrastructureCoreOpenAPIModels, sym)
            @test !isdefined(InfrastructureTimeSeriesOpenAPIModels, sym)
        end
    end

    # `SystemDocument` is the one type in these packages that is hand-written rather than
    # generated, because openapi-generator cannot express typed heterogeneous `components`
    # buckets. That makes it the one type that can silently drift from its schema, so the drift
    # is asserted here instead.
    @testset "SystemDocument matches its schema" begin
        schema_path = joinpath(SCHEMA_DIR, "Core", "SystemDocument.json")
        if !isfile(schema_path)
            @warn "SystemDocument.json not found; skipping drift check" schema_path
        else
            # InfrastructureCore already depends on JSON (document.jl needs JSON.lower), so read
            # the schema through it rather than making this harness carry its own dependency.
            schema = InfrastructureCoreOpenAPIModels.JSON.parsefile(schema_path)
            schema_fields = Set(keys(schema["properties"]))
            # `counter`, `component_types_by_id`, `service_membership`,
            # `trading_hub_membership`, and `source_schema_version` are build-time
            # scaffolding that is deliberately not serialized; `schema_version` is stamped
            # by the writer from the package's own version, so it has no field.
            struct_fields = union(
                setdiff(
                    Set(string.(fieldnames(PowerCoreOpenAPIModels.SystemDocument))),
                    Set([
                        "counter",
                        "component_types_by_id",
                        "service_membership",
                        "trading_hub_membership",
                        "source_schema_version",
                    ]),
                ),
                Set(["schema_version"]),
            )

            @test isempty(setdiff(schema_fields, struct_fields))
            @test isempty(setdiff(struct_fields, schema_fields))

            # Every required field must be one the container always emits.
            emitted = Set(
                keys(
                    PowerCoreOpenAPIModels.document_tree(
                        PowerCoreOpenAPIModels.SystemDocument(),
                    ),
                ),
            )
            @test isempty(setdiff(Set(schema["required"]), emitted))
        end
    end

    @testset "SystemDocument round-trips" begin
        doc = PowerCoreOpenAPIModels.SystemDocument(;
            name="validate",
            description="round-trip fixture",
            frequency=50.0,
        )
        bus_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            # ACBus lives in PowerCore, not Operations.
            PowerCoreOpenAPIModels.ACBus(;
                id=bus_id,
                name="b1",
                number=1,
                # An enum-constrained schema is a validating wrapper struct, not a bare
                # string, so this is a constructor call rather than a literal.
                bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
                available=true,
            ),
        )
        PowerCoreOpenAPIModels.set_ext!(doc, bus_id, Dict("Zone" => "1"))

        mktempdir() do dir
            path = joinpath(dir, "system.json")
            PowerCoreOpenAPIModels.write_document(doc, path)
            # Trailing newline, as the Python and TypeScript writers emit: without it a
            # document written here differs from the same document written there by one byte.
            @test endswith(read(path, String), "\n")
            back = PowerCoreOpenAPIModels.read_document(path)

            @test PowerCoreOpenAPIModels.get_name(back) == "validate"
            @test PowerCoreOpenAPIModels.get_description(back) == "round-trip fixture"
            @test PowerCoreOpenAPIModels.get_frequency(back) == 50.0
            # Buckets come back concretely typed, not as Vector{Any}.
            @test eltype(back.components["ACBus"]) === PowerCoreOpenAPIModels.ACBus
            @test PowerCoreOpenAPIModels.get_ext(back, bus_id)["Zone"] == "1"
            # Ids already handed out are not reissued after a read.
            @test PowerCoreOpenAPIModels.next_id!(back) > bus_id
        end
    end

    @testset "_highest_id reserves ids from components" begin
        # Components carry ids that must be reserved when reading a document;
        # `_highest_id` must walk them or a read document's id counter under-reserves
        # and `next_id!` can mint a colliding id.
        doc = PowerCoreOpenAPIModels.SystemDocument(;
            time_series_storage_file="fixture_time_series_storage.h5",
        )
        bus_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerCoreOpenAPIModels.ACBus(;
                id=bus_id,
                name="b1",
                number=1,
                bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
                available=true,
            ),
        )
        ts_id = PowerCoreOpenAPIModels.next_id!(doc)
        ts = InfrastructureTimeSeriesOpenAPIModels.SingleTimeSeries(;
            association_id=ts_id,
            owner_id=bus_id,
            owner_type="ACBus",
            owner_category=InfrastructureTimeSeriesOpenAPIModels.OwnerCategory("Component"),
            name="max_active_power",
            features=InfrastructureTimeSeriesOpenAPIModels.TimeSeriesFeatures(),
            uri="fixture_time_series_storage.h5",
            element_type="Float64",
            element_shape=Int64[],
            initial_timestamp=DateTime(2024, 1, 1),
            resolution="PT1H",
            length=24,
            time_series_type="SingleTimeSeries",
        )
        PowerCoreOpenAPIModels.add_time_series_association!(
            doc,
            InfrastructureTimeSeriesOpenAPIModels.TimeSeriesAssociation(ts),
        )

        mktempdir() do dir
            path = joinpath(dir, "system_ts.json")
            PowerCoreOpenAPIModels.write_document(doc, path)
            back = PowerCoreOpenAPIModels.read_document(path)
            @test PowerCoreOpenAPIModels.next_id!(back) > bus_id
        end
    end

    @testset "SystemDocument reads a document with no ext key" begin
        # `ext` is optional in the schema (Core/SystemDocument.json's `required` list omits
        # it); a producer that mapped every field is allowed to omit the key entirely.
        doc = PowerCoreOpenAPIModels.SystemDocument()
        bus_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerCoreOpenAPIModels.ACBus(;
                id=bus_id,
                name="b1",
                number=1,
                bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
                available=true,
            ),
        )
        raw = InfrastructureCoreOpenAPIModels.JSON.parse(
            InfrastructureCoreOpenAPIModels.JSON.json(
                PowerCoreOpenAPIModels.document_tree(doc),
            ),
        )
        delete!(raw, "ext")
        back = PowerCoreOpenAPIModels.document_from_json(raw)
        @test isempty(PowerCoreOpenAPIModels.get_ext(back, bus_id))
    end

    @testset "SystemDocument reads a document written before trading hubs" begin
        # Every document written before `trading_hub_associations` existed omits the key.
        # Reading one back is the whole reason the field is optional, so assert it directly
        # rather than trusting the schema's `required` list to stay correct.
        doc = PowerCoreOpenAPIModels.SystemDocument()
        bus_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerCoreOpenAPIModels.ACBus(;
                id=bus_id,
                name="b1",
                number=1,
                bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
                available=true,
            ),
        )
        encoded = InfrastructureCoreOpenAPIModels.JSON.parse(
            InfrastructureCoreOpenAPIModels.JSON.json(
                PowerCoreOpenAPIModels.document_tree(doc),
            ),
        )

        raw = deepcopy(encoded)
        delete!(raw, "trading_hub_associations")
        back = PowerCoreOpenAPIModels.document_from_json(raw)
        @test isempty(back.trading_hub_associations)
        @test isempty(back.trading_hub_membership)

        # The siblings stay required: omitting one is still malformed input.
        raw2 = deepcopy(encoded)
        delete!(raw2, "service_associations")
        @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.document_from_json(
            raw2,
        )
    end

    @testset "SystemDocument rejects malformed input" begin
        @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError InfrastructureCoreOpenAPIModels.model_type(
            "NoSuchType",
        )

        # An unresolved reference must error rather than be dropped.
        doc = PowerCoreOpenAPIModels.SystemDocument()
        bus_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerCoreOpenAPIModels.ACBus(;
                id=bus_id,
                name="b1",
                number=1,
                bustype=PowerCoreOpenAPIModels.ACBusType("REF"),
                available=true,
            ),
        )
        push!(
            doc.supplemental_attribute_associations,
            InfrastructureCoreOpenAPIModels.SupplementalAttributeAssociation(;
                component_id=bus_id,
                component_type="ACBus",
                attribute_id=9999,
                attribute_type="OnlineReserve",
            ),
        )
        @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.validate_document(
            doc,
        )
    end

    # `PortfolioDocument` is hand-written for the same reason as `SystemDocument` (typed
    # heterogeneous `components` buckets openapi-generator cannot express), so it can drift from
    # its schema the same way and is asserted the same way.
    @testset "PortfolioDocument matches its schema" begin
        schema_path = joinpath(SCHEMA_DIR, "Investments", "PortfolioDocument.json")
        if !isfile(schema_path)
            @warn "PortfolioDocument.json not found; skipping drift check" schema_path
        else
            schema = InfrastructureCoreOpenAPIModels.JSON.parsefile(schema_path)
            schema_fields = Set(keys(schema["properties"]))
            # `counter`, `component_types_by_id`, `requirements_membership`, and
            # `source_schema_version` are build-time scaffolding that is deliberately not
            # serialized; `schema_version` is stamped by the writer.
            struct_fields = union(
                setdiff(
                    Set(
                        string.(
                            fieldnames(PowerInvestmentsOpenAPIModels.PortfolioDocument),
                        ),
                    ),
                    Set([
                        "counter",
                        "component_types_by_id",
                        "requirements_membership",
                        "source_schema_version",
                    ]),
                ),
                Set(["schema_version"]),
            )

            @test isempty(setdiff(schema_fields, struct_fields))
            @test isempty(setdiff(struct_fields, schema_fields))

            # Every required field must be one the container always emits.
            emitted = Set(
                keys(
                    PowerCoreOpenAPIModels.document_tree(
                        PowerInvestmentsOpenAPIModels.PortfolioDocument("Zone"),
                    ),
                ),
            )
            @test isempty(setdiff(Set(schema["required"]), emitted))
        end
    end

    @testset "PortfolioDocument round-trips requirements_associations" begin
        doc = PowerInvestmentsOpenAPIModels.PortfolioDocument("Zone"; name="validate")
        # A policy requirement (the service) and a member subject to it. Both are components, so
        # both ids resolve in `validate_document`; the member reuses a requirement type here only
        # to keep the fixture minimal (its identity as a component id is all the ref-check needs).
        requirement_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerInvestmentsOpenAPIModels.MaximumCapacityRequirements(;
                id=requirement_id,
                name="cap_req",
                available=true,
            ),
        )
        member_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerInvestmentsOpenAPIModels.MaximumCapacityRequirements(;
                id=member_id,
                name="member",
                available=true,
            ),
        )
        PowerInvestmentsOpenAPIModels.add_requirement_association!(
            doc,
            PowerInvestmentsOpenAPIModels.RequirementAssociation(;
                requirement_id=requirement_id,
                entity_id=member_id,
            ),
        )

        # The membership cache is the document's one duplicate guard.
        @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerInvestmentsOpenAPIModels.add_requirement_association!(
            doc,
            PowerInvestmentsOpenAPIModels.RequirementAssociation(;
                requirement_id=requirement_id,
                entity_id=member_id,
            ),
        )

        mktempdir() do dir
            path = joinpath(dir, "portfolio.json")
            PowerCoreOpenAPIModels.write_document(doc, path)
            @test endswith(read(path, String), "\n")
            back = PowerInvestmentsOpenAPIModels.read_portfolio_document(path)

            @test PowerCoreOpenAPIModels.get_name(back) == "validate"
            @test PowerInvestmentsOpenAPIModels.get_aggregation(back) == "Zone"
            @test length(back.requirements_associations) == 1
            # A first-class Investments type, so the bucket comes back concretely typed.
            @test eltype(back.requirements_associations) ===
                  PowerInvestmentsOpenAPIModels.RequirementAssociation
            assoc = only(back.requirements_associations)
            @test assoc.requirement_id == requirement_id
            @test assoc.entity_id == member_id
            # Membership rebuilt on read, so the duplicate guard survives a round trip.
            @test (Int(requirement_id), Int(member_id)) in back.requirements_membership
        end
    end

    @testset "PortfolioDocument emits no additional_properties passthrough" begin
        # `document_tree` must route every array through `_bucket` (i.e. `_encode`), the same
        # as SystemDocument's does. Handing the structs over raw serialized each one field by
        # field, so every association row grew an empty `"additional_properties": {}` that the
        # schema never names and the other two languages never write.
        doc = PowerInvestmentsOpenAPIModels.PortfolioDocument("Zone"; name="passthrough")
        requirement_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerInvestmentsOpenAPIModels.MaximumCapacityRequirements(;
                id=requirement_id,
                name="cap_req",
                available=true,
            ),
        )
        member_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_component!(
            doc,
            PowerInvestmentsOpenAPIModels.MaximumCapacityRequirements(;
                id=member_id,
                name="member",
                available=true,
            ),
        )
        PowerInvestmentsOpenAPIModels.add_requirement_association!(
            doc,
            PowerInvestmentsOpenAPIModels.RequirementAssociation(;
                requirement_id=requirement_id,
                entity_id=member_id,
            ),
        )
        attribute_id = PowerCoreOpenAPIModels.next_id!(doc)
        PowerCoreOpenAPIModels.add_supplemental_attribute!(
            doc,
            PowerInvestmentsOpenAPIModels.TopologyMapping(;
                id=attribute_id,
                buses=["bus1"],
            ),
            requirement_id,
        )

        mktempdir() do dir
            path = joinpath(dir, "portfolio.json")
            PowerCoreOpenAPIModels.write_document(doc, path)
            text = read(path, String)
            @test !occursin("additional_properties", text)
            # Still a readable document, not merely a smaller one.
            back = PowerInvestmentsOpenAPIModels.read_portfolio_document(path)
            @test length(back.requirements_associations) == 1
            @test length(back.supplemental_attribute_associations) == 1
        end
    end

    @testset "PortfolioDocument requires requirements_associations" begin
        # The field is required: a document omitting the key is malformed input, not an empty
        # requirement set.
        doc = PowerInvestmentsOpenAPIModels.PortfolioDocument("Zone")
        raw = InfrastructureCoreOpenAPIModels.JSON.parse(
            InfrastructureCoreOpenAPIModels.JSON.json(
                PowerCoreOpenAPIModels.document_tree(doc),
            ),
        )
        delete!(raw, "requirements_associations")
        @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerInvestmentsOpenAPIModels.portfolio_document_from_json(
            raw,
        )
    end

    @testset "every registered type is a generated model struct" begin
        # Generated models share no common supertype, so `isstructtype` is what catches a
        # registered non-model type.
        @test !isempty(InfrastructureCoreOpenAPIModels.MODEL_TYPES)
        for (name, T) in InfrastructureCoreOpenAPIModels.MODEL_TYPES
            @test isstructtype(T)
            @test string(nameof(T)) == name
        end
    end

    @testset "_rows keeps row order and reports the first bad row" begin
        fixture = joinpath(@__DIR__, "fixtures", "case14_operations.COMPONENT_BASE.json")
        template = first(
            InfrastructureCoreOpenAPIModels.JSON.parsefile(
                fixture;
                dicttype=Dict{String, Any},
            )["components"]["ACBus"],
        )
        bus(i) =
            merge(template, Dict{String, Any}("id" => i, "name" => "b$i", "number" => i))
        raws = [bus(i) for i in 1:2_000]
        decoded = InfrastructureCoreOpenAPIModels._rows(PowerCoreOpenAPIModels.ACBus, raws)
        @test [b.number for b in decoded] == 1:2_000
        @test isempty(
            InfrastructureCoreOpenAPIModels._rows(PowerCoreOpenAPIModels.ACBus, ()),
        )

        # Two different schema violations, so the message names which row was reported.
        raws[300]["available"] = 1
        raws[1_700]["number"] = "x"
        for _ in 1:20
            err = try
                InfrastructureCoreOpenAPIModels._rows(PowerCoreOpenAPIModels.ACBus, raws)
                nothing
            catch e
                e
            end
            @test err isa
                  InfrastructureCoreOpenAPIModels.OpenAPI.Runtime.SchemaValidationError
            @test occursin("available", sprint(showerror, err))
        end
    end

    @testset "validate_time_series_catalog checks the catalog against the document" begin
        JSON = InfrastructureCoreOpenAPIModels.JSON
        DocumentFormatError = InfrastructureCoreOpenAPIModels.DocumentFormatError
        SchemaValidationError =
            InfrastructureCoreOpenAPIModels.OpenAPI.Runtime.SchemaValidationError
        doc = time_series_document([time_series_row()])
        check(rows) =
            PowerCoreOpenAPIModels.validate_time_series_catalog(doc, JSON.json(rows))
        edited(changes...) = merge(time_series_row(), Dict{String, Any}(changes...))
        other = edited("association_id" => 2, "name" => "not_in_the_document")

        @test isnothing(check([time_series_row()]))
        @test isnothing(check([time_series_row(), other]))
        # A store may assign its own locator and hash.
        @test isnothing(check([edited("uri" => "elsewhere", "data_hash" => "abc123")]))

        @test_throws r"no matching row" check([other])
        @test_throws r"association_id" check([edited("association_id" => 7)])
        @test_throws r"drifted from the time series catalog on: length" check([
            edited("length" => 1),
        ])
        # Features are part of the identity, so a changed value is a missing row, not drift.
        @test_throws r"no matching row" check([
            edited("features" => Dict{String, Any}("model_year" => 2040)),
        ])
        @test_throws DocumentFormatError check([edited("length" => 1)])

        # Every catalog row gets the schema check, matched or not.
        reserved = Dict{String, Any}("resolution" => "PT1H")
        @test_throws SchemaValidationError check([
            time_series_row(),
            merge(other, Dict{String, Any}("features" => reserved)),
        ])
        @test_throws SchemaValidationError check([edited("uri" => 5)])
        @test_throws SchemaValidationError check([edited("data_hash" => nothing)])

        # A type without `resolution` or `interval` matches itself.
        nonsequential = Dict{String, Any}(
            "association_id" => 3,
            "owner_id" => 42,
            "owner_type" => "ThermalStandard",
            "owner_category" => "Component",
            "time_series_type" => "NonSequentialTimeSeries",
            "name" => "scenarios",
            "features" => Dict{String, Any}(),
            "uri" => "infrastore://systems/base.h5",
            "element_type" => "f64",
            "element_shape" => Any[],
            "length" => 4,
        )
        nonsequential_doc = time_series_document([nonsequential])
        @test isnothing(
            PowerCoreOpenAPIModels.validate_time_series_catalog(
                nonsequential_doc,
                JSON.json([nonsequential]),
            ),
        )

        # The owner category is part of the identity.
        @test_throws r"no matching row" check([
            edited("owner_category" => "SupplementalAttribute"),
        ])
    end

    include("serde_fixture.jl")
    include("schema_version.jl")
end
