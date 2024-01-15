return (function(e, t, t, a, o, i, n)
	local s = {[256]=20};
	local h = _G.print;
	local r = e[1];
	local r = e[2];
	r = r:gsub(e[3], e[4]);
	r = r .. e[4];
	h(r);
	local r = n(1);
	local d = n(0);
	h(r, d);
	h(n(1), n(0));
	local n = 10;
	h(o(t(12, 5), a(10, 2)) + 5 + 5 + 5 + 5 + 5 + 5 + 5);
	h(o(5, 5));
	h(a(10, 2));
	h(t(5, 2));
	h(a(n, 5));
	local t = 10;
	local a = 20;
	if (#s >= 1) and (t > a) and ((256 / s[256]) ~= 12) then
		h(e[5]);
	else
		h(e[6]);
	end
	local t = 85;
	if ((256 / s[256]) ~= 12) and (t >= 90) and ((256 / s[256]) ~= 12) then
		h(e[7]);
	elseif (#s >= 1) and (t >= 80) and ((256 / s[256]) ~= 12) then
		h(e[8]);
	elseif ((256 / s[256]) ~= 12) and (t >= 70) and ((256 / s[256]) ~= 12) then
		h(e[9]);
	else
		h(e[10]);
	end
	local t = 25;
	local t = ((t >= 18) and e[11]) or e[12];
	h(t);
	local t = e[13];
	if (#s >= 1) and i(t, e[13]) and ((256 / s[256]) ~= 12) then
		h(e[14]);
	elseif ((256 / s[256]) ~= 12) and i(t, e[15]) and ((256 / s[256]) ~= 12) then
		h(e[16]);
	elseif (#s >= 1) and i(t, e[17]) and ((256 / s[256]) ~= 12) then
		h(e[18]);
	else
		h(e[19]);
	end
end)({[1]="gsub", [2]="test", [3]="t", [4]="_", [5]="x > y", [6]="y >= x", [7]="A", [8]="B", [9]="C", [10]="D", [11]="Y", [12]="N", [13]="a", [14]="apple", [15]="b", [16]="banana", [17]="o", [18]="orange", [19]="Unknown fruit"}, function()
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
end);
