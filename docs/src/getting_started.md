# Getting Started

```@meta
CurrentModule = ExtensibleScheduler
```

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
add(sched::AbstractScheduler, action::Action, trigger::AbstractTrigger; name=DEFAULT_JOB_NAME, priority=DEFAULT_PRIORITY)
```

```@docs
run(sched::BlockingScheduler)
```

```@docs
run_pending(sched::BlockingScheduler)
```

```@docs
shutdown(sched::BlockingScheduler)
```

### Action

```@docs
Action
```

```@docs
run(action::Action)
```

### JobStore

```@docs
AbstractJobStore
```

```@docs
MemoryJobStore
```

### Triggers

#### Triggers construction
```@docs
Trigger
```

#### Trigger iteration

Iteration can help to know when job should be triggered.

```@docs
iterate(trigger::AbstractTrigger, dt; n=-1)
```

#### Private
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
TimeFrameTrigger
```

```@docs
CustomTrigger
```

```@docs
NoTrigger
```

#### Triggers operations
```@docs
TriggerOffset
```

```@docs
TriggerJitter
```

### Internals
### Job

```@docs
Job
```

### Priority

```@docs
Priority
```

## See also
 - [Sched.jl](https://github.com/scls19fr/Sched.jl) A [Julia](https://julialang.org/) events scheduler inspired by [Python sched](https://docs.python.org/3/library/sched.html).
 - [https://discourse.julialang.org/t/julia-cron-like-event-scheduler/6899](https://discourse.julialang.org/t/julia-cron-like-event-scheduler/6899)
