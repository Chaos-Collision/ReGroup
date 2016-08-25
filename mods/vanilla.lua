
log("vanilla")

regroup.group.subgroups("transport", {
	"belt",
	"ground",
	"splitter",
	"pipe",
	"pipe-to-ground"
})

regroup.group.subgroups("floor", {
	"basic",
	"concrete",
	"other"
})

regroup.group.subgroups("drone", {
	"logistic-robot",
	"construction-robot",
	"chest",
	"roboport",
	"blueprint"
})

regroup.group.subgroups("vehicle", {
	"car",
	"tank",
	"train",
	"rail",
	"signal"
})

regroup.group.subgroups("energy", {
	"offshore",
	"boiler",
	"steam-engine",
	"pump",
	"solar",
	"accumulator",
	"poles",
	"lamp"
})

regroup.group.subgroups("defense", {
	"turret",
	"flame-turret",
	"laser",
	"mine",
	"wall",
	"gate",
	"radar"
})

regroup.group.subgroups("armor", {
	"tool",
	"armor",
	"energy",
	"shield",
	"battery",
	"movement",
	"combat"
})

regroup.group.subgroups("gun", {
	"rifle",
	"shotgun",
	"rocket",
	"flame",
	"throw",
	"tank"
})

regroup.group.subgroups("module", {
	"lab",
	"beacon",
	"speed",
	"effectivity",
	"productivity"
})

regroup.group.insert({
	["transport"] = {
		["belt"] = {
			"transport-belt",
			"fast-transport-belt",
			"express-transport-belt"
		},
		["ground"] = {
			"underground-belt",
			"fast-underground-belt",
			"express-underground-belt"
		},
		["splitter"] = {
			"splitter",
			"fast-splitter",
			"express-splitter"
		},
		["pipe"] = {
			"pipe"
		},
		["pipe-to-ground"] = {
			"pipe-to-ground"
		}
	},
	["floor"] = {
		["basic"] = {
			"stone-brick"
		},
		["concrete"] = {
			"concrete",
			"hazard-concrete"
		},
		["other"] = {
			"landfill"
		}
	},
	["drone"] = {
		["blueprint"] = {
			{["name"]="deconstruction-planner",["typeof"]="deconstruction-item"},
			{["name"]="blueprint",["typeof"]="blueprint"},
			{["name"]="blueprint-book",["typeof"]="blueprint-book"}
		},
		["logistic-robot"] = { "logistic-robot" },
		["construction-robot"] = { "construction-robot" },
		["chest"] = {
			"logistic-chest-active-provider",
			"logistic-chest-passive-provider",
			"logistic-chest-requester",
			"logistic-chest-storage"
		},
		["roboport"] = { "roboport" }
	},
	["vehicle"] = {
		["car"] = { "car" },
		["tank"] = { "tank" },
		["train"] = {
			"diesel-locomotive",
			"cargo-wagon"
		},
		["rail"] = {
			{["name"] = "rail", ["typeof"] = "rail-planner"}
		},
		["signal"] = {
			"train-stop",
			"rail-signal",
			"rail-chain-signal"
		}
	},
	["energy"] = {
		["offshore"] = { "offshore-pump" },
		["boiler"] = { "boiler" },
		["steam-engine"] = { "steam-engine" },
		["pump"] = { "small-pump" },
		["solar"] = { "solar-panel"},
		["accumulator"] = { "accumulator" },
		["poles"] = {
			"small-electric-pole",
			"medium-electric-pole",
			"big-electric-pole",
			"substation"
		},
		["lamp"] = { "small-lamp" }
	},
	["defense"] = {
		["turret"] = { "gun-turret" },
		["flame-turret"] = { "flamethrower-turret" },
		["laser"] = { "laser-turret" },
		["mine"] = { "land-mine" },
		["wall"] = { "stone-wall" },
		["gate"] = { "gate" },
		["radar"] = { "radar" }
	},
	["armor"] = {
		["energy"] = {
			"solar-panel-equipment",
			"fusion-reactor-equipment"
		},
		["shield"] = {
			"energy-shield-equipment",
			"energy-shield-mk2-equipment"
		},
		["battery"] = {
			"battery-equipment",
			"battery-mk2-equipment"
		},
		["movement"] = {
			"exoskeleton-equipment",
		},
		["combat"] = {
			"personal-laser-defense-equipment",
			{["name"]="discharge-defense-remote",["typeof"]="capsule"},
			"discharge-defense-equipment",
			"personal-roboport-equipment",
			"night-vision-equipment"
		},

	},
	["module"] = {
		["lab"] = { "lab" },
		["beacon"] = { "beacon" }
	}
})

regroup.group.insert({
	["module"] = {
		["effectivity"] = {
			"effectivity-module",
			"effectivity-module-2",
			"effectivity-module-3"
		},
		["productivity"] = {
			"productivity-module",
			"productivity-module-2",
			"productivity-module-3"
		},
		["speed"] = {
			"speed-module",
			"speed-module-2",
			"speed-module-3"
		}
	}
})

regroup.group.insert({
	["gun"] = {
		["rifle"] = {
			"pistol",
			"submachine-gun",
		},
		["shotgun"] = {
			"shotgun",
			"combat-shotgun",
		},
		["rocket"] = {
			"rocket-launcher",
		},
		["flame"] = {
			"flame-thrower",
		}
	}
})

regroup.group.insert({
	["gun"] = {
		["rifle"] = {
			"firearm-magazine",
			"piercing-rounds-magazine"
		},
		["shotgun"] = {
			"shotgun-shell",
			"piercing-shotgun-shell"
		},
		["rocket"] = {
			"rocket",
			"explosive-rocket"
		},
		["flame"] = {
			"flame-thrower-ammo"
		},
		["tank"] = {
			"cannon-shell",
			"explosive-cannon-shell"
		}
	}
})

regroup.group.insert({
	["gun"] = {
		["throw"] = {
			"grenade",
			"cluster-grenade",
			"poison-capsule",
			"slowdown-capsule",
			"defender-capsule",
			"destroyer-capsule",
			"distractor-capsule"
		}
	}
})

regroup.group.insert({
	["armor"] = {
		["tool"] = {
			"iron-axe",
			"steel-axe",
			{["name"]="repair-pack",["typeof"]="repair-tool"}
		}
	}
})

regroup.group.insert({
	["armor"] = {
		["armor"] = {
			"light-armor",
			"heavy-armor",
			"modular-armor",
			"power-armor",
   			"power-armor-mk2",
		}
	}
})

regroup.group.raw_subgroups("production", {
	{["name"] = "rocket-silo", ["order"] = "g"}
})

regroup.group.raw_items({
	["production"] = {
		["rocket-silo"] = {
			{["name"] = "rocket-silo", ["order"] = 0}
		}
}})