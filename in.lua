local EMPTY_TABLE = {}
local const_test = "TEST"
const_test = const_test:gsub("T","_")
print(23*2/5)
print("hello world");
for i,v in pairs({1,2,3,4,5,6,7,8,9}) do
    if v >=5 then
        print(v)
    end
end
print(const_test)
print(-1+2-1)
print(unpack({string.byte(const_test,0+1,0-1)}))
if 1 == (function ()
    return 1 
end)() then
    print(const_test)
end