return (function(e, t, a, a, a, o, o, o, i, i, n, s)
	local s = {[256]=20};
	local h = _G.print;
	local r = _G.pairs;
	local h = h;
	local t = t();
	local d = 1;
	repeat
		t[d] = e[1];
		d = a(d, 1);
	until i(d, 10)
	for e, t in r(t) do
		if ((s[256] ^ 4) ~= (103219 - 1)) and n(e, 5) and o(256 / s[256], 12) then
			h(e, t);
		end
	end
end)({[1]="test"}, function()
	return {};
end, function(...)
	local e = 2;
	local t = {...};
	local a = t[1] or 1;
	while e <= #t do
		a = a * t[e];
		e = e + 1;
	end
	return a;
end, function(...)
	local e = 2;
	local t = {...};
	local a = t[1] or 1;
	while e <= #t do
		a = a / t[e];
		e = e + 1;
	end
	return a;
end, function(...)
	local e = 2;
	local t = {...};
	local a = t[1] or 1;
	while e <= #t do
		a = a + t[e];
		e = e + 1;
	end
	return a;
end, function(e, t)
	if e == t then
		return true;
	end
	return false;
end, function(e)
	if e == 1 then
		return true;
	else
		return false;
	end
end, function(e, t)
	if e ~= t then
		return true;
	end
	return false;
end, function(e, t)
	if e < t then
		return true;
	end
	return false;
end, function(e, t)
	if e > t then
		return true;
	end
	return false;
end, function(e, t)
	if e <= t then
		return true;
	end
	return false;
end, function(e, t)
	if e >= t then
		return true;
	end
	return false;
end);
