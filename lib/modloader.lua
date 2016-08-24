
regroup = regroup or {}

local modloader = {}

function modloader.loadmod(mod)
	log("loading: %s", mod)

	local _log = log

	log = regroup.logging.makelog(mod)
	require("mods/" .. mod)
	--restore log
	log = _log
end

function modloader.loadmods(modlist, orderlist)
	for i=1,#orderlist,1 do
		local mod = modlist[orderlist[i]]
		if mod == nil then
			--do nothing
		elseif type(mod) == "table" then
			for _, submod in pairs(mod) do
				modloader.loadmod(orderlist[i] .. '/' .. submod)
			end
		else
			modloader.loadmod(mod)
		end

	end
end

regroup.modloader = modloader