#!/usr/bin/env julia
# Unit annotations generated from SiennaSchemas x-unit into each package.

using Test
using OpenAPI
using PowerCoreOpenAPIModels
using PowerOperationsOpenAPIModels

const PC = PowerCoreOpenAPIModels
const PO = PowerOperationsOpenAPIModels

@testset "fixed x-unit resolves through Core's function" begin
    @test PC.has_declared_unit(PO.ACBus, Val(:angle))
    @test PC.declared_unit(PO.ACBus, Val(:angle)) == "rad"
    @test PC.declared_unit(PO.ACBus, Val(:base_voltage)) == "kV"
    @test PC.declared_unit(PO.Line, Val(:r)) == "pu"
    @test !PC.has_declared_unit(PO.ACBus, Val(:name))
end

@testset "every annotated property also declares a quantity" begin
    @test PC.declared_quantity(PO.ACBus, Val(:base_voltage)) == "Voltage"
    @test PC.declared_quantity(PO.ACBus, Val(:angle)) == "Angle"
    @test PC.declared_quantity(PO.ThermalStandard, Val(:base_power)) == "ApparentPower"
end

@testset "ambiguous unit m resolves to Elevation, not Length" begin
    @test PC.declared_unit(PO.HydroTurbine, Val(:powerhouse_elevation)) == "m"
    @test PC.declared_quantity(PO.HydroTurbine, Val(:powerhouse_elevation)) == "Elevation"
    @test PC.declared_quantity(PO.HydroReservoir, Val(:intake_elevation)) == "Elevation"
end

@testset "x-unit-base names a sibling property" begin
    @test PC.has_unit_base(PO.ACBus, Val(:magnitude))
    @test PC.unit_base(PO.ACBus, Val(:magnitude)) == :base_voltage
end

@testset "discriminated x-units read the instance" begin
    line = PO.TwoTerminalLCCLine()
    # DEVICE_BASE, not SYSTEM_BASE: the schemas carry no system-base option — per-unit data
    # historically on the system base records that base in the component's own `base_power`
    # and rides as DEVICE_BASE.
    line.parameter_units = "DEVICE_BASE"
    @test PC.declared_unit(line, Val(:r)) == "pu"
    line.parameter_units = "NATURAL_UNITS"
    @test PC.declared_unit(line, Val(:r)) == "ohm"
end

@testset "vocabulary is keyed by quantity and unit" begin
    @test PC.has_conversion_factor("ActivePower", "MW")
    @test PC.conversion_factor("ActivePower", "MW") == 1.0
    @test PC.conversion_factor("ElectricalEnergy", "MJ") ≈ 0.0002777777777777778
    @test PC.conversion_factor("Length", "m") ≈ 0.001
    @test PC.conversion_factor("Elevation", "m") == 1.0
    # Keyed by the pair, so a unit real for one quantity is absent for another: MJ resolves
    # under ElectricalEnergy above but not here. (This asserted `kW` until the vocabulary
    # grew SI prefixes — kW is now a valid ActivePower unit at 0.001.)
    @test PC.has_conversion_factor("ActivePower", "kW")
    @test PC.conversion_factor("ActivePower", "kW") ≈ 0.001
    @test !PC.has_conversion_factor("ActivePower", "MJ")
end

@testset "Angle supports both rad and deg" begin
    @test PC.conversion_factor("Angle", "rad") == 1.0
    @test PC.conversion_factor("Angle", "deg") ≈ pi / 180
end

@testset "pu remains unconvertible: it needs a base, not a factor" begin
    for quantity in ("Voltage", "Resistance", "Reactance", "Susceptance", "Conductance")
        @test !PC.has_conversion_factor(quantity, "pu")
    end
end

@testset "unannotated properties fall through to the generic fallback" begin
    @test !PC.has_declared_unit(PO.Arc, Val(:from))
    @test !PC.has_unit_base(PO.Line, Val(:r))
end
