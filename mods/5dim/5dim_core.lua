
log("5dim_core")

regroup.group.subgroups("machine", {
	"storage",
	"drill",
	"speed-drill",
	"range-drill",
	"masher",
	"furnace-stone",
	"furnace-steel",
	"furnace-electric",
	"assembler"
})

regroup.group.subgroups("resource", {
	"dust",
	"dust-plate",
	"ore-plate",
	"wood",
	"steel",
	"petro"
})

regroup.group.items({
	["machine"] = {
		["storage"] = {
			"wooden-chest",
			"iron-chest",
			"steel-chest"
		},
		["drill"] = {
			"burner-mining-drill",
			"electric-mining-drill"
		},
		["furnace-stone"] = {
			"stone-furnace"
		},
		["furnace-steel"] = {
			"steel-furnace"
		},
		["furnace-electric"] = {
			"electric-furnace"
		},
		["assembler"] = {
			"assembling-machine-1",
			"assembling-machine-2",
			"assembling-machine-3"
		}
	},
	["resource"] = {
		["ore-plate"] = {
			"iron-plate",
			"copper-plate"
		},
		["wood"] = {
			"raw-wood",
			"wood"
		},
		["steel"] = {
			"steel-plate",
			"empty-barrel",
			{["name"]="empty-barrel",["typeof"]="recipe"}
		},
		["petro"] = {
			"sulfur",
			"plastic-bar"
		}
	}
})

regroup.group.raw_items({
	["intermediate"] = {
		["intermediate-silo"] = {
			{["name"] = "rocket-silo", ["order"] = "h"}
		}
}})
