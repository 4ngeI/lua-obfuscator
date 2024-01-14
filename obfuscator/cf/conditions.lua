local parser = require("obfuscator.parser")
local conditions = {
    "256/num_table[256]~=12",
}
math.randomseed(os.time())
return function (code)
    local AST = parser.parse(code);
    parser.traverseTree(AST,function (node)
        if node.type == "if" then
            math.randomseed(os.time())
            node.condition = parser.parse([[
                if ]]..conditions[math.random(#conditions)]..[[ and ]]..parser.toLua(node.condition)..[[ then 
                end
            ]]).statements[1].condition
        end
    end)
    return parser.toLua(AST)
end