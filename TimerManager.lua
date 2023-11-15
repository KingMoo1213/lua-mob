local TimerManager = {timers = {}}

function TimerManager.addTimer(duration, callback)
    local key = #TimerManager.timers + 1
    TimerManager.timers[key] = { duration = duration, callback = callback, elapsed = 0, isActive = true }
    return key
end

function TimerManager.stopTimer(key)
    if TimerManager.timers[key] then
        TimerManager.timers[key].isActive = false
    end
end

function TimerManager.clearTimer(key)
    TimerManager.timers[key] = nil
end

function TimerManager.getElapsedTime(key)
    return TimerManager.timers[key] and TimerManager.timers[key].elapsed or 0
end

function TimerManager.getTimeRemaining(key)
    if TimerManager.timers[key] then
        return TimerManager.timers[key].duration - TimerManager.timers[key].elapsed
    end
    return 0
end

function TimerManager.update(dt)
    for key, timer in pairs(TimerManager.timers) do
        if timer.isActive then
            timer.elapsed = timer.elapsed + dt
            if timer.elapsed >= timer.duration then
                timer.callback()
                TimerManager.timers[key] = nil
            end
        end
    end
end

return TimerManager
