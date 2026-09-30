using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using TOML
using Test

const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

@testset "InfrastructureCoreOpenAPIModels" begin
    @testset "a model round-trips through JSON" begin
        bounds = MinMax(; min=0.0, max=1.0)
        text = JSON.json(encode(bounds))
        @test text == "{\"max\":1.0,\"min\":0.0}"

        back = decode(MinMax, JSON.parse(text))
        @test back.min == 0.0
        @test back.max == 1.0
        @test JSON.json(encode(back)) == text
    end

    @testset "an absent optional field is omitted from the document" begin
        # ABSENT is the "field not present" state, distinct from a field set to null: it
        # encodes to no key at all, so a document round-trips without gaining keys the
        # producer never wrote.
        @test !haskey(encode(MinMax(; min=0.0)), "max")
        @test decode(MinMax, Dict{String, Any}("min" => 0.0)).max === IC.ABSENT
    end

    @testset "decoding enforces the schema" begin
        @test_throws SchemaValidationError decode(
            LinearFunctionData,
            Dict{String, Any}("constant_term" => 1.0),
        )
        @test_throws SchemaValidationError decode(
            MinMax,
            Dict{String, Any}("min" => "not a number"),
        )

        curve = decode(
            LinearFunctionData,
            Dict{String, Any}(
                "constant_term" => 1.0,
                "proportional_term" => 2.0,
                "function_type" => "LINEAR",
            ),
        )
        @test curve.proportional_term == 2.0
    end

    @testset "an enum wrapper rejects a value outside its schema" begin
        @test string(UnitSystem("NATURAL_UNITS")) == "NATURAL_UNITS"
        @test_throws ArgumentError UnitSystem("SYSTEM_BASE")
        @test_throws SchemaValidationError decode(UnitSystem, "SYSTEM_BASE")
    end

    @testset "unknown properties survive a round trip" begin
        # `additional_properties` is what keeps a document written by a newer producer
        # readable: an unmodelled key is carried, not dropped.
        back = decode(MinMax, Dict{String, Any}("min" => 0.0, "note" => "extra"))
        @test back.additional_properties["note"] == "extra"
        @test encode(back)["note"] == "extra"
    end

    @testset "the model-type registry resolves names" begin
        @test !isempty(IC.MODEL_TYPES)
        for (name, T) in IC.MODEL_TYPES
            @test isstructtype(T)
            @test string(nameof(T)) == name
        end
        @test IC.has_model_type("MinMax")
        @test IC.model_type("MinMax") === MinMax
        # A document naming a type this build has no model for cannot be read faithfully,
        # so the lookup errors rather than dropping the rows.
        @test !IC.has_model_type("NoSuchType")
        @test_throws IC.DocumentFormatError IC.model_type("NoSuchType")
    end

    @testset "the unit vocabulary is keyed by quantity and unit" begin
        @test has_conversion_factor("ActivePower", "MW")
        @test conversion_factor("ActivePower", "MW") == 1.0
        @test conversion_factor("ActivePower", "kW") ≈ 0.001
        @test conversion_factor("Angle", "deg") ≈ pi / 180
        # Keyed by the pair, so a unit real for one quantity is absent for another.
        @test !has_conversion_factor("ActivePower", "MJ")
        @test conversion_factor("ElectricalEnergy", "MJ") ≈ 0.0002777777777777778
        # `pu` needs a base, not a factor, so it is deliberately unconvertible.
        for quantity in ("Voltage", "Resistance", "Reactance", "Susceptance", "Conductance")
            @test !has_conversion_factor(quantity, "pu")
        end
    end

    @testset "an unannotated property falls through to the generic fallback" begin
        @test !has_declared_unit(MinMax, Val(:min))
        @test !has_unit_base(MinMax, Val(:min))
    end

    @testset "this package carries no power dependency" begin
        # The layering the whole split exists to enforce: a domain-neutral package must
        # stay loadable without any power schema.
        deps = keys(TOML.parsefile(joinpath(pkgdir(IC), "Project.toml"))["deps"])
        @test isempty(filter(startswith("Power"), collect(deps)))
        # Canaries: power enums that must not be reachable from here.
        for sym in [:ACBusType, :ThermalFuels]
            @test !isdefined(IC, sym)
        end
    end

    @testset "no unmapped inline schema alias" begin
        # The generator materializes an anonymous copy of a shared schema at every
        # reference site it cannot resolve to a named component, disambiguated with a
        # numeric suffix. A `<Base><N>` whose `<Base>` also exists means a reference site
        # failed to resolve, and the two copies fragment the API.
        defined = Set(
            string(nameof(getfield(IC, n))) for
            n in names(IC) if isdefined(IC, n) && getfield(IC, n) isa Type
        )
        aliases = filter(defined) do n
            base = replace(n, r"\d+$" => "")
            base != n && base in defined
        end
        @test sort(collect(aliases)) == String[]
    end
end
