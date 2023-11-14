require "splashscreen"
require "menuscreen"
require "gamescreen"

PageManager = {
    currentPage = nil,
    pages = {
        splash = splashscreen,
        menu = menuscreen,
        game = gamescreen
    }
}

function PageManager:switchTo(pageName)
    self.currentPage = self.pages[pageName]
end

function PageManager:render()
    if self.currentPage then
        self.currentPage:render()
    end
end
