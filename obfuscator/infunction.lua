local parser = require("obfuscator.parser")
local strings = require("obfuscator.strings");
local fake_conditions = require("obfuscator.cf.conditions")

return function (code)
    local _,strings_table = strings(code);
    local strings_string = ""
    do --make strings list
        for i,v in pairs(strings_table) do
            strings_string=strings_string.."["..v.index.."]=".."'"..v.value.."',"
        end
        strings_string = "{"..strings_string.."}"
    end
    local a,_ = strings(code)
    a = fake_conditions(a)
    code = [[return(function(strings_table,new_table)
        local num_table = {[256]=20}
        ]]..a..[[
    end)(]]..strings_string..[[,(function() return {} end))]]
    return code
end