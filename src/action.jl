import Base: run


"""
    Action(func, args...; kwargs...)

Action struct (functor) which can be run.

This structure stores function, arguments and keyword arguments.
"""
struct Action
    func::Function
    args
    kwargs

    Action(func, args...; kwargs...) = new(func, args, kwargs)
end

"""
    run(action::Action)

Run action
"""
run(action::Action) = action.func(action.args...; action.kwargs...)
