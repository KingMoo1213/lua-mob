local UIElement = require "UIElement"
local ColorUtils = require "ColorUtils"

local Shape = setmetatable({}, {__index = UIElement})
Shape.__index = Shape

function Shape:new(params)
    local this = setmetatable(UIElement:new(params), Shape)
    this.type = params.type or "rectangle"
    this.radius = params.radius or 0
    --segments
    this.segments = params.segments or 8
    this.color = ColorUtils.convertColor(params.tint or "white")
    this.x = params.x or 0
    this.y = params.y or 0
    this.width = params.width or 100
    this.height = params.height or 100

    -- fill and stroke properties
    this.style = params.style or "fill" -- fill, stroke, fillstroke
    this.strokeWidth = params.strokeWidth or 1
    this.strokeColor = ColorUtils.convertColor(params.strokeColor or "black")




    -- if type == rect, set to rectangle
    if this.type == "rect" then
        this.type = "rectangle"
    end
    if this.type == "roundedrect" then
        this.type = "roundedrectangle"
    end
    if this.type == "rrect" then
        this.type = "roundedrectangle"
    end

    -- if type == circle, set width and height
    if this.type == "circle" then
        this.width = this.radius * 2
        this.height = this.radius * 2
    end

    return this
end

function Shape:draw()
    love.graphics.setColor(unpack(self.color))
    
    if self.type == "rectangle" then
        love.graphics.rectangle(self.style, self.x, self.y, self.width, self.height)
    elseif self.type == "circle" then
        love.graphics.circle(self.style, self.x, self.y, self.radius)
    elseif self.type == "roundedrectangle" then
        love.graphics.rectangle(self.style, self.x, self.y, self.width, self.height, self.radius, self.radius, self.segments)
    end

    love.graphics.setColor(1, 1, 1, 1) -- Resetting the color
end

return Shape
