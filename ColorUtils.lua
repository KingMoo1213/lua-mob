local ColorUtils = {}

-- Extensive color table
ColorUtils.colors = {
    red = {1, 0, 0},
    green = {0, 1, 0},
    blue = {0, 0, 1},
    yellow = {1, 1, 0},
    cyan = {0, 1, 1},
    magenta = {1, 0, 1},
    white = {1, 1, 1},
    black = {0, 0, 0},
    orange = {1, 0.5, 0},
    purple = {0.5, 0, 0.5},
    pink = {1, 0.75, 0.8},
    brown = {0.6, 0.4, 0.2},
    grey = {0.5, 0.5, 0.5},
    darkred = {0.5, 0, 0},
    darkgreen = {0, 0.5, 0},
    darkblue = {0, 0, 0.5},
    darkyellow = {0.5, 0.5, 0},
    darkcyan = {0, 0.5, 0.5},
    darkmagenta = {0.5, 0, 0.5},
    darkorange = {0.5, 0.25, 0},
    darkpurple = {0.25, 0, 0.25},
    darkpink = {0.5, 0.375, 0.4},
    darkbrown = {0.3, 0.2, 0.1},
    darkgrey = {0.25, 0.25, 0.25},
    lightred = {1, 0.5, 0.5},
    lightgreen = {0.5, 1, 0.5},
    lightblue = {0.5, 0.5, 1},
    lightyellow = {1, 1, 0.5},
    lightcyan = {0.5, 1, 1},
    lightmagenta = {1, 0.5, 1},
    lightorange = {1, 0.75, 0.5},
    lightpurple = {0.75, 0.5, 0.75},
    lightpink = {1, 0.875, 0.9},
    lightbrown = {0.8, 0.6, 0.4},
    lightgrey = {0.75, 0.75, 0.75},
    pastelred = {1, 0.4, 0.4},
    pastelgreen = {0.4, 1, 0.4},
    pastelblue = {0.4, 0.4, 1},
    pastelyellow = {1, 1, 0.4},
    pastelcyan = {0.4, 1, 1},
    pastelmagenta = {1, 0.4, 1},
    pastelorange = {1, 0.65, 0.4},
    pastelpurple = {0.65, 0.4, 0.65},
    pastelpink = {1, 0.8, 0.85},
    pastelbrown = {0.7, 0.55, 0.4},
    pastelgrey = {0.65, 0.65, 0.65},
    -- Add more colors as needed
}

function ColorUtils.convertColor(color)
    if type(color) == "string" then
        return ColorUtils.colors[color:lower()] or {1, 1, 1} -- Convert to lowercase and default to white if color name is not recognized
    elseif type(color) == "table" then
        return color -- Return the color as is if it's already in table format
    else
        return {1, 1, 1} -- Default to white if the format is unrecognized
    end
end

return ColorUtils
