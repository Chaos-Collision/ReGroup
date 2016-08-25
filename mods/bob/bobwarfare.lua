
log("bobwarfare")

regroup.group.insert_subgroups("defense", {"s-turret"}, "turret")

regroup.group.insert_subgroups("gun", {
	"rifle-ammo",
}, "rifle")

regroup.group.insert_subgroups("gun", {
	"shotgun-ammo",
	"laser-rifle",
	"laser-ammo"
}, "shotgun")

regroup.group.insert_subgroups("gun", {
	"rocket-ammo",
}, "rocket")

regroup.group.subgroups("gun", {
	"artillery",
	"robot"
})

regroup.group.insert_subgroups("armor", {"solar"}, "energy")

regroup.group.subgroups("armor", {
	"laser",
	"nightvision"
})

regroup.group.reset_index("armor", "energy", 0)
regroup.group.reset_index("armor", "combat", 2)
regroup.group.reset_index("gun", "rifle", 2)
regroup.group.reset_index("gun", "shotgun", 2)
regroup.group.reset_index("gun", "rocket", 1)


regroup.group.insert({
	["armor"] = {
		["energy"] = {
			"fusion-reactor-equipment",
			"fusion-reactor-equipment-2",
			"fusion-reactor-equipment-3",
			"fusion-reactor-equipment-4"
		},
		["solar"] = {
			"solar-panel-equipment",
			"solar-panel-equipment-2",
			"solar-panel-equipment-3",
			"solar-panel-equipment-4"
		},
		["shield"] = {
			"energy-shield-mk3-equipment",
			"energy-shield-mk4-equipment",
			"energy-shield-mk5-equipment",
			"energy-shield-mk6-equipment"
		},
		["battery"] = {
			"battery-mk3-equipment",
			"battery-mk4-equipment",
			"battery-mk5-equipment",
			"battery-mk6-equipment"
		},
		["movement"] = {
			"exoskeleton-equipment-2",
			"exoskeleton-equipment-3"
		},
		["laser"] = {
			"personal-laser-defense-equipment",
			"personal-laser-defense-equipment-2",
			"personal-laser-defense-equipment-3",
			"personal-laser-defense-equipment-4",
			"personal-laser-defense-equipment-5",
			"personal-laser-defense-equipment-6",
		},
		["nightvision"] = {
			"night-vision-equipment",
			"night-vision-equipment-2",
			"night-vision-equipment-3"
		}
	},
	["vehicle"] = {
		["tank"] = {
			"tank-2",
			"tank-3"
		}
	}
})
regroup.group.insert({
	["armor"] = {
		["armor"] = {
			"bob-power-armor-mk3",
			"bob-power-armor-mk4",
			"bob-power-armor-mk5",
			"heavy-armor-2",
			"heavy-armor-3"
		}
	}
})
regroup.group.insert({
	["gun"] = {
		["throw"] = {
			"bob-laser-robot-capsule"
		}
	}
})
regroup.group.insert({
	["defense"] = {
		["turret"] = {
			"bob-gun-turret-2",
			"bob-gun-turret-3",
			"bob-gun-turret-4",
			"bob-gun-turret-5"
		},
		["s-turret"] = {
			"bob-sniper-turret-1",
			"bob-sniper-turret-2",
			"bob-sniper-turret-3"
		},
		["laser"] = {
			"bob-laser-turret-2",
			"bob-laser-turret-3",
			"bob-laser-turret-4",
			"bob-laser-turret-5"
		},
		["mine"] = {
			"distractor-mine",
			"poison-mine",
			"slowdown-mine"
		},
		["wall"] = {
			"reinforced-wall"
		},
		["gate"] = {
			"reinforced-gate"
		},
		["radar"] = {
			"radar-2",
			"radar-3",
			"radar-4",
			"radar-5"
		}
	}
})

regroup.group.insert({
	["gun"] = {
		["rifle"] = {
			"rifle",
			"sniper-rifle"
		},
		["laser-rifle"] = {
			"laser-rifle"
		}
	}
})
regroup.group.insert({
	["gun"] = {
		["rifle-ammo"] = {
			"firearm-magazine",
			"piercing-rounds-magazine",
			"bullet-magazine",
			"acid-bullet-magazine",
			"ap-bullet-magazine",
			"electric-bullet-magazine",
			"flame-bullet-magazine",
			"he-bullet-magazine",
			"poison-bullet-magazine"
		},
		["shotgun-ammo"] = {
			"shotgun-shell",
			"piercing-shotgun-shell",
			"better-shotgun-shell",
			"shotgun-acid-shell",
			"shotgun-ap-shell",
			"shotgun-electric-shell",
			"shotgun-flame-shell",
			"shotgun-explosive-shell",
			"shotgun-poison-shell"
		},
		["laser-ammo"] = {
			"laser-rifle-battery",
			"laser-rifle-battery-ruby",
			"laser-rifle-battery-sapphire",
			"laser-rifle-battery-emerald",
			"laser-rifle-battery-amethyst",
			"laser-rifle-battery-topaz",
			"laser-rifle-battery-diamond"
		},
		["rocket-ammo"] = {
			"rocket",
			"explosive-rocket",
			"bob-rocket",
			"bob-acid-rocket",
			"bob-piercing-rocket",
			"bob-electric-rocket",
			"bob-flame-rocket",
			"bob-explosive-rocket",
			"bob-poison-rocket"
		},
		["tank"] = {
			"scatter-cannon-shell"
		},
		["artillery"] = {
			"distractor-artillery-shell",
			"explosive-artillery-shell",
			"poison-artillery-shell"
		}
	}
})
regroup.group.insert({
	["gun"] = {
		["rifle-ammo"] = {
			"bullet-magazine",
			"acid-bullet-magazine",
			"ap-bullet-magazine",
			"electric-bullet-magazine",
			"flame-bullet-magazine",
			"he-bullet-magazine",
			"poison-bullet-magazine"
		},
		["shotgun-ammo"] = {
			"shotgun-shell",
			"piercing-shotgun-shell",
			"better-shotgun-shell",
			"shotgun-acid-shell",
			"shotgun-ap-shell",
			"shotgun-electric-shell",
			"shotgun-flame-shell",
			"shotgun-explosive-shell",
			"shotgun-poison-shell"
		},
		["laser-ammo"] = {
			"laser-rifle-battery",
			"laser-rifle-battery-ruby",
			"laser-rifle-battery-sapphire",
			"laser-rifle-battery-emerald",
			"laser-rifle-battery-amethyst",
			"laser-rifle-battery-topaz",
			"laser-rifle-battery-diamond"
		},
		["rocket-ammo"] = {
			"rocket",
			"explosive-rocket",
			"bob-rocket",
			"bob-acid-rocket",
			"bob-piercing-rocket",
			"bob-electric-rocket",
			"bob-flame-rocket",
			"bob-explosive-rocket",
			"bob-poison-rocket"
		},
		["tank"] = {
			"scatter-cannon-shell"
		},
		["artillery"] = {
			"distractor-artillery-shell",
			"explosive-artillery-shell",
			"poison-artillery-shell"
		},
		["robot"] = {
			{["name"]="bob-robot-tank",["typeof"]="item"},
			"defender-robot",
			"destroyer-robot",
			"distractor-robot",
			{["name"]="bob-laser-robot",["typeof"]="item"}
		}
	}
})







