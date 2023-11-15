local ColorUtils = require "ColorUtils"

local ProgressBar = {}
ProgressBar.__index = ProgressBar

function ProgressBar:new(params)
    local this = {
        x = params.x or 0,
        y = params.y or 0,
        width = params.width or 100,
        height = params.height or 20,
        padding = params.padding or 5,
        fillDirection = params.fillDirection or "leftToRight", -- or "rightToLeft"
        progress = params.progress or 0, -- Value between 0 and 1
        bgColor = ColorUtils.convertColor(params.bgColor or "white"),
        fgColor = ColorUtils.convertColor(params.fgColor or "grey")
    }
    setmetatable(this, ProgressBar)
    return this
end

function ProgressBar:setProgress(progress)
    self.progress = math.min(math.max(progress, 0), 1)
end

function ProgressBar:draw()
    -- Draw background
    love.graphics.setColor(unpack(self.bgColor))
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Calculate fill width
    local fillWidth = (self.width - 2 * self.padding) * self.progress
    local fillX = self.x + self.padding
    if self.fillDirection == "rightToLeft" then
        fillX = self.x + self.width - self.padding - fillWidth
    end

    -- Draw foreground
    love.graphics.setColor(unpack(self.fgColor))
    love.graphics.rectangle("fill", fillX, self.y + self.padding, fillWidth, self.height - 2 * self.padding)

    -- Reset color
    love.graphics.setColor(1, 1, 1, 1)
end

return ProgressBar
