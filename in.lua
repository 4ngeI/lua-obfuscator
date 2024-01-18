local a = "test";
local b = "xd";
local c = print
local tbl = {[23132]="test",test="test",312312}
local empty_tbl = {}
c(a,b)
if #tbl == string.byte(string.sub(b,1,1),1,-1)-119 then
    print(tbl.test,tbl[23132])
end