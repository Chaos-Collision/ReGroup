
function table.iterate(tbl, fn)
	local l = #tbl
	for i = 1, l, 1 do
		fn(tbl[i])
	end
end