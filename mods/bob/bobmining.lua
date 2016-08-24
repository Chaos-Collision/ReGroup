
log("bobmining")

go.reset_index("armor", "tool", 2)

go.tools({
	["armor"] = {
		["tool"] = {
			"brass-axe",
			"cobalt-axe",
			"titanium-axe",
			"tungsten-axe",
			"diamond-axe",
			{["name"]="repair-pack",["typeof"]="repair-tool"}
		}
	}
})

go.subgroups("machine", {
	"basic",
	"drill",
	"range-drill",
	"furnace",
	"e-furnace",
	"s-furnace",
	"pumpjack",
	"water-pumpjack",
	"assembling",
	"circuit-assembling",
	"chemical",
	"electrolyser",
	"oil-refinery",
	"rocket"
})

go.items({
	["machine"] = {
		["basic"] = {
			"burner-mining-drill",
			"electric-mining-drill"
		},
		["drill"] = {	
			"bob-mining-drill-1",
			"bob-mining-drill-2",
			"bob-mining-drill-3",
			"bob-mining-drill-4"
		},
		["range-drill"] = {
			"bob-area-mining-drill-1",
			"bob-area-mining-drill-2",
			"bob-area-mining-drill-3",
			"bob-area-mining-drill-4"
		},
		["furnace"] = {
			"stone-furnace",
			"chemical-boiler",
			"mixing-furnace",
			"steel-furnace"	
		},
		["e-furnace"] = {
			"electric-furnace",
			"electric-furnace-2",
			"electric-furnace-3"
		},
		["s-furnace"] = {
			"chemical-furnace",
			"electric-mixing-furnace",
			"electric-chemical-mixing-furnace",
			"electric-chemical-mixing-furnace-2"
		},
		["pumpjack"] = {
			"pumpjack",
			"bob-pumpjack-1",
			"bob-pumpjack-2",
			"bob-pumpjack-3",
			"bob-pumpjack-4"
		},
		["water-pumpjack"] = {
			"water-miner-1",
			"water-miner-2",
			"water-miner-3",
			"water-miner-4",
			"water-miner-5"
		},
		["assembling"] = {
			"assembling-machine-1",
			"assembling-machine-2",
			"assembling-machine-3",
			"assembling-machine-4",
			"assembling-machine-5",
			"assembling-machine-6"
		},
		["circuit-assembling"] = {
			"electronics-machine-1",
			"electronics-machine-2",
			"electronics-machine-3"
		},
		["chemical"] = {
			"chemical-plant",
			"chemical-plant-2",
			"chemical-plant-3",
			"chemical-plant-4"
		},
		["electrolyser"] = {
			"electrolyser",
			"electrolyser-2",
			"electrolyser-3",
			"electrolyser-4"
		},
		["oil-refinery"] = {
			"oil-refinery",
			"oil-refinery-2",
			"oil-refinery-3",
			"oil-refinery-4"
		},
		["rocket"] = {
			"rocket-silo"
		}
	},
	["module"] = {
		["lab"] = {
			"lab-2",
			"lab-alien",
			"lab-module"
		}
	}
})