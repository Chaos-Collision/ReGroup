
log("5dim_module")

regroup.group.subgroups("module", {
	"pollution",
	"combined-4",
	"combined-5",
	"welder"
})

regroup.group.modules({
	["module"] = {
		["effectivity"] = {
			"5d-effectivity-module-4",
			"5d-effectivity-module-5"
		},
		["productivity"] = {
			"5d-productivity-module-4",
			"5d-productivity-module-5"
		},
		["speed"] = {
			"5d-speed-module-4",
			"5d-speed-module-5"
		},
		["pollution"] = {
			"5d-pollution-module-1",
			"5d-pollution-module-2",
			"5d-pollution-module-3",
			"5d-pollution-module-4",
			"5d-pollution-module-5"
		},
		["combined-4"] = {
			"5d-speed-effectivity-4",
			"5d-speed-productivity-4",
			"5d-speed-pollution-4",
			"5d-effectivity-productivity-4",
			"5d-pollution-effectivity-4",
			"5d-pollution-productivity-4"
		},
		["combined-5"] = {
			"5d-speed-effectivity-5",
			"5d-speed-productivity-5",
			"5d-speed-pollution-5",
			"5d-effectivity-productivity-5",
			"5d-pollution-effectivity-5",
			"5d-pollution-productivity-5"
		}
	}
})

regroup.group.items({
	["module"] = {
		["welder"] = {
			"5d-welder"
		}
	}
})