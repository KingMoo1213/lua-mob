local AnimationManager = {}

function AnimationManager.createAnimation(properties, autoStart)
    local animation = {
        target = properties.target,
        properties = properties.properties,
        duration = properties.duration,
        delay = properties.delay or 0,
        elapsedTime = 0,
        loopType = properties.loopType or "none",
        loopCount = properties.loopCount or 0,
        currentLoop = 0,
        direction = 1,
        isPlaying = autoStart or properties.autoStart or false, -- Control immediate start
        isComplete = false
    }
    return animation
end

function AnimationManager.play(animation)
    animation.isPlaying = true
    animation.isComplete = false
end

function AnimationManager.pause(animation)
    animation.isPlaying = false
end

function AnimationManager.reset(animation)
    animation.elapsedTime = 0
    animation.currentLoop = 0
    animation.direction = 1
    animation.isPlaying = false
    animation.isComplete = false
end

function AnimationManager.stop(animation)
    animation.isPlaying = false
    animation.isComplete = true
end

function AnimationManager.update(animation, dt)
    if not animation.isPlaying or (animation.loopCount > 0 and animation.currentLoop >= animation.loopCount) then return end

    animation.elapsedTime = animation.elapsedTime + dt

    -- Handle delay
    if animation.elapsedTime < animation.delay then return end

    local effectiveTime = (animation.elapsedTime - animation.delay) * animation.direction
    local progress = effectiveTime / animation.duration
    progress = math.min(math.max(progress, 0), 1) -- Clamp progress between 0 and 1

    for prop, propData in pairs(animation.properties) do
        local value = propData.startValue + (propData.endValue - propData.startValue) * progress
        animation.target[prop] = value
    end

    if progress >= 1 or progress <= 0 then
        if animation.loopType == "loop" or (animation.loopType == "yoyo" and animation.direction == -1) then
            animation.currentLoop = animation.currentLoop + 1
        end

        if animation.loopCount > 0 and animation.currentLoop >= animation.loopCount then
            animation.isPlaying = false
            return
        end

        if animation.loopType == "loop" then
            animation.elapsedTime = animation.delay
        elseif animation.loopType == "yoyo" then
            animation.direction = -animation.direction
            animation.elapsedTime = animation.delay
        else
            animation.isPlaying = false
        end
    end

    if not animation.isPlaying or (animation.loopCount > 0 and animation.currentLoop >= animation.loopCount) then
        animation.isComplete = true
        return
    end
end

return AnimationManager
