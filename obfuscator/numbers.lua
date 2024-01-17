local parser = require("obfuscator.parser")
local function obfuscate_number(num)
    local a= math.random(100)
    num = num *a
    return num .. "/"..a
end

return function (code)
    local tkns = parser.tokenize(code);
    local ast;
    for i,v in pairs(tkns) do
        if v.type == "number" then
            v.value = obfuscate_number(v.value)
            v.type = "identifier"
        end
    end
    ast = parser.parse(tkns)
    return parser.toLua(ast)
end