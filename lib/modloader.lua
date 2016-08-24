
function go.loadmod(mod)
	log("loading: %s", mod)

	local _log = log

	log = go.makelog(mod)
	require("mods/" .. mod)
	--restore log
	log = _log
end

function go.loadmods(modlist, orderlist)
	for i=1,#orderlist,1 do
		local mod = modlist[orderlist[i]]
		if mod == nil then
			--do nothing
		elseif type(mod) == "table" then
			for _, submod in pairs(mod) do
				go.loadmod(orderlist[i] .. '/' .. submod)
			end
		else
			go.loadmod(mod)
		end

	end
end