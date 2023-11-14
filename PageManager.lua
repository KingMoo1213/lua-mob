require "SplashScreen"
require "MenuScreen"
require "GameScreen"

PageManager = {
    currentPage = nil,
    pages = {
        splash = SplashScreen,
        menu = MenuScreen,
        game = GameScreen
    }
}

function PageManager:switchTo(pageName)
    self.currentPage = self.pages[pageName]
    self.currentPage:init()
end

function PageManager:render()
    if self.currentPage then
        self.currentPage:render()
    end
end
