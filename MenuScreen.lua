require "Page"
require "InputManager"

MenuScreen = Page:new("Menu Screen", "green")

function MenuScreen:touchreleased(id, x, y, dx, dy, pressure)
    if InputManager.touchTimer >= InputManager.touchThreshold then
        -- Show progress bar here if needed
        PageManager:switchTo("game")
    end
end

function MenuScreen:render()
    -- Custom rendering for the menu screen
    Page.render(self)
    -- Additional splash screen elements
end
