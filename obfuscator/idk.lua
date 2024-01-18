return function (code)
    return [[ 
        local valid = true;
        local a = "what"
        local get_info_var = "getinfo"
        local debug_var = _G["debug"]
        local funcs = {pcall, string.char, debug.getinfo,string.byte,string.sub,string.gsub}
        for i = 1, #funcs do
            if debug_var and debug_var[get_info_var] then
                if debug_var[get_info_var](funcs[i])[a] ~= "C" then
                    valid = false;
                end
            end
        end
        if valid then 
            ]]..code..[[
        else
            return table.remove(strings_table)
        end
    ]]
end