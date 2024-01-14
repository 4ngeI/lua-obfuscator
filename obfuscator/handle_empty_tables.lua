local parser = require("obfuscator.parser")

return function (code)
    local AST = parser.parse(code)
    parser.traverseTree(AST,function (node,parent,container,key)
        if node.type == "table" then
            if #node.fields == 0 then
                container[key] = parser.parse("new_table()").statements[1]
            end
        end
    end)
    return parser.toLua(AST)
end