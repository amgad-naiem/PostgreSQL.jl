module PostgreSQL
    export  Postgres,
            executemany,
            copy_from,
            escapeliteral

    const depsfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
    if isfile(depsfile)
        include(depsfile)
    else
        error("PostgreSQL not properly installed. Please run Pkg.build(\"PostgreSQL\")")
    end

    include("libpq_interface.jl")
    using .libpq_interface
    using DBI
    using DataFrames

    include("types.jl")
    include("dbi_impl.jl")
end
