require "Page"

SplashScreen = Page:new("Splash Screen", "blue")

function SplashScreen:render()
    -- Custom rendering for the splash screen
    Page.render(self)
    -- Additional splash screen elements
end
