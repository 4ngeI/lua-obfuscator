local parser = require("obfuscator.parser")

return function (code)
    local tkns = parser.tokenize(code);
    for i,v in pairs(tkns) do
        if v.type == "keyword" then
            if v.value == "true" then
                v.value = "bool_func(1) or 82*20 >= 1640"
                v.type = "identifier"
            elseif v.value == "false" then 
                v.value = "bool_func(0)"
                v.type = "identifier"
            end
        end
    end 
    local ast = parser.parse(tkns)
    return parser.toLua(ast)
end