local AnimationManager = {}

function AnimationManager.createSlideAndFadeAnimation(image, duration, startX, startY, endX, endY)
    return {
        image = image,
        duration = duration,
        startX = startX,
        startY = startY,
        endX = endX,
        endY = endY,
        currentTime = 0,
        isActive = true
    }
end

function AnimationManager.update(animation, dt)
    if animation == nil then return end
    if not animation.isActive then return end

    animation.currentTime = animation.currentTime + dt
    local progress = animation.currentTime / animation.duration

    animation.currentX = animation.startX + (animation.endX - animation.startX) * progress
    animation.currentY = animation.startY + (animation.endY - animation.startY) * progress
    animation.alpha = 1 - progress

    if animation.currentTime >= animation.duration then
        animation.isActive = false
    end
end

function AnimationManager.draw(animation)
    if animation == nil then return end
    if not animation.isActive then return end

    love.graphics.setColor(1, 1, 1, animation.alpha)
    love.graphics.draw(animation.image, animation.currentX, animation.currentY)
    love.graphics.setColor(1, 1, 1, 1) -- Resetting the color
end

return AnimationManager
