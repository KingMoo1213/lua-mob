require "Page"
require "InputManager"

SplashScreen = Page:new("Splash Screen", "blue")

function SplashScreen:touchreleased(touchInfo)
    if touchInfo.eventType == "tap" then
        -- Logic for tap
        PageManager:switchTo("menu")
    end
end


function SplashScreen:render()
    -- Custom rendering for the splash screen
    Page.render(self)
    -- Additional splash screen elements
end
