import Base: start, done, next

"""
    iterate(trigger, dt[, n=-1])


Iterate from instant `dt` using trigger with a given iteration number `n`
if `n < 0` (`-1` by default), it iterates indefinitely.

# Usage
```
julia> trigger = Trigger(Dates.Time(20, 30))

julia> for dt in iterate(trigger, DateTime(2020, 1, 1), n=3)
         @show dt
       end
dt = 2020-01-01T20:30:00
dt = 2020-01-02T20:30:00
dt = 2020-01-03T20:30:00

julia> collect(iterate(trigger, DateTime(2020, 1, 1), n=3))
3-element Array{Any,1}:
 2020-01-01T20:30:00
 2020-01-02T20:30:00
 2020-01-03T20:30:00
```
"""
function iterate(trigger::AbstractTrigger, dt; n=-1)
    TriggerIterator(trigger, dt, n)
end

abstract type AbstractTriggerIterator end

struct FiniteTriggerIterator <: AbstractTriggerIterator
    trigger::AbstractTrigger
    dt
    n::Int
end

struct InfiniteTriggerIterator <: AbstractTriggerIterator
    trigger::AbstractTrigger
    dt
end

function TriggerIterator(trigger::AbstractTrigger, dt, n)
    if n < 0
        if iteratorsize(trigger) == IsInfinite()
            InfiniteTriggerIterator(trigger, dt)
        else
            FiniteTriggerIterator(trigger, dt, trigger.n)
        end
    else
        if iteratorsize(trigger) == IsInfinite()
            FiniteTriggerIterator(trigger, dt, n)
        else
            FiniteTriggerIterator(trigger, dt, min(n, trigger.n))
        end
    end
end

start(itr::AbstractTriggerIterator) = (itr.dt, 0)

done(itr::InfiniteTriggerIterator, state) = false
function done(itr::FiniteTriggerIterator, state)
    dt_next, i = state
    i >= itr.n
end

function next(itr::AbstractTriggerIterator, state)
    dt_now, i = state
    dt_next = get_next_dt_fire(itr.trigger, DateTime(0), dt_now)
    i += 1
    state = dt_next, i
    dt_next, state
end

iteratorsize(itr::InfiniteTriggerIterator) = IsInfinite()
iteratorsize(itr::FiniteTriggerIterator) = HasLength()

length(itr::FiniteTriggerIterator) = itr.n
