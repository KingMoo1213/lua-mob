function love.conf(t)
    t.window.title = "My Game"        -- The title of the window the game is in (string)
    t.window.width = 640              -- The window width (number)
    t.window.height = 1136             -- The window height (number)
    t.window.fullscreen = true       -- Enable fullscreen (boolean)
    t.window.fullscreentype = "normal" -- Standard fullscreen or desktop fullscreen mode
    t.window.vsync = 1                -- Vertical sync mode
    t.window.fsaa = 0                 -- The number of samples to use with multi-sampled antialiasing
    t.window.display = 1              -- Index of the monitor to show the window in (number)
end

function love.load()
  love.window.setTitle("Lua Test App")

  love.window.setMode(1, 2, {fullscreen = true})

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
