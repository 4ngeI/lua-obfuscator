local parser = require("obfuscator.parser")
local options = require("obfuscator.options")

return function (code)
    local AST = parser.parse(code)
    if options.minify.variables then
        parser.minify(AST);
    end
    return parser.toLua(AST,options.minify.beautify)
end