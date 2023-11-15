local UIElement = require "UIElement"
local FontManager = require "FontManager"

local Text = setmetatable({}, {__index = UIElement})
Text.__index = Text

function Text:new(params)
    local this = setmetatable(UIElement:new(params), Text)
    this.text = params.text or ""
    this.font = FontManager.getFont(params.font)
    return this
end

function Text:setText(text)
    self.text = text
end

function Text:setFont(font)
    self.font = font
end

function Text:draw()
    love.graphics.setFont(self.font)
    love.graphics.setColor(self.tint[1], self.tint[2], self.tint[3], self.alpha)
    love.graphics.print(self.text, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
    love.graphics.setColor(1, 1, 1, 1)
end

return Text
