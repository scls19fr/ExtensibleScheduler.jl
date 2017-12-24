using ExtensibleScheduler
using TimeFrames

function print_time_noparam()
    println("From print_time_noparam $(now(Dates.UTC))")
end

function print_time_args(x)
    println("From print_time_args $(now(Dates.UTC)) $x")
end

function print_time_kwargs(; a="default")
    println("From print_time_kwargs $(now(Dates.UTC)) $a")
end

function sample()
    sched = BlockingScheduler()
    # uses default jobstore, default executor...
    action = Action(print_time_kwargs; Dict(:a=>"keyword")...)
    #add(sched, action, Trigger(DateTime(2017, 12, 17, 20, 8, 0)))  # execute one time at given DateTime
    #add(sched, action, Trigger(DateTime(2017, 12, 17, 20, 8, 5)))  # execute one time at given DateTime
    #add(sched, action, Trigger(now(Dates.UTC) - Dates.Second(5)))  # execute one time at given DateTime (misfire)
    add(sched, action, Trigger(now(Dates.UTC) + Dates.Second(5)))  # execute one time at given DateTime
    #add(sched, action, Trigger(Dates.Time(15, 58)))  # execute one time at given Time (of current day or of next day)
    #add(sched, action, Trigger(Seconds(5)))  # execute one time (5 seconds after being add)
    #add(sched, action, Trigger(tf"5s"))  # periodic job ; priority=0 by default
    run(sched)
end

sample()
