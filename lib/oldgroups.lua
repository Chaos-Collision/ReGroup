
function go.items(itmtbl)
	table.each(itmtbl, function(subgroups, group)
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
					go.table_item(item, group, subgroup)
				elseif type(item) == "string" then
					--default action
					log("default action")
					local order = grp.items[grpKey] or 0
					go.modItem(item, group, subgroup, go.translateOrder(order))
					grp.items[grpKey] = order + 1
				else
					log("wrong format: %s -> %s -> %s", group, subgroup, tostring(item))
				end
				--[[if data.raw.item[item] then
					local order = grp.items[grpKey] or 0
					local dta = data.raw.item[item]
					
					log("moving %s -> %s -> %s [%d]", group, subgroup, item, order)

					dta.subgroup = "go-" .. grpKey
					dta.order = order
					dta.inventory_order = order

					grp.items[grpKey] = order + 1
				else
					log("missing %s -> %s -> %s", group, subgroup, item)
				end]]
			end)
		end)
	end)
end

function go.recipes(recipetbl)
	table.each(recipetbl, function(subgroups, group)
		if grp.groups[group] == nil then
			log("r-missing group: %s", group)
			return
		end

		table.each(subgroups, function(items, subgroup)
			local grpKey = group .. '-' .. subgroup
			if grp.subgroups[grpKey] == nil then
				log("r-missing subgroup: %s in %s", subgroup, group)
				return
			end
			table.iterate(items, function(item)
				if data.raw.recipe[item] then
					local order = grp.items[grpKey] or 0
					local dta = data.raw.recipe[item]
					
					log("r-moving %s -> %s -> %s [%d]", group, subgroup, item, order)

					dta.subgroup = "go-" .. grpKey
					dta.order = order
					dta.inventory_order = order

					grp.items[grpKey] = order + 1
				else
					log("r-missing %s -> %s -> %s", group, subgroup, item)
				end
			end)
		end)
	end)
end

function go.special_items(itmtbl)
	table.each(itmtbl, function(subgroups, group)
		if grp.groups[group] == nil then
			log("s-missing group: %s", group)
			return
		end	
		table.each(subgroups, function(items, subgroup)
			local grpKey = group .. '-' .. subgroup
			if grp.subgroups[grpKey] == nil then
				log("s-missing subgroup: %s in %s", subgroup, group)
				return
			end
			table.iterate(items, function(item)
				local typeof = go.type_of(item) or "item"
				if data.raw[typeof][item] then				
					local order = grp.items[grpKey] or 0
					local dta = data.raw[typeof][item]

					log("s-moving %s -> %s -> %s [%s][%d]", group, subgroup, item, typeof, order)

					dta.subgroup = "go-" .. grpKey
					dta.order = order
					dta.inventory_order = order

					grp.items[grpKey] = order + 1
				else
					log("s-missing %s -> %s -> %s [%s]", group, subgroup, item, typeof)
				end
			end)
		end)
	end)
end