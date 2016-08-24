
log = regroup.logging.makelog("data-final-fixes")

--double check active mods to save performance...
if type(dimoresenable) == "nil" and type(inventorychanges) == "nil" then
	--5dim seems to be offline...
	regroup.config.active_mods["5dim"] = nil
	log("5dim force disabled")
end

if not data.raw.item["circuit-floor"] then
	--more_floors seems to be offline
	regroup.config.active_mods["more_floors"] = nil
	log("More_Floors force disabled")
end

local mapping = {
	["items"] = "item",
	["recipes"] = "recipe",
	["tools"] = "mining-tool",
	["guns"] = "gun",
	["modules"] = "module",
	["ammos"] = "ammo",
	["armors"] = "armor",
	["capsules"] = "capsule",
}

--create shortcuts
table.each(mapping, function(v,k)
	regroup.group[k] = regroup.group.createSelector(v)
end)

regroup.modloader.loadmods(regroup.config.active_mods, regroup.config.mod_order)

if regroup.config.DEBUG_MODE then
	--log("[NAMES] => %s", go.dumpvar(data.raw, 3, 1))
	--log("[GROUPS] => %s", go.dumpvar(data.raw["item-group"], 2, 0))
	--log("[S_GROUPS] => %s", go.dumpvar(data.raw["item-subgroup"], 3, 0))
	--log("[ITEMS] => %s", go.dumpvar(data.raw.item, 2, 0))
end