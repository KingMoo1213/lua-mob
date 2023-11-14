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
    if InputManager.touchTimer < InputManager.touchThreshold then
        -- Change background color on tap
        self.backgroundColor = {
            math.random(), -- Random red component
            math.random(), -- Random green component
            math.random()  -- Random blue component
        }
    else
        -- Handle swipe
        local direction = InputManager:getSwipeDirection()
        -- Display the swipe direction
        self.name = "Swiped: " .. direction
    end
end

return GameScreen
