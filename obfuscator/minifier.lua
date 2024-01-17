local minifier = {}

function minifier:minify_init(code)
    local tbl = {
        parser = require("obfuscator.parser"),
        options = require("obfuscator.options"),
        strings = require("obfuscator.strings"),
        code = code,
    }
    setmetatable(tbl,self)
    self.__index = self; 
    return tbl:step()
end

function minifier:step()
    local AST = self.parser.parse(self.code)
    local _,strings_table = self.strings(self.code);
    if self.options.minify.variables then
        self.parser.minify(AST)
    end
    return self.parser.toLua(AST,self.options.minify.beautify),#strings_table
end

return function (code)
    return minifier:minify_init(code);
end