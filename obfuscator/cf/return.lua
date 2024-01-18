local parser = require("obfuscator.parser")

local cf_return = {}

function cf_return:new()
    local obfuscator = {
        returnIndex = 0
    }
    setmetatable(obfuscator, self)
    self.__index = self
    return obfuscator
end

function cf_return:newNode(node)
    local new_code = parser.parse([[
        if return_idx ~= ]] .. math.random(11433, 32132) .. [[ then 
            return_idx = return_idx + 1
            ]] .. parser.toLua(node) .. [[
        else
            return num_table[]] .. math.random(999) .. [[];
        end
    ]]).statements[1]

    return new_code
end

function cf_return:obf(code)
    local ast = parser.parse(code)

    parser.traverseTree(ast, function(node, _, container, key)
        if node.type == "return" then
            container[key] = self:newNode(node)
        end
    end)

    return parser.toLua(ast)
end

return function (code)
    return cf_return:new():obf(code)
end