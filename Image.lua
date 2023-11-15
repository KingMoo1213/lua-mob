local Image = {}
Image.__index = Image

function Image:new(params)
    local this = {
        image = love.graphics.newImage(params.imagePath),
        x = params.x or 0,
        y = params.y or 0,
        scaleX = params.scaleX or 1,
        scaleY = params.scaleY or 1,
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

function Image:draw()
    love.graphics.setColor(self.tint[1], self.tint[2], self.tint[3], self.alpha)
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
    love.graphics.setColor(1, 1, 1, 1)
end

return Image
