require "Page"
require "InputManager"
local Image = require "Image"
local Shape = require "Shape"
local Text = require "Text"
local AnimationManager = require "AnimationManager"
local ImageManager = require "ImageManager"
local TimerManager = require "TimerManager"

local SplashScreen = setmetatable({}, {__index = Page})
SplashScreen.__index = SplashScreen

function SplashScreen:new()
    local this = setmetatable(Page:new("Splash Screen", "lightblue"), SplashScreen)
    return this
end

function SplashScreen:init()
    self.splashImage = Image:new({
        name = "splash_image"
    })

    self.text = Text:new({
        text = "Splash Screen",
        font = "challenge",
        tint = "white",
        alpha = 1
    })

    local screenWidth, screenHeight = love.graphics.getDimensions()
    local imageWidth, imageHeight = self.splashImage.image:getWidth(), self.splashImage.image:getHeight()
    local imagepadding = 120

    local scale = math.min((screenWidth - imagepadding) / imageWidth, (screenHeight - imagepadding) / imageHeight)
    self.splashImage:setScale(scale)
    self.splashImage:setPosition((screenWidth - imageWidth * scale) / 2, screenHeight)

    -- position text bottom center
    self.text:setPosition((screenWidth - self.text.font:getWidth(self.text.text)) / 2, screenHeight - self.text.font:getHeight())

    -- Animation for sliding up and fading in
    self.animation = AnimationManager.createAnimation({
        target = self.splashImage,
        delay = 1,
        properties = {
            y = {startValue = screenHeight, endValue = (screenHeight - imageHeight * scale) / 2},
            alpha = {startValue = 0, endValue = 1}
        },
        duration = 2
    }, true)

    -- fade text in after 1 second
    self.textanimation = AnimationManager.createAnimation({
        target = self.text,
        delay = 3,
        properties = {
            alpha = {startValue = 0, endValue = 1}
        },
        duration = 0.5
    }, true)

end

function SplashScreen:update(dt)
    AnimationManager.update(self.textanimation, dt)
    if not self.animation.isComplete then
        AnimationManager.update(self.animation, dt)
    else
        if not self.delayTimer then
            self.delayTimer = TimerManager.addTimer(2, function()
                PageManager:switchTo("menu")
            end)
        end
    end
end


function SplashScreen:render()
    Page.render(self) -- Call the base class render method
    self.splashImage:draw() -- Draw the splash image
    self.text:draw() -- Draw the text
end

return SplashScreen
