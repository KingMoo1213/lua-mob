require "Page"
require "InputManager"

MenuScreen = Page:new("Menu Screen", "green")

MenuScreen = Page:new("Menu Screen", {0.5, 0.5, 0.5}) -- Example initialization

-- Variable to hold display text
MenuScreen.displayText = ""

function MenuScreen:touchreleased(touchInfo)
    self.displayText = "Released - Event: " .. touchInfo.eventType .. ",\n Duration: " .. tostring(touchInfo.duration)

    if touchInfo.eventType == "press" then
        -- Logic for long press
        PageManager:switchTo("game")
    end
end

function MenuScreen:render()
    Page.render(self) -- Call base render function

    -- Render the display text in the center of the screen
    local textWidth = self.font:getWidth(self.displayText)
    local textX = (love.graphics.getWidth() - textWidth) / 2
    local textY = (love.graphics.getHeight() / 2)

    love.graphics.setColor(1, 1, 1) -- White color
    love.graphics.print(self.displayText, textX, textY)
end

