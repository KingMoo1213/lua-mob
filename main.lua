function love.load()
  love.window.setTitle("Lua Test App")

  love.window.setMode(0, 0, true)

-- Hide the status bar
  -- local display = require("display")
  -- display.setStatusBar(display.HiddenStatusBar)
  love.graphics.setBackgroundColor(192/255, 192/255, 192/255) -- silver background
end

function love.draw()
  love.graphics.setColor(255/255, 215/255, 0) -- golden circle
  love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 100) -- golden circle at center of screen
  love.graphics.setColor(64/255, 64/255, 64/255) -- dark grey text
  love.graphics.print("This is a Lua test", 10, 10) -- dark grey text at top-left corner
end
