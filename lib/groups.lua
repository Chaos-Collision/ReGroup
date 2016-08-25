
require 'lib/table'

regroup = regroup or {}

local groups = {}

local grp = {}
grp.order = 0
grp.groups = {}
grp.subgroup = {}
grp.subgroups = {}
grp.items = {}

grp.grp = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

function groups.translateOrder(order)
	--TODO improve handling for z+
	return grp.grp[(order)%25+1]
end

function groups.makegroup(name)
	log("create group: %s", name)
	data:extend({{
		type = "item-group",
		name = "rg-"..name,
		order = grp.order,
		inventory_order = grp.order,
		icon = "__ReGroup__/graphics/icons/category/" .. name .. ".png",
	}})
	grp.groups[name] = grp.order
	grp.order = grp.order + 1
end

function groups.makesubgroup(group, name)
	if grp.groups[group] == nil then
		log("missing group: %s for subgroup: %s", group, name)
		return
	end
	local order = grp.subgroup[group] or 0
	local grpKey = group .. '-' .. name

	if grp.subgroups[grpKey] ~= nil then
		log("sub-group already there: %s", name)
		return
	end

	log("create sub-group: %s in %s", name, group)
	data:extend({{
		type = "item-subgroup",
    	name =  "rg-" .. grpKey,
    	group = "rg-" .. group,
    	order = groups.translateOrder(order)
	}})
	grp.subgroups[grpKey] = order
	order = order + 1
	grp.subgroup[group] = order
end

function groups.subgroups(group, subgroups)
	table.iterate(subgroups, function(subgroup)
		groups.makesubgroup(group, subgroup)
	end)
end

function groups.raw_subgroups(group, subgroups)
	table.iterate(subgroups, function(subgroup)
		log("create sub-group: %s [%s] in %s", subgroup.name, tostring(subgroup.order), group)
		data:extend({{
			type = "item-subgroup",
			name =  subgroup.name,
			group = group,
			order = subgroup.order
		}})
	end)
end

function groups.insert_subgroups(group, subgroups, after)
	if grp.groups[group] == nil then
		log("missing group: %s for subgroup: %s", group, name)
		return
	end
	local amt = #subgroups
	local grpKey = group .. '-' .. after
	local afterGrp = grp.subgroups[grpKey]

	local oldSubgroups = Data.select("item%-subgroup:rg-"..group.."-.*")
	table.sort(oldSubgroups, function(a,b)
		return a.order < b.order
	end)
	local found = false
	table.iterate(oldSubgroups, function(subgroup)
		if found then
			--shift item count
			local grpKey = string.sub(subgroup.name, 4)
			local order = grp.subgroups[grpKey] + amt
			log("shift %s %s %s %s %s %s", subgroup.group, subgroup.name, subgroup.order, amt, grp.subgroups[grpKey], grpKey)
			subgroup.order = groups.translateOrder(order)
			grp.subgroups[grpKey] = order
		end
		if subgroup.name == "rg-" .. grpKey then
			found = true
		end
	end)
	--fix total count
	grp.subgroup[group] = grp.subgroup[group] + amt

	table.iterate(subgroups, function(subgroup)
		log("create sub-group: %s in %s after %s", subgroup, group, after)
		local grpKey = group .. '-' .. subgroup
		afterGrp = afterGrp + 1
		data:extend({{
			type = "item-subgroup",
			name =  "rg-" .. grpKey,
			group = "rg-" .. group,
			order = groups.translateOrder(afterGrp)
		}})
		grp.subgroups[grpKey] = afterGrp
	end)
end

function groups.table_item(item, group, subgroup, typeof)
	--full specified
	local typeof = item.typeof or typeof
	local order = item.order or groups.translateOrder(grp.items[group .. '-' .. subgroup] or 0)
	local subgroup = item.subgroup or ("rg-" .. group .. '-' .. subgroup)
	if data.raw[typeof][item.name] ~= nil then
		log("t-moving %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)
		local dta = data.raw[typeof][item.name]
		dta.order = order
		dta.inventory_order = order
		dta.subgroup = subgroup
	else
		log("t-missing %s -> %s -> %s [%s]", group, subgroup, item, typeof)
	end
end

function groups.createSelector(typeof)
	return function(tbl)
		table.each(tbl, function(subgroups, group)
		if grp.groups[group] == nil then
			log("missing group: %s", group)
			return
		end
		table.each(subgroups, function(items, subgroup)
			local grpKey = group .. '-' .. subgroup
			if grp.subgroups[grpKey] == nil then
				log("missing subgroup: %s in %s", subgroup, group)
				return
			end
			table.iterate(items, function(item)
				if type(item) == "table" then
					groups.table_item(item, group, subgroup, typeof)
				elseif type(item) == "string" then
					--default action
					local order = grp.items[grpKey] or 0
					local dta = data.raw[typeof][item]
					if dta ~= nil then
						log("moving %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)
						local translatedOrder = groups.translateOrder(order)
						dta.subgroup = "rg-"..grpKey
						dta.order = translatedOrder
						dta.inventory_order = translatedOrder

						grp.items[grpKey] = order + 1
					else
						log("missing %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)
					end
				else
					log("wrong format: %s -> %s -> %s {%s}", group, subgroup, tostring(item), typeof)
				end
			end)
		end)
	end)
	end
end

function groups.typeof(group, subgroup, item, checkRecipe)
	if checkRecipe and data.raw["recipe"][item] ~= nil then
		return "recipe"
	end

	local l = #regroup.config.item_types
	for i = 1, l, 1 do
		local typeof = regroup.config.item_types[i]
		if data.raw[typeof][item] then
			return typeof
		end
	end
	log("no type for %s -> %s -> %s", group, subgroup, item)
	return nil
end

function groups.moveData(group, subgroup, item, typeof)
	local grpKey = group .. '-' .. subgroup
	local order = grp.items[grpKey] or 0
	local translatedOrder = groups.translateOrder(order)

	local dataGrp = data.raw[typeof]
	if dataGrp == nil then
		log("invalid type %s -> %s -> %s [%s]", group, subgroup, item, typeof)
		return
	end

	local dta = data.raw[typeof][item]
	if dta then

		log("moving %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)

		dta.subgroup = "rg-"..grpKey
		dta.order = translatedOrder
		dta.inventory_order = translatedOrder

		grp.items[grpKey] = order + 1

	else 
		log("missing %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)
	end
end

function groups.insert(tbl)
	table.each(tbl, function(subgroups, group)
		if grp.groups[group] == nil then
			log("missing group: %s", group)
			return
		end
		table.each(subgroups, function(items, subgroup)
			local grpKey = group .. '-' .. subgroup
			if grp.subgroups[grpKey] == nil then
				log("missing subgroup: %s in %s", subgroup, group)
				return
			end
			table.iterate(items, function(item)
				if type(item) == "table" then
					groups.table_item(item, group, subgroup, typeof)
				elseif type(item) == "string" then
					--default action
					local typeof = groups.typeof(group, subgroup, item, true)
					groups.moveData(group, subgroup, item, typeof)
					
					if typeof == "recipe" then
						--we got a recipe now sort the item
						typeof = groups.typeof(group, subgroup, item, false)
					
						groups.moveData(group, subgroup, item, typeof)
					end
				else
					log("wrong format: %s -> %s -> %s {%s}", group, subgroup, tostring(item), typeof)
				end
			end)
		end)
	end)
end

function groups.reset_index(group, subgroup, idx)
	log("reset sub-group: %s in %s to %s", subgroup, group, tostring(idx))
	grp.subgroups[group .. '-' .. subgroup] = idx
end

function groups.raw_items(itmtbl)
	table.each(itmtbl, function(subgroups, group)
		if data.raw["item-group"][group] == nil then
			log("raw missing group: %s", group)
		end
		table.each(subgroups, function(items, subgroup)
			if data.raw["item-subgroup"][subgroup] == nil then
				log("raw missing subgroup: %s in %s", subgroup, group)
			end
			table.iterate(items, function(item)
				local dta = data.raw.item[item.name]
				if dta ~= nil then
					log("raw moving %s -> %s -> %s [%s]", group, subgroup, item.name, tostring(item.order))

					dta.subgroup = subgroup
					dta.order = item.order
					dta.inventory_order = item.order
				else
					log("raw missing %s -> %s -> %s [%s]", group, subgroup, item.name, tostring(item.order))
				end
			end)
		end)
	end)
end

regroup.group = groups