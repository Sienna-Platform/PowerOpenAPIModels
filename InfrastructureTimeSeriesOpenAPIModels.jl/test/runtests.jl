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
end
