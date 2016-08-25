
function table.iterate(tbl, fn)
	local l = #tbl
	for i = 1, l, 1 do
		local ret = fn(tbl[i])
		if type(ret) ~= "nil" then
			return ret
		end
	end
end