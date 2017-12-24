# Getting Started

## Install

`ExtensibleScheduler` is a not a registered package.
To add it to your Julia packages, simply do the following in REPL:

```julia
Pkg.clone("https://github.com/scls19fr/ExtensibleScheduler.jl")
```

## Usage


````@eval
Markdown.parse("""
```julia
$(readstring("sample/sample.jl"))
```
""")
````
[Download example](sample/sample.jl)


## Library Outline

```@docs
ExtensibleScheduler
```

### Schedulers

```@docs
AbstractScheduler
```

```@docs
BlockingScheduler
```

```@docs
run(sched::BlockingScheduler)
```

```
add(sched::AbstractScheduler, action::Action, trigger::AbstractTrigger; name=DEFAULT_JOB_NAME, priority=DEFAULT_PRIORITY)
```

### Action

```@docs
Action
```

### Job

```@docs
Job
```

### JobStore

```@docs
MemoryJobStore
```

### Triggers

```@docs
Trigger
```

### private
```@docs
InstantTrigger
```

```@docs
TimeTrigger
```

```@docs
PeriodTrigger
```

```@docs
OffsetTrigger
```

```@docs
JitterTrigger
```

```@docs
TimeFrameTrigger
```

```@docs
CustomTrigger
```

## See also
 - [Sched.jl](https://github.com/scls19fr/Sched.jl) A [Julia](https://julialang.org/) events scheduler inspired by [Python sched](https://docs.python.org/3/library/sched.html).
 - [https://discourse.julialang.org/t/julia-cron-like-event-scheduler/6899](https://discourse.julialang.org/t/julia-cron-like-event-scheduler/6899)
