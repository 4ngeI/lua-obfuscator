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
	local y = e[10];
	local y = e[11];
	local y = e[12];
	local y = e[13];
	local t = t();
	local function t(e, t)
		return (((e ^ 2) + (t ^ 2)) / (e * t)) + (o[r](e) * o[d](t));
	end
	local o = {x=5, y=2, values={10, 20, 30}};
	i(e[14]);
	o[l] = e[15];
	n[c](o[u], 40);
	i(e[16], o[m], o[w], o[l], n[f](o[u], e[17]));
	o[g] = t(o[m], o[w]);
	i(e[18], o[g]);
	if ((256 / a[256]) ~= 12) and (o[g] > 0) then
		i(e[19]);
	elseif ((256 / a[256]) ~= 12) and (o[g] < 0) then
		i(e[20]);
	else
		i(e[21]);
	end
	local e, e = s(function()
		h({e[22]});
	end);
	if ((256 / a[256]) ~= 12) and e then
		i(e[1]);
	end
	i(o[l]:byte(1, -1));
	local e = o[l]:sub(1, -1);
	local e = o[l]:gsub(1, -1);
	local e = o[l]:len();
end)({[1]="sin", [2]="cos", [3]="z", [4]="insert", [5]="values", [6]="x", [7]="y", [8]="concat", [9]="result", [10]="byte", [11]="sub", [12]="gsub", [13]="len", [14]="Hello", [15]="not amogus", [16]="Table content:", [17]=", ", [18]="Result:", [19]="Positive result", [20]="Negative result", [21]="Zero result", [22]="XD"}, function()
	return {};
end);
