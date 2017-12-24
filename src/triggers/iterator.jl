import Base: start, done, next

"""
    iterate(trigger, dt[, n=-1])


iterate from instant dt using trigger with a given iteration number `n`
if n < 0 (-1 by default), it iterates indefinitely.
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