require "Page"
require "InputManager"

local GameScreen = setmetatable({}, {__index = Page})
GameScreen.__index = GameScreen

function GameScreen:new()
    local this = setmetatable(Page:new("Game Screen", "pastelorange"), GameScreen)
    this.displayText = ""
    return this
end

function GameScreen:render()
    -- Call the base render method
    Page.render(self)

    -- Add game-specific rendering here
    -- For example, rendering swipe direction or other game elements

    -- Render the display text in the center of the screen
    local textWidth = self.font:getWidth(self.displayText)
    local textX = (love.graphics.getWidth() - textWidth) / 2
    local textY = (love.graphics.getHeight() / 2)

    love.graphics.setColor(1, 1, 1) -- White color
    love.graphics.print(self.displayText, textX, textY)
end

function GameScreen:released(touchInfo)
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
