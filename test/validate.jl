#!/usr/bin/env julia
# Basic validation: packages load, exports resolve, no duplicate type definitions.

using Pkg, Test

Pkg.develop([
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
    PackageSpec(path="PowerOpenAPIModels.jl"),
])

@testset "Packages load" begin
    @test (using PowerCoreOpenAPIModels; true)
    @test (using PowerOperationsOpenAPIModels; true)
    @test (using PowerInvestmentsOpenAPIModels; true)
    @test (using PowerDynamicsOpenAPIModels; true)
    @test (using PowerOpenAPIModels; true)
end

@testset "No duplicate type definitions" begin
    pkgs = [
        PowerCoreOpenAPIModels,
        PowerOperationsOpenAPIModels,
        PowerInvestmentsOpenAPIModels,
        PowerDynamicsOpenAPIModels,
    ]
    seen = Dict{Symbol, Module}()
    for pkg in pkgs
        for name in names(pkg)
            isdefined(pkg, name) || continue
            val = getfield(pkg, name)
            (val isa Type && parentmodule(val) == pkg) || continue
            if haskey(seen, name)
                error("Type $name defined in both $(seen[name]) and $pkg")
            end
            seen[name] = pkg
        end
    end
    @test true
end
