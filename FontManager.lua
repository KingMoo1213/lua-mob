local FontManager = {}

FontManager.fonts = {}

function FontManager.loadFont(name, path, size)
    size = size or 12
    if not FontManager.fonts[name] then
        if path then
            FontManager.fonts[name] = love.graphics.newFont(path, size)
        else
            FontManager.fonts[name] = love.graphics.newFont(size)
        end
    end
end

function FontManager.getFont(name)
    if FontManager.fonts[name] then
        return FontManager.fonts[name]
    end
    if FontManager["default"] then
        return FontManager["default"]
    end
    return love.graphics.getFont(24)
end

return FontManager
