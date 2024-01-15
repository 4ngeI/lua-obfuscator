local parser = require("obfuscator.parser")


return function (code)
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key) --mul
        if node.type == "binary" then
            if node.operator == "*" then
                if node.left and node.left.type ~= "binary" and node.right.type ~= "binary" then
                    container[key] = parser.parse("mul("..parser.toLua(node):gsub("*",",")..")").statements[1]
                end
            end
        end
    end)

    code = parser.toLua(ast)
    ast = parser.parse(code)

    parser.traverseTree(ast,function (node,_,container,key) --div
        if node.type == "binary" then
            if node.operator == "/" then
                if node.left and node.left.type ~= "binary" and node.right.type ~= "binary" then
                    container[key] = parser.parse("div("..parser.toLua(node):gsub("/",",")..")").statements[1]
                end
            end
        end
    end)

    code = parser.toLua(ast)
    ast = parser.parse(code)

    parser.traverseTree(ast,function (node,_,container,key) --sum
        if node.type == "binary" then
            if node.operator == "+" then
                if node.left and node.left.type ~= "binary" and node.right.type ~= "binary" then
                   container[key] = parser.parse("sum("..parser.toLua(node):gsub("+",",")..")").statements[1]
                end
            end
        end
    end)

    return parser.toLua(ast)
end