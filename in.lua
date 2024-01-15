local a = "test";
a = a:gsub("t","_")
a = a.."_";
print(a)

local a = true;
local b = false;
print(a,b)
print(true,false)

local const_number = 10
print(12*5+10/2+5+5+5+5+5+5+5)
print(5+5)
print(10/2)
print(5*2)
print(const_number/5)

local x = 10
local y = 20
if x > y then
    print("x > y")
else
    print("y >= x")
end

local g = 85

if g >= 90 then
    print("A")
elseif g >= 80 then
    print("B")
elseif g >= 70 then
    print("C")
else
    print("D")
end

local a = 25
local v = (a >= 18) and "Y" or "N"
print( v)

local f = "a"

if f == "a" then
    print("apple")
elseif f == "b" then
    print("banana")
elseif f == "o" then
    print("orange")
else
    print("Unknown fruit")
end
