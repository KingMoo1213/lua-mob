require "Page"
require "InputManager"
local ProgressBar = require "ProgressBar"

local MenuScreen = setmetatable({}, {__index = Page})
MenuScreen.__index = MenuScreen

function MenuScreen:new()
    local this = setmetatable(Page:new("Menu Screen", "darkgreen"), MenuScreen)
    this.displayText = "Press and hold to start"

    -- position progress bar at bottom of screen, with 40 padding on each side, filling the width, and 60px high
    local screenWidth, screenHeight = love.graphics.getDimensions()
    this.progressbar = ProgressBar:new({
        x = 40,
        y = screenHeight - 80,
        width = screenWidth - 80,
        height = 40,
        padding = 4,
        fillDirection = "leftToRight",
        bgColor = {0.3, 0.3, 0.3},
        fgColor = {0, 0.6, 0}
    })

    return this
end

function MenuScreen:released(touchInfo)
    self.displayText = "Released - Event: " .. touchInfo.eventType .. ",\n Duration: " .. tostring(touchInfo.duration)

    if touchInfo.eventType == "press" then
        -- Logic for long press
        PageManager:switchTo("game")
    end
end

function MenuScreen:update()
    -- set display text to current time pressed from input, or 'press and hold to start' if not currently pressed
    if InputManager.isTouching then
        local timePressed = InputManager.touchTimer
        -- time pressed is a decimal, so we round it to 2 decimal places
        self.displayText = "Pressed for " .. string.format("%.2f", timePressed) .. " seconds"
    else
        self.displayText = "Press and hold to start"
    end
    self.progressbar:setProgress(InputManager:getHoldProgress())
end

function MenuScreen:render()
    Page.render(self) -- Call base render function

    -- Render the display text in the center of the screen
    local textWidth = self.font:getWidth(self.displayText)
    local textX = (love.graphics.getWidth() - textWidth) / 2
    local textY = (love.graphics.getHeight() / 2)

    love.graphics.setColor(1, 1, 1) -- White color
    love.graphics.print(self.displayText, textX, textY)

    self.progressbar:draw();
end

return MenuScreen