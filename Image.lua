local ImageManager = require "ImageManager"
local UIElement = require "UIElement"

local Image = setmetatable({}, {__index = UIElement})
Image.__index = Image

function Image:new(params)
    local this = setmetatable(UIElement:new(params), Image)
    this.image = ImageManager.get(params.name)
    return this
end

function Image:draw()
    love.graphics.setColor(self.tint[1], self.tint[2], self.tint[3], self.alpha)
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
    love.graphics.setColor(1, 1, 1, 1)
end

return Image
