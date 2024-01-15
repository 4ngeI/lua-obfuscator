local parser = require("obfuscator.parser")
local strings = require("obfuscator.strings");
local fake_conditions = require("obfuscator.cf.conditions")
local math = require("obfuscator.math")
local check_eq = require("obfuscator.eq")

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
    a = math(a)
    a = check_eq(a)
    code = [[
    return(function(strings_table,new_table,mul,div,sum,check_eq)
        local num_table = {[256]=20}
        ]]..a..[[
    end)(]]..strings_string..[[,
    (function() 
        return {} 
    end),
    (function (...)
        local idx = 2;
        local args = {...}
        local num_def = args[1] or 1;
        while idx <= #args do
            num_def = num_def * args[idx]
            idx=idx+1
        end
        return num_def
    end),
    (function (...)
        local idx = 2;
        local args = {...}
        local num_def = args[1] or 1;
        while idx <= #args do
            num_def = num_def / args[idx]
            idx=idx+1
        end
        return num_def
    end),
    (function (...)
        local idx = 2;
        local args = {...}
        local num_def = args[1] or 1;
        while idx <= #args do
            num_def = num_def + args[idx]
            idx=idx+1
        end
        return num_def
    end),
    (function (a,b)
        if a == b then return true end
        return false
    end)
    )]]
    return code
end