local parser = require("obfuscator.parser")
local obfuscator = {};

function obfuscator:new()
    local tbl = obfuscator
    setmetatable(tbl,self)
    self.__index = self
    return tbl
end

function obfuscator:_replaceContainer_(container, key,obfuscatedCode)
    local newAst = parser.parse(obfuscatedCode)
    container[key] = newAst.statements[1]
end

function obfuscator:traverseOP(ast, operator, obfuscationFunction)
    parser.traverseTree(ast, function(node, _, container, key)
        self:processBinaryOperation(node,container,key,operator,obfuscationFunction)
    end)
end

function obfuscator:processBinaryOperation(node,container,key,operator,obfuscationFunction)
    if node.type == "binary" and node.operator == operator then
        if node.left and node.left.type ~= "binary" and node.right.type ~= "binary" then
            local obfuscatedCode = obfuscationFunction(parser.toLua(node))
            self:_replaceContainer_(container,key,obfuscatedCode)
        end
    end
end

function obfuscator:obfuscate(code)
    local ast = parser.parse(code)

    self:traverseOP(ast, "*", function(code) return "mul(" .. code:gsub("*", ",") .. ")" end)
    self:traverseOP(ast, "/", function(code) return "div(" .. code:gsub("/", ",") .. ")" end)
    self:traverseOP(ast, "+", function(code) return "sum(" .. code:gsub("+", ",") .. ")" end)

    return parser.toLua(ast)
end


return function (code)
    local obfuscator = obfuscator:new()
    return obfuscator:obfuscate(code)
end