require "Page"
require "InputManager"
local AnimationManager = require "AnimationManager"
local ImageManager = require "ImageManager"

SplashScreen = Page:new("Splash Screen", "lightblue")

function SplashScreen:init()
    -- Retrieve the image by its unique name
    local image = ImageManager.get("splash_image")
    
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local imageX = (screenWidth - image:getWidth()) / 2
    local imageY = screenHeight
    local targetY = 0

    self.animation = AnimationManager.createSlideAndFadeAnimation(image, 3, imageX, imageY, imageX, targetY)
end

function SplashScreen:update(dt)
    AnimationManager.update(self.animation, dt)

    if not self.animation.isActive then
        PageManager:switchTo("menu")
    end
end

function SplashScreen:render()
    Page.render(self)
    AnimationManager.draw(self.animation)
end
