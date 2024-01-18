local obfuscator = {}
function obfuscator:new()
    local newObj = { 
        obfuscate_functions = require("obfuscator.functions"),
        minifier = require("obfuscator.minifier"),
        in_function = require("obfuscator.infunction"),
        handle_empty_tables = require("obfuscator.handle_empty_tables"),
        numbers = require("obfuscator.numbers"),
        options = require("obfuscator.options"),
        parser = require("obfuscator.parser"),
        AntiTemper = require("obfuscator.idk"),
        pr1nt = require("obfuscator.pr1nt"):new()
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
    local suc, err = self:validateTree(ast);
    local START;
    local obfuscated_strings_number;

    if not err then
        START = os.clock()
        code = self.parser.toLua(ast)

        --< STEPS_START >--
        code = self.AntiTemper(code)
        code = self.handle_empty_tables(code)
        if self.options.functions then
            code = self.obfuscate_functions(code)
        end
        code = self.in_function(code)
        code = self.numbers(code)
        code,obfuscated_strings_number = self.minifier(code)
        ---< STEPS_END >--

        self.pr1nt:set_color("green")
        self.pr1nt:print("time to obfusscate: "..os.clock()-START)
        self.pr1nt:print("Encrypted strings: "..obfuscated_strings_number)
        return code
    else
        self.pr1nt:set_color("red")
        self.pr1nt:print("syntax error")
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
