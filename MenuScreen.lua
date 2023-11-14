require "Page"
require "InputManager"

MenuScreen = Page:new("Menu Screen", "green")

function MenuScreen:touchreleased(id, x, y, dx, dy, pressure)
    local touchInfo = InputManager:touchreleased(id, x, y, dx, dy, pressure)
    if touchInfo.eventType == "press" then
        -- Logic for long press
        PageManager:switchTo("game")
    elseif touchInfo.eventType == "tap" then
        -- Logic for tap
    end
end


function MenuScreen:render()
    -- Custom rendering for the menu screen
    Page.render(self)
    -- Additional splash screen elements
end
