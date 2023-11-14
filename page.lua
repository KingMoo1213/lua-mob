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
    -- Render the page name at the top
end
