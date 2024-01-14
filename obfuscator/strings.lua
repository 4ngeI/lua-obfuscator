local parser = require("obfuscator.parser")

return function (code)
    local strings = {};
    local strings_list = "";
    local string_index = 1;
    local TOKENS,AST;

    do--extract strings
        TOKENS = parser.tokenize(code);
        for i,v in pairs(TOKENS) do
            if v.type == "string" then
                local can_insert = true;
                for a,b in pairs(strings) do
                    if b.value == v.value then
                        can_insert = false
                        break
                    end
                end
                if can_insert then
                    table.insert(strings,{value = v.value, index = string_index});
                    v.value = "strings_table["..string_index.."]";
                    v.type = "identifier"
                    string_index = string_index +1
                end
            end
        end 
    end
    code = parser.toLua(parser.parse(TOKENS))
    return code,strings
end