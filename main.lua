local obfuscator = {}
function obfuscator:new()
    local newObj = { 
        obfuscate_functions = require("obfuscator.functions"),
        minifier = require("obfuscator.minifier"),
        in_function = require("obfuscator.infunction"),
        handle_empty_tables = require("obfuscator.handle_empty_tables"),
        numbers = require("obfuscator.numbers"),
        options = require("obfuscator.options"),
        parser = require("obfuscator.parser")
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function obfuscator:validateTree(ast) --from dumb parser
    local suc, err = pcall(function()
        self.parser.validateTree(ast)
    end)
    return suc, err
end

function obfuscator:obfuscate(code)
    local ast = self.parser.parse(code)
    local suc, err = self:validateTree(ast)

    if not err then
        code = self.parser.toLua(ast)

        --< STEPS >--
        code = self.handle_empty_tables(code)
        if self.options.functions then
            code = self.obfuscate_functions(code)
        end
        code = self.in_function(code)
        code = self.numbers(code)
        code = self.minifier(code)
        return code
    else
        print("syntax error")
        return nil
    end
end

function obfuscator:_read_and_write_(input_name, output_name)
    local code = io.open(input_name, "rb"):read("*a")
    code = self:obfuscate(code)
    if code then
        io.open(output_name, "wb"):write(code)
    end
end

local new_ob = obfuscator:new()
new_ob:_read_and_write_("in.lua", "out.lua")
