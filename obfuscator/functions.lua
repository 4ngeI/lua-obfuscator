local parser = require("obfuscator.parser")
local util = require("obfuscator.util")
local table_find = util.table_find

return function (code)
    local functions = {}
    local function_list = ""
    local lookupslist = "";
    local lookup_index = 1;
    local AST;
    local look_up_table = {}

    do --make list
        local tokens = parser.tokenize(code);
        local AST = parser.parse(tokens);
        for i,v in pairs(tokens) do
            if v.type == "identifier" and getfenv()[v.value] and not table_find(functions,v.value) then
                table.insert(functions,v.value)
            end
        end

        for i,v in pairs(functions) do
            function_list = function_list.."local "..v.."_var=_G['"..v.."'];"
        end
        parser.traverseTree(AST,function (node)
            if node.type == "lookup" and node.member and node.member.value then
                if not table_find(look_up_table,node.member.value) then
                    if type(node.member.value) ~= "number" then
                        table.insert(look_up_table,node.member.value)
                        lookupslist = lookupslist.."local "..node.member.value.."_var=".."'"..node.member.value.."';"
                    end
                end
            elseif node.type == "identifier" and getfenv()[node.name] then
                node.name = node.name.."_var"
            end
        end)
        code = parser.toLua(AST)
    end
    do  --lookups
        AST = parser.parse(code)
        parser.traverseTree(AST,function(node)
            if node.type == "call" then
                if not node.method then
                    if node.callee.type == "lookup" then
                        if type(node.callee.member.value) ~= "number" then
                            node.callee.member = parser.newNode("identifier",node.callee.member.value.."_var")
                        end
                    end
                else
                    node.callee.mod = true;
                end
            elseif node.type == "lookup" then
                if node.member.value ~= nil and type(node.member.value) ~= "number" and not node.mod then
                    node.member = parser.newNode("identifier",node.member.value.."_var")
                end
            end
        end)
        code = parser.toLua(AST,true)
    end
    code = function_list..lookupslist..code
    AST = parser.parse(code)
    code = parser.toLua(AST)
    return code
end