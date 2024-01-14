local obfuscate_functions = require("obfuscator.functions");
local minifier = require("obfuscator.minifier")
local in_function = require("obfuscator.infunction")
local handle_empty_tables = require("obfuscator.handle_empty_tables")
local options = require("obfuscator.options")

function Init()
    local code = io.open("in.lua","rb"):read("*a");
    code = handle_empty_tables(code)
    if options.functions then
        code = obfuscate_functions(code)
    end
    code = in_function(code)
    code = minifier(code)
    io.open("out.lua","wb"):write(code)
end

Init()