local obfuscator = {}

local parser = require("obfuscator.parser")
local strings = require("obfuscator.strings");
local fake_conditions = require("obfuscator.cf.conditions")
local math = require("obfuscator.math")
local check_eq = require("obfuscator.eq")
local bool_values = require("obfuscator.bool")

function obfuscator:new(code)
    local tbl = {
        code = code,
        strings_table = {},
        strings_string = "",
    }
    setmetatable(tbl,self);
    self.__index = self
    return tbl
end

function obfuscator:processStrings()
    local obfuscated_strings_code,strings_table = strings(self.code);
    self.strings_table = strings_table
    
    for i, v in pairs(self.strings_table) do
        self.strings_string = self.strings_string .. "[" .. v.index .. "]='" .. v.value .. "',"
    end
    
    self.strings_string = "{" .. self.strings_string .. "}"
    self.code = obfuscated_strings_code
end

function obfuscator:ob_math()
    self.code = math(self.code)
end

function obfuscator:ob_booleans()
    self.code = bool_values(self.code) 
end

function obfuscator:conditions()
    self.code = fake_conditions(self.code)
end

function obfuscator:check_eq()
    self.code = check_eq(self.code)
end

function obfuscator:general()
    self:processStrings()
    self:ob_math()
    self:conditions()
    self:ob_booleans()
    self:check_eq()
    local params = [[(]]..self.strings_string..[[,
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
    end),
    (function(num)
        if num == 1 then 
            return true 
        end
        return false
    end),
    (function (a,b)
        if a ~= b then return true end
        return false
    end),
    (function (a,b)
        if a < b then return true end
        return false
    end),
    (function (a,b)
        if a > b then return true end
        return false
    end),
    (function (a,b)
        if a <= b then return true end
        return false
    end),
    (function (a,b)
        if a >= b then return true end
        return false
    end)
    )
    ]]
    self.code = [[
        return(function(strings_table,new_table,mul,div,sum,check_eq,bool_func,check_ne,check_lt,check_gt,check_le,check_ge)
            local num_table = {[256]=20}
            ]]..self.code..[[
        end)]]..params..[[]]
    return self.code
end

return function (code)
    local main = obfuscator:new(code);
    return main:general()
end