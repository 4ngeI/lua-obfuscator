-- I'm not going to rewrite this
local parser = require("obfuscator.parser");
local function eq(code) --==
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == "==" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_eq("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end
local function ne(code) --~=
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == "~=" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_ne("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end
local function lt(code) --<
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == "<" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_lt("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end
local function gt(code) -->
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == ">" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_gt("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end
local function le(code) --<= 
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == "<=" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_le("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end
local function ge(code) --<= 
    local ast = parser.parse(code);
    parser.traverseTree(ast,function (node,_,container,key)
        if node.type == "binary" and node.operator == ">=" then
            if node.right.type ~= "binary" then
                container[key] = parser.parse("check_ge("..parser.toLua(node):gsub(node.operator,",")..")").statements[1]
            end
        end
    end)
    return parser.toLua(ast)
end

return function (code)
    code = eq(code);
    code = ne(code);
    code = lt(code)
    code = gt(code)
    code = le(code)
    code = ge(code)
    return code
end