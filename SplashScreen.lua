require "Page"
require "InputManager"
local AnimationManager = require "AnimationManager"
local ImageManager = require "ImageManager"

SplashScreen = Page:new("Splash Screen", {0.5, 0.5, 0.5})

function SplashScreen:init()
    local image = ImageManager.get("splash_image")
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local scale = math.min(screenWidth / image:getWidth(), screenHeight / image:getHeight()) 
    local imageX = ((screenWidth - image:getWidth()) / 2) *scale
    local imageY = screenHeight
    local targetY = 0

    self.splashAnimation = AnimationManager.createAnimation({
        target = { x = imageX, y = imageY, alpha = 1 },
        property = "y",
        startValue = imageY,
        endValue = targetY,
        duration = 3,
        loopType = "none"
    })

    self.name = imageY + "_" + targetY
end

function SplashScreen:update(dt)
    AnimationManager.update(self.splashAnimation, dt)

    if not self.splashAnimation.isPlaying then
        PageManager:switchTo("menu")
    end
end

function SplashScreen:render()
    Page.render(self)

    local anim = self.splashAnimation
    local image = ImageManager.get("splash_image")

    -- Calculate scale factor to fit the image on the screen
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local scale = math.min(screenWidth / image:getWidth(), screenHeight / image:getHeight())

    -- Apply the animation's properties and scale to the image
    love.graphics.setColor(1, 1, 1, anim.target.alpha)
    love.graphics.draw(image, anim.target.x, anim.target.y, 0, scale, scale)
    love.graphics.setColor(1, 1, 1, 1) -- Resetting the color
end


