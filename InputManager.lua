InputManager = {}

-- Track the state of touches
function InputManager:init()
    self.isTouching = false
    self.touchTimer = 0
    self.touchThreshold = 1.0 -- Threshold for long press (in seconds)
    self.swipeThreshold = 50 -- Minimum distance in pixels for a swipe to be registered
    self.startX, self.startY = 0, 0
    self.endX, self.endY = 0, 0
end

function InputManager:update(dt)
    if self.isTouching then
        self.touchTimer = self.touchTimer + dt
    end
end

function InputManager:touchpressed(id, x, y, dx, dy, pressure)
    self.isTouching = true
    self.startX, self.startY = x, y
    self.touchTimer = 0
end

function InputManager:touchreleased(id, x, y, dx, dy, pressure)
    self.isTouching = false
    self.endX, self.endY = x, y

    local distanceX = self.endX - self.startX
    local distanceY = self.endY - self.startY

    -- Check for swipe
    if math.abs(distanceX) > self.swipeThreshold or math.abs(distanceY) > self.swipeThreshold then
        -- Handle swipe logic here
    elseif self.touchTimer < self.touchThreshold then
        -- Handle tap logic here
    end

    self.touchTimer = 0
end

function InputManager:getSwipeDirection()
    local dx = self.endX - self.startX
    local dy = self.endY - self.startY
    if math.abs(dx) > math.abs(dy) then
        return (dx > 0) and 'right' or 'left'
    else
        return (dy > 0) and 'down' or 'up'
    end
end

return InputManager
