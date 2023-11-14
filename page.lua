Page = {}
Page.__index = Page

function Page:new(name, backgroundColor)
    local this = {
        name = name,
        backgroundColor = backgroundColor,
        padding = 10,
        fontSize = 24
    }
    setmetatable(this, Page)

    this.font = love.graphics.newFont(this.fontSize)
    
    return this
end

function Page:render()
    -- Render the background color
    Example: love.graphics.setBackgroundColor(self.backgroundColor)

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
