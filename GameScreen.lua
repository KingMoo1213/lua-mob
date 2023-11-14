require "Page"
require "InputManager"

GameScreen = Page:new("Game Screen", {0.5, 0.5, 0.5}) -- Starting with a gray background

function GameScreen:render()
    -- Call the base render method
    Page.render(self)

    -- Add game-specific rendering here
    -- For example, rendering swipe direction or other game elements
end

function GameScreen:touchreleased(id, x, y, dx, dy, pressure)
    local touchInfo = InputManager:touchreleased(id, x, y, dx, dy, pressure)
    
    if touchInfo.eventType == "swipe" then
        -- Handle swipe logic
        -- Example: Display the swipe direction
        self.displayText = "Swiped: " .. touchInfo.swipeDirection
    elseif touchInfo.eventType == "tap" then
        -- Handle tap logic
        -- Example: Change background color
        self.backgroundColor = {math.random(), math.random(), math.random()}
    end
end


return GameScreen
