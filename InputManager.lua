InputManager = {}

-- Track the state of touches
function InputManager:init()
    self.isTouching = false
    self.touchTimer = 0
    self.touchThreshold = 0.5 -- Threshold for long press (in seconds)
    self.swipeThreshold = 50 -- Minimum distance in pixels for a swipe to be registered
    self.startX, self.startY = 0, 0
    self.endX, self.endY = 0, 0
end

function InputManager:update(dt)
    if self.isTouching then
        self.touchTimer = self.touchTimer + dt
    end
end

function InputManager:getHoldProgress()
    if self.isTouching then
        return self.touchTimer / self.touchThreshold
    else
        return 0
    end
end

function InputManager:pressed(x, y)
    self.isTouching = true
    self.startX, self.startY = x, y
    self.touchTimer = 0
end

function InputManager:released(x, y)
    local eventType
    local swipeDirection = nil
    local distanceX = x - self.startX
    local distanceY = y - self.startY

    -- Determine event type
    if math.abs(distanceX) > self.swipeThreshold or math.abs(distanceY) > self.swipeThreshold then
        eventType = "swipe"
        swipeDirection = self:getSwipeDirection(distanceX, distanceY)
    elseif self.touchTimer < self.touchThreshold then
        eventType = "tap"
    else
        eventType = "press"
    end

    local touchInfo = {
        eventType = eventType,
        duration = self.touchTimer,
        startX = self.startX,
        endX = x,
        startY = self.startY,
        endY = y,
        swipeDirection = swipeDirection
    }

    self.isTouching = false
    self.touchTimer = 0

    return touchInfo
end

function InputManager:getSwipeDirection(dx, dy)
    if math.abs(dx) > math.abs(dy) then
        return (dx > 0) and 'right' or 'left'
    else
        return (dy > 0) and 'down' or 'up'
    end
end

return InputManager
