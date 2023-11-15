local ColorUtils = require "ColorUtils"

local UIElement = {}
UIElement.__index = UIElement

function UIElement:new(params)
    local this = {
        x = params.x or 0,
        y = params.y or 0,
        scaleX = params.scaleX or params.scale or 1,
        scaleY = params.scaleY or params.scale or 1,
        rotation = params.rotation or 0,
        alpha = params.alpha or 1,
        tint = ColorUtils.convertColor(params.tint or "white")
    }
    setmetatable(this, UIElement)
    return this
end

function UIElement:setPosition(x, y)
    self.x, self.y = x, y
end

function UIElement:setScale(scaleX, scaleY)
    self.scaleX, self.scaleY = scaleX, scaleY or scaleX
end

function UIElement:setRotation(rotation)
    self.rotation = rotation
end

function UIElement:setAlpha(alpha)
    self.alpha = alpha
end

function UIElement:setTint(r, g, b)
    self.tint = {r, g, b}
end

return UIElement
