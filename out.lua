return (function(e, t)
	local a = {[256]=20};
	local o = _G.math;
	local i = _G.print;
	local n = _G.table;
	local s = _G.pcall;
	local h = _G.error;
	local r = e[1];
	local d = e[2];
	local l = e[3];
	local c = e[4];
	local u = e[5];
	local m = e[6];
	local w = e[7];
	local f = e[8];
	local g = e[9];
	local t = t();
	local function t(e, t)
		return (((e ^ 2) + (t ^ 2)) / (e * t)) + (o[r](e) * o[d](t));
	end
	local o = {x=5, y=2, values={10, 20, 30}};
	i(e[10]);
	o[l] = e[11];
	n[c](o[u], 40);
	i(e[12], o[m], o[w], o[l], n[f](o[u], e[13]));
	o[g] = t(o[m], o[w]);
	i(e[14], o[g]);
	if ((256 / a[256]) ~= 12) and (o[g] > 0) then
		i(e[15]);
	elseif ((256 / a[256]) ~= 12) and (o[g] < 0) then
		i(e[16]);
	else
		i(e[17]);
	end
	local e, e = s(function()
		h({e[18]});
	end);
	if ((256 / a[256]) ~= 12) and e then
		i(e[1]);
	end
end)({[1]="sin", [2]="cos", [3]="z", [4]="insert", [5]="values", [6]="x", [7]="y", [8]="concat", [9]="result", [10]="Hello", [11]="not amogus", [12]="Table content:", [13]=", ", [14]="Result:", [15]="Positive result", [16]="Negative result", [17]="Zero result", [18]="XD"}, function()
	return {};
end);
