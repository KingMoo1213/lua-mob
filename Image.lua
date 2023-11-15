local ImageManager = require "ImageManager"

local Image = {}
Image.__index = Image

function Image:new(params)
    local this = {
        image = ImageManager.get(params.name), -- Get image from ImageManager
        x = params.x or 0,
        y = params.y or 0,
        scaleX = params.scaleX or params.scale or 1,
        scaleY = params.scaleY or params.scale or 1,
        rotation = params.rotation or 0,
        alpha = params.alpha or 1,
        tint = params.tint or {1, 1, 1}
    }
    setmetatable(this, Image)
    return this
end

function Image:update(params)
    for k, v in pairs(params) do
        if self[k] ~= nil then
            self[k] = v
        end
    end
end

function Image:setPosition(x, y)
    self.x, self.y = x, y
end

function Image:setScale(scaleX, scaleY)
    self.scaleX, self.scaleY = scaleX, scaleY or scaleX
end

function Image:setRotation(rotation)
    self.rotation = rotation
end

function Image:setAlpha(alpha)
    self.alpha = alpha
end

function Image:setTint(r, g, b)
    self.tint = {r, g, b}
end

function Image:draw()
    love.graphics.setColor(self.tint[1], self.tint[2], self.tint[3], self.alpha)
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
    love.graphics.setColor(1, 1, 1, 1)
end

return Image
