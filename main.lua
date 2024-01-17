local obfuscate_functions = require("obfuscator.functions");
local minifier = require("obfuscator.minifier")
local in_function = require("obfuscator.infunction")
local handle_empty_tables = require("obfuscator.handle_empty_tables")
local numbers = require("obfuscator.numbers")
local options = require("obfuscator.options")
local parser = require("obfuscator.parser")

function Init()
    local code = io.open("in.lua","rb"):read("*a");
    local ast = parser.parse(code);
    local suc,err = pcall(function ()
        parser.validateTree(ast)
    end)
    if not err then
        code = parser.toLua(ast)
        code = handle_empty_tables(code)
        if options.functions then
            code = obfuscate_functions(code)
        end
        code = in_function(code)
        code = numbers(code)
        code = minifier(code)
        io.open("out.lua","wb"):write(code)
    else
        print("syntax error")
    end
end

Init()