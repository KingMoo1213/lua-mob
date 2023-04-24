function love.load()
  love.window.setTitle("Lua Test")
  love.graphics.setBackgroundColor(192, 192, 192) -- silver background
  love.graphics.setColor(255, 215, 0) -- golden circle
  love.graphics.setCircleSegments(100) -- smooth circle
end

function love.draw()
  love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 100) -- golden circle at center of screen
  love.graphics.setColor(64, 64, 64) -- dark grey text
  love.graphics.print("This is a Lua test", 10, 10) -- dark grey text at top-left corner
end
