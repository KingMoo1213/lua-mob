local ColorUtils = require "ColorUtils"
local FontManager = require "FontManager"

Page = {}
Page.__index = Page

function Page:new(name, backgroundColor)
    local this = {
        name = name,
        backgroundColor = ColorUtils.convertColor(backgroundColor),
        padding = 10,
        fontSize = 24
    }
    setmetatable(this, Page)

    this.font = FontManager.getFont("default")
    
    return this
end

function Page:init()
    -- Init here
end

function Page:pressed(id, x, y, dx, dy, pressure)
    -- implement this in child class
end

function Page:released(id, x, y, dx, dy, pressure)
    -- implement this in child class
end

function Page:render()
    -- Render the background color
 love.graphics.setBackgroundColor(self.backgroundColor)

    -- Render the page name at the top
    love.graphics.setFont(self.font)

    -- Calculate text width and position
    local textWidth = self.font:getWidth(self.name)
    local textX = (love.graphics.getWidth() - textWidth) / 2
    local textY = self.padding

    -- Render the page name at the top center
    love.graphics.setColor(1, 1, 1) -- Set text color to white (or any other color you prefer)
    love.graphics.print(self.name, textX, textY)
end
