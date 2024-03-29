local XD = {}

local colors = {
    reset = "\27[0m",
    black = "\27[30m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m",
}
function XD:new()
    local obj = {
        color = "reset",  -- Default color is reset
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function XD:set_color(color)
    self.color = color
end
function XD:print(text)
    local colorCode = colors[self.color] or colors.reset
    print(colorCode .. text .. colors.reset)
end

return XD