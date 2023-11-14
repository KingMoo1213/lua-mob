require "Page"

GameScreen = Page:new("Game Screen", "blue")

function GameScreen:render()
    -- Custom rendering for the game screen
    Page.render(self)
    -- Additional splash screen elements
end
