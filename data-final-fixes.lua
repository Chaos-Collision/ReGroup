
log = go.makelog("data-final-fixes")

--double check active mods to save performance...
if type(dimoresenable) == "nil" and type(inventorychanges) == "nil" then
	--5dim seems to be offline...
	config.active_mods["5dim"] = nil
	log("5dim force disabled")
end

if not data.raw.item["circuit-floor"] then
	--more_floors seems to be offline
	config.active_mods["more_floors"] = nil
	log("More_Floors force disabled")
end

go.loadmods(config.active_mods, config.mod_order)

if config.DEBUG_MODE then
	--log("[NAMES] => %s", go.dumpvar(data.raw, 3, 1))
	--log("[GROUPS] => %s", go.dumpvar(data.raw["item-group"], 2, 0))
	--log("[S_GROUPS] => %s", go.dumpvar(data.raw["item-subgroup"], 3, 0))
	--log("[ITEMS] => %s", go.dumpvar(data.raw.item, 2, 0))
--remove unused groups?
if false then
	local grp = {}
	local sgrp = {}
	local fullsgrp = {}
	for k,v in pairs(data.raw["item-subgroup"]) do
		--if v.enabled then
		if grp[v.group] == nil then
			grp[v.group] = {}
		end
		grp[v.group][k] = {}
		sgrp[k] = v.group
		fullsgrp[k] = v
		--log(go.dumpvar(v))
		--end
	end
	for _,typeof in pairs(config.item_types) do
		for k,v in pairs(data.raw[typeof]) do
			if v.subgroup ~= nil then
				table.insert(grp[sgrp[v.subgroup]][v.subgroup], v)
			end
			--log("k: %s, sgrp: %s sub: %s #%s", k, sgrp[v.subgroup], v.subgroup, tostring(#grp[sgrp[v.subgroup]][v.subgroup]))
		end
	end
	for k,v in pairs(data.raw.item) do
		--log("k: %s", k)
		--log("v.subgroup: %s", v.subgroup)
		--log("sgrp: %s", sgrp[v.subgroup])
		--log("grp: %s", grp[sgrp[v.subgroup]])
		--log("grps: %s", grp[sgrp[v.subgroup]][v.subgroup])
		--log("k: %s, sgrp: %s sub: %s #%s", k, sgrp[v.subgroup], v.subgroup, tostring(#grp[sgrp[v.subgroup]][v.subgroup]))
		if sgrp[v.subgroup] ~= nil then
			table.insert(grp[sgrp[v.subgroup]][v.subgroup], v)
		end		
	end
	for k,v in pairs(data.raw.recipe) do
		if v.subgroup ~= nil and sgrp[v.subgroup] ~= nil then
			table.insert(grp[sgrp[v.subgroup]][v.subgroup], v)
		end
		--log("k: %s, sgrp: %s sub: %s #%s", k, sgrp[v.subgroup], v.subgroup, tostring(#grp[sgrp[v.subgroup]][v.subgroup]))
	end

	table.each(grp, function(subgroups, group)
		log("GRP: %s", group)
		if group == "enemies" or 
		group == "environment" or 
		group == "other" or 
		group == "fluids" or
		group == "liquid"  then
			return
		end
		table.each(subgroups, function(items, subgroup) 
			log("SGRP: %s [%s]", subgroup, fullsgrp[subgroup].order)			
			--local hasMember = false
			table.iterate(items, function(v)
				log("order: %s name: %s", v.order, v.name)
				--hasMember = true
			end)
			--if not hasMember then
			--	log("delete: %s", subgroup)
			--	data.raw["item-subgroup"][subgroup] = nil
			--end
			--table.iterate(items, function(k, item) 
			--	log("ITM: %s SGRP: %s", item.name, item.subgroup)
			--end)
		end) 
	end)
end
end