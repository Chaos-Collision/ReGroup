
log("5dim_battlefield")

go.items({
	["vehicle"] = {
		["tank"] = {
			"5d-tank",
			"5d-artillery"
		}
	},
	["defense"] = {
		["wall"] = {
			"5d-metal-wall"
		},
		["gate"] = {
			"5d-gate"
		},
		["turret"] = {
			"5d-gun-turret-small",
			"5d-gun-turret-big"
		},
		["laser"] = {
			"5d-laser-turret-small",
			"5d-laser-turret-big"
		}
	},
	["gun"] = {
		["tank"] = {
			{["name"]="artillery-shell",["typeof"]="ammo"}
		}
	}
})