local a = print; 
local b = {};
local idx = 1;
repeat
    b[idx]="test"
    idx=idx+1
until idx > 10
for i,v in pairs(b) do
    if i <= 5 then
        a(i,v) 
    end
end