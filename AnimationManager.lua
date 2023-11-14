local AnimationManager = {}

function AnimationManager.createAnimation(properties)
    -- properties include target object, property to animate, start and end values, duration, delay, loop type, etc.
    return {
        target = properties.target,
        property = properties.property,
        startValue = properties.startValue,
        endValue = properties.endValue,
        duration = properties.duration,
        delay = properties.delay or 0,
        elapsedTime = 0,
        loopType = properties.loopType or "none", -- Options: "none", "loop", "yoyo"
        direction = 1, -- 1 for forward, -1 for backward (used in yoyo)
        isPlaying = true,
        -- Add more properties as needed
    }
end

function AnimationManager.update(animation, dt)
    if not animation.isPlaying then return end

    animation.elapsedTime = animation.elapsedTime + dt

    -- Handle delay
    if animation.elapsedTime < animation.delay then return end

    local progress = (animation.elapsedTime - animation.delay) / animation.duration
    progress = math.min(progress, 1) -- Clamp progress to 1

    if animation.loopType == "loop" and progress >= 1 then
        animation.elapsedTime = animation.delay
    elseif animation.loopType == "yoyo" and progress >= 1 then
        animation.elapsedTime = animation.delay
        animation.direction = -animation.direction
    elseif progress >= 1 then
        animation.isPlaying = false
    end

    -- Calculate the interpolated value
    local value
    if animation.loopType == "yoyo" and animation.direction == -1 then
        value = animation.endValue - (animation.endValue - animation.startValue) * progress
    else
        value = animation.startValue + (animation.endValue - animation.startValue) * progress
    end

    -- Apply the value to the target
    animation.target[animation.property] = value
end

return AnimationManager

