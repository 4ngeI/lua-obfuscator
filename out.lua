return (function(e, t, a, o, i, n)
	local s = {[256]=20};
	local h = _G.print;
	local r = _G.pairs;
	local d = _G.unpack;
	local l = _G.string;
	local c = e[1];
	local c = e[2];
	local t = t();
	local t = e[3];
	t = t:gsub(e[4], e[5]);
	h(o(a(23, 2), 5));
	h(e[6]);
	for e, e in r({1, 2, 3, 4, 5, 6, 7, 8, 9}) do
		if (o(256, s[256]) ~= 12) and (e >= 5) and (#s >= 1) then
			h(e);
		end
	end
	h(t);
	h(i(-1, 2) - 1);
	h(d({l[c](t, i(0, 1), 0 - 1)}));
	if (o(256, s[256]) ~= 12) and n(1, (function()
		return 1;
	end)()) and (o(256, s[256]) ~= 12) then
		h(t);
	end
end)({[1]="gsub", [2]="byte", [3]="TEST", [4]="T", [5]="_", [6]="hello world"}, function()
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
end);
