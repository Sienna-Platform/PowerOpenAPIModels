using InfrastructureTimeSeriesOpenAPIModels
using InfrastructureCoreOpenAPIModels
using Dates
using JSON
using OpenAPI
using TOML
using Test

const ITS = InfrastructureTimeSeriesOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

function single_time_series(; kwargs...)
    return SingleTimeSeries(;
        association_id=1,
        owner_id=2,
        owner_type="ACBus",
        owner_category=OwnerCategory("Component"),
        name="max_active_power",
        features=TimeSeriesFeatures(),
        uri="time_series_storage.h5",
        element_type="Float64",
        element_shape=Int64[],
        initial_timestamp=DateTime(2024, 1, 1),
        resolution="PT1H",
        length=24,
        time_series_type="SingleTimeSeries",
        kwargs...,
    )
end

_registrable(::Type{T}) where {T <: IC.APIModel} = parentmodule(T) === ITS
_registrable(::Type{<:IC.EnumAPIModel}) = false
_registrable(::Any) = false

@testset "InfrastructureTimeSeriesOpenAPIModels" begin
    @testset "an association round-trips through JSON" begin
        series = single_time_series()
        text = JSON.json(encode(series))
        back = decode(SingleTimeSeries, JSON.parse(text))

        @test back.name == "max_active_power"
        @test back.initial_timestamp == DateTime(2024, 1, 1)
        @test back.length == 24
        @test string(back.owner_category) == "Component"
        @test JSON.json(encode(back)) == text
    end

    @testset "dense values are never carried inline" begin
        # The association names where the array lives; it never holds the array. A
        # generated field for the values themselves would mean the schema had drifted.
        @test :uri in fieldnames(SingleTimeSeries)
        @test isempty(intersect(fieldnames(SingleTimeSeries), (:data, :values)))
    end

    @testset "decoding enforces required fields" begin
        raw = Dict{String, Any}(encode(single_time_series()))
        delete!(raw, "length")
        @test_throws SchemaValidationError decode(SingleTimeSeries, raw)
    end

    @testset "an enum wrapper rejects a value outside its schema" begin
        @test_throws ArgumentError OwnerCategory("NotAnOwner")
        @test string(OwnerCategory("SupplementalAttribute")) == "SupplementalAttribute"
    end

    @testset "the association wrapper dispatches on its discriminator" begin
        # `time_series_type` is what picks the variant on read, so a wrapper built from a
        # `SingleTimeSeries` has to come back as one rather than as the first member.
        wrapper = TimeSeriesAssociation(single_time_series())
        @test wrapper isa IC.OneOfAPIModel
        back = decode(TimeSeriesAssociation, JSON.parse(JSON.json(encode(wrapper))))
        @test back.value isa SingleTimeSeries
        @test back.value.name == "max_active_power"
    end

    @testset "a tagged time series row is checked against its selected variant" begin
        # SiennaSchemas tests/fixtures/single_time_series.json
        row() = Dict{String, Any}(
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
        message(f) = try
            f()
            ""
        catch e
            e isa SchemaValidationError || rethrow()
            sprint(showerror, e)
        end

        good = decode(TimeSeriesAssociation, row())
        @test good.value isa SingleTimeSeries
        # The encoder writes timestamps with milliseconds.
        encoded = merge(row(), Dict("initial_timestamp" => "2030-01-01T00:00:00.000Z"))
        @test JSON.parse(JSON.json(encode(good))) == JSON.parse(JSON.json(encoded))

        # The schema reserves `resolution` as a feature name; the structural decode accepts it.
        reserved = row()
        reserved["features"] = Dict{String, Any}("resolution" => "PT1H")
        decode_message = message(() -> decode(TimeSeriesAssociation, reserved))
        @test occursin("decoding TimeSeriesAssociation", decode_message)
        @test occursin("features", decode_message)
        unchecked = decode(TimeSeriesAssociation, reserved, false)
        @test occursin("features", message(() -> encode(unchecked)))

        unknown = row()
        unknown["time_series_type"] = "NoSuchSeries"
        @test_throws OpenAPI.Runtime.DecodeError decode(TimeSeriesAssociation, unknown)
        untagged = row()
        delete!(untagged, "time_series_type")
        @test_throws OpenAPI.Runtime.DecodeError decode(TimeSeriesAssociation, untagged)
    end

    @testset "the six association types are registered" begin
        for name in (
            "SingleTimeSeries",
            "NonSequentialTimeSeries",
            "Deterministic",
            "DeterministicSingleTimeSeries",
            "Probabilistic",
            "Scenarios",
        )
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(ITS, Symbol(name))
        end
    end

    @testset "this package carries no power dependency" begin
        deps = keys(TOML.parsefile(joinpath(pkgdir(ITS), "Project.toml"))["deps"])
        @test isempty(filter(startswith("Power"), collect(deps)))
        for sym in [:ACBusType, :ThermalFuels]
            @test !isdefined(ITS, sym)
        end
    end

    # A type missing from register.jl leaves a document that holds it unreadable.
    @testset "every non-enum type this package defines is registered" begin
        own = [n for n in names(ITS) if _registrable(getfield(ITS, n))]
        @test :SingleTimeSeries in own
        for n in own
            @test IC.model_type(string(n)) === getfield(ITS, n)
        end
    end
end
