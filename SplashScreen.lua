require "Page"
require "InputManager"
local Image = require "Image"
local AnimationManager = require "AnimationManager"
local ImageManager = require "ImageManager"

SplashScreen = {}
setmetatable(SplashScreen, {__index = Page})

function SplashScreen:new()
    local newInstance = Page:new("Splash Screen", {0.5, 0.5, 0.5})
    setmetatable(newInstance, self)
    self.__index = self
    return newInstance
end

function SplashScreen:init()
    self.splashImage = Image:new({
        name = "splash_image"
    })

    local screenWidth, screenHeight = love.graphics.getDimensions()
    local imageWidth, imageHeight = self.splashImage.image:getWidth(), self.splashImage.image:getHeight()

    local scale = math.min(screenWidth / imageWidth, screenHeight / imageHeight)
    self.splashImage:setScale(scale)
    self.splashImage:setPosition((screenWidth - imageWidth * scale) / 2, screenHeight)

    -- Animation for sliding up and fading in
    self.animation = AnimationManager.createAnimation({
        target = self.splashImage,
        properties = {
            y = {startValue = screenHeight, endValue = (screenHeight - imageHeight * scale) / 2},
            alpha = {startValue = 0, endValue = 1}
        },
        duration = 3
    })
end

function SplashScreen:update(dt)
    AnimationManager.update(self.animation, dt)

    if self.animation.isCompleted then
        PageManager:switchTo("menu")
    end
end

function SplashScreen:render()
    Page.render(self) -- Call the base class render method
    self.splashImage:draw() -- Draw the splash image
end
