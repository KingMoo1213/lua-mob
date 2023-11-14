local ImageManager = {}

ImageManager.images = {}

function ImageManager.load(name, filePath)
    ImageManager.images[name] = love.graphics.newImage(filePath)
end

function ImageManager.get(name)
    return ImageManager.images[name]
end

return ImageManager
