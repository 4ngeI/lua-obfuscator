local parser = require("obfuscator.parser");
return function (code)
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == "==" then
            container[key] = parser.parse("check_eq("..parser.toLua(node):gsub("==",",")..")").statements[1]
        end
    end)
    return parser.toLua(ast)
end