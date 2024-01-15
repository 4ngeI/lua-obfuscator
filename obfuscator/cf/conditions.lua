local parser = require("obfuscator.parser")
local last_condition = 1
local conditions = {
    "256/num_table[256]~=12",
    "num_table[256]^4~=103219-1",
}
local function new_condition(node)
    math.randomseed(os.time())
    local new = math.random(#conditions)
    repeat
        new = math.random(#conditions)
    until new ~= last_condition
    last_condition = new
    return parser.parse([[
        if ]]..conditions[math.random(new)]..[[ and ]]..parser.toLua(node.condition)..[[ and ]]..conditions[math.random(new)]..[[ then 
        end
    ]]).statements[1].condition
end
return function (code)
    local AST = parser.parse(code);
    parser.traverseTree(AST,function (node)
        if node.type == "if" then
            node.condition = new_condition(node)
        end
    end)
    return parser.toLua(AST)
end