Page = {}
Page.__index = Page

function Page:new(name, backgroundColor)
    local this = {
        name = name,
        backgroundColor = backgroundColor
    }
    setmetatable(this, Page)
    return this
end

function Page:render()
    -- Render the background color
    Example: love.graphics.setBackgroundColor(self.backgroundColor)

    -- Render the page name at the top
    love.graphics.print(self.name, 0,0)
end
