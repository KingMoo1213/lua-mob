require "Page"

GameScreen = Page:new("Game Screen", "orange")

function GameScreen:render()
    -- Custom rendering for the game screen
    Page.render(self)
    -- Additional splash screen elements
end
