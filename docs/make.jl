using Documenter
using AdvancedScheduler


makedocs(
    format = :html,
    sitename = "ExtensibleScheduler.jl",
    pages = [
        "index.md",
        "getting_started.md",
    ]
)

deploydocs(
    repo = "github.com/scls19fr/ExtensibleScheduler.jl.git",
    julia  = "0.6",
    latest = "master",
    target = "build",
    deps = nothing,  # we use the `format = :html`, without `mkdocs`
    make = nothing,  # we use the `format = :html`, without `mkdocs`
)
