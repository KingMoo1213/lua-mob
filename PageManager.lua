local SplashScreen = require "SplashScreen"
local MenuScreen = require "MenuScreen"
local GameScreen = require "GameScreen"

PageManager = {}

function PageManager:init()
    self.currentPage = nil
    self.pages = {
        splash = SplashScreen:new(),
        menu = MenuScreen:new(),
        game = GameScreen:new()
    }
end

function PageManager:switchTo(pageName)
    self.currentPage = self.pages[pageName]
    self.currentPage:init()
end

function PageManager:render()
    if self.currentPage then
        self.currentPage:render()
    end
end
