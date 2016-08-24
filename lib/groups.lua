
require 'lib/table'

grp = {}
grp.order = 0
grp.groups = {}
grp.subgroup = {}
grp.subgroups = {}
grp.items = {}

grp.grp = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

function go.translateOrder(order)
	return grp.grp[(order)%25+1]
end

function go.type_of(name)
	local item_type = nil	
	for _,type_name in pairs(config.item_types) do
		if type_name ~= "recipe" and data.raw[type_name][name] then
			if type_name ~= "item" then return type_name end
			item_type = type_name
		end
	end
	
	return item_type
end

function go.makegroup(name)
	log("create group: %s", name)
	data:extend({{
		type = "item-group",
		name = "go-"..name,
		order = grp.order,
		inventory_order = grp.order,
		icon = "__ReGroup__/graphics/icons/category/" .. name .. ".png",
	}})
	grp.groups[name] = grp.order
	grp.order = grp.order + 1
end

function go.makesubgroup(group, name)
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
    	name =  "go-" .. grpKey,
    	group = "go-" .. group,
    	order = go.translateOrder(order)
	}})
	grp.subgroups[grpKey] = order
	order = order + 1
	grp.subgroup[group] = order
end

function go.subgroups(group, subgroups)
	table.iterate(subgroups, function(subgroup)
		go.makesubgroup(group, subgroup)
	end)
end

function go.raw_subgroups(group, subgroups)
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

function go.insert_subgroups(group, subgroups, after)
	if grp.groups[group] == nil then
		log("missing group: %s for subgroup: %s", group, name)
		return
	end
	local amt = #subgroups
	local grpKey = group .. '-' .. after
	local afterGrp = grp.subgroups[grpKey]

	local oldSubgroups = Data.select("item%-subgroup:go-"..group.."-.*")
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
			subgroup.order = go.translateOrder(order)
			grp.subgroups[grpKey] = order
		end
		if subgroup.name == "go-" .. grpKey then
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
			name =  "go-" .. grpKey,
			group = "go-" .. group,
			order = go.translateOrder(afterGrp)
		}})
		grp.subgroups[grpKey] = afterGrp
	end)
end

function go.table_item(item, group, subgroup, typeof)
	--full specified
	local typeof = item.typeof or typeof
	local order = item.order or go.translateOrder(grp.items[group .. '-' .. subgroup] or 0)
	local subgroup = item.subgroup or ("go-" .. group .. '-' .. subgroup)
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

function go.createSelector(typeof)
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
					go.table_item(item, group, subgroup, typeof)
				elseif type(item) == "string" then
					--default action
					--log("default action")
					local order = grp.items[grpKey] or 0
					local dta = data.raw[typeof][item]
					if dta ~= nil then
						log("moving %s -> %s -> %s [%s] {%s}", group, subgroup, item, tostring(order), typeof)
						
						dta.subgroup = "go-"..grpKey
						dta.order = go.translateOrder(order)
						dta.inventory_order = go.translateOrder(order)

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

function go.reset_index(group, subgroup, idx)
	log("reset sub-group: %s in %s to %s", subgroup, group, tostring(idx))
	grp.subgroups[group .. '-' .. subgroup] = idx
end

go.items = go.createSelector("item")
go.recipes = go.createSelector("recipe")
go.tools = go.createSelector("mining-tool")
go.guns = go.createSelector("gun")
go.modules = go.createSelector("module")
go.ammos = go.createSelector("ammo")
go.armors = go.createSelector("armor")
go.capsules = go.createSelector("capsule")

function go.raw_items(itmtbl)
	table.each(itmtbl, function(subgroups, group)
		if data.raw["item-group"][group] == nil then
			log("raw missing group: %s", group)
		end
		table.each(subgroups, function(items, subgroup)
			if data.raw["item-group"][subgroup] == nil then
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