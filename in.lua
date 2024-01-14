local EMPTY_TABLE = {}
local function aaaa(x, y)
    return (x^2 + y^2) / (x * y) + math.sin(x) * math.cos(y)
end
local aaa = {x = 5, y = 2, values = {10, 20, 30}}
print("Hello")
aaa.z = "not amogus"
table.insert(aaa.values, 40)
print("Table content:", aaa.x, aaa.y, aaa.z, table.concat(aaa.values, ", "))
aaa.result = aaaa(aaa.x, aaa.y)
print("Result:", aaa.result)
if aaa.result > 0 then
    print("Positive result")
elseif aaa.result < 0 then
    print("Negative result")
else
    print("Zero result")
end
local _,err = pcall(function ()
    error({"XD"})
end)
if err then
    print(err[1])
end
print(aaa.z:byte(1,-1))
local a = aaa.z:sub(1,-1)
local a = aaa.z:gsub(1,-1)
local e = aaa.z:len()