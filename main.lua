require "PageManager"

local ImageManager = require "ImageManager"
local FontManager = require "FontManager"
local TimerManager = require "TimerManager"

function love.conf(t)
    t.window = nil
    -- t.window.title = "My Game"        -- The title of the window the game is in (string)
    -- t.window.width = 640              -- The window width (number)
    -- t.window.height = 1136             -- The window height (number)
    -- t.window.fullscreen = false       -- Enable fullscreen (boolean)
    -- t.window.fullscreentype = "normal" -- Standard fullscreen or desktop fullscreen mode
    t.window.vsync = 1                -- Vertical sync mode
    t.window.fsaa = 0                 -- The number of samples to use with multi-sampled antialiasing
    t.window.display = 1              -- Index of the monitor to show the window in (number)
    t.console = true
end

function love.load()
  love.window.setTitle("Lua Test App")

  love.window.setMode(640, 900, {fullscreen = false})

-- Hide the status bar
  -- local display = require("display")
  -- display.setStatusBar(display.HiddenStatusBar)
  love.graphics.setBackgroundColor(192/255, 192/255, 192/255) -- silver background

  ImageManager.load("splash_image", "assets/raw/splash.png") 
  ImageManager.load("splash_bg", "assets/raw/splashbg.png")

  FontManager.loadFont("default", nil, 48)
  FontManager.loadFont("challenge", "assets/raw/font/ChallengeContour.ttf", 24)

  InputManager:init()
  PageManager:init()
  PageManager:switchTo("splash")

end

function love.update(dt)
  InputManager:update(dt)
  TimerManager.update(dt)
  -- Other update code
  -- print("UPDATE")
  if PageManager.currentPage.update then
      PageManager.currentPage:update(dt)
  end
end

function love.draw()
  --love.graphics.setColor(255/255, 215/255, 0) -- golden circle
  --love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 100) -- golden circle at center of screen
  --love.graphics.setColor(64/255, 64/255, 64/255) -- dark grey text
  --love.graphics.print("This is a Lua test", 10, 10) -- dark grey text at top-left corner
    PageManager:render()
end

function love.mousepressed(x, y, button, istouch)
  InputManager:pressed(x, y)
  PageManager.currentPage:pressed(x, y)
end

function love.mousereleased(x, y, button, istouch)
    local touchInfo = InputManager:released(x, y)
    PageManager.currentPage:released(touchInfo)
end

-- function love.touchpressed(id, x, y, dx, dy, pressure)
--     InputManager:touchpressed(id, x, y, dx, dy, pressure)
--     print("touch pressed")
--     -- Pass the touch to the current page
--     PageManager.currentPage:touchpressed(id, x, y, dx, dy, pressure)
-- end

-- function love.touchreleased(id, x, y, dx, dy, pressure)
--     local touchInfo = InputManager:touchreleased(id, x, y, dx, dy, pressure)
--     -- Pass the touch to the current page
--     print("touch released")
--     PageManager.currentPage:touchreleased(touchInfo)
-- end