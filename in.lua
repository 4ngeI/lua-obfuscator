local a = {}
if 1 == 1 then
    table.insert(a,10,"TEST")
end
pcall(function ()
    print(a[10])
end)
for i,v in pairs(a) do
    if v~=nil then
        print(i,v)
    else
        print("NIL VALUE SKIP")
    end
end;
local function test(...)
    print(...)
end
test(321*1231/123,213+12-12)