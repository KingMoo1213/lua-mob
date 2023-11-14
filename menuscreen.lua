require "Page"

MenuScreen = Page:new("Menu Screen", "green")

function MenuScreen:render()
    -- Custom rendering for the menu screen
    Page.render(self)
    -- Additional splash screen elements
end
