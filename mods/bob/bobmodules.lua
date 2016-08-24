
log("bobmodules")

regroup.group.subgroups("module", {
	"pollution-create",
	"pollution-clean",
	"raw-speed",
	"raw-speed-combine",
	"green-module",
	"green-module-combine",
	"raw-productivity",
	"raw-productivity-combine",
	"case",
	"case1",
	"case2"
})

regroup.group.items({
	["module"] = {
		["beacon"] = {
			"beacon-2",
			"beacon-3"
		}
	}
})

regroup.group.recipes({
	["module"] = {
		["raw-speed-combine"] = {
			"raw-speed-module-1-combine",
			"raw-speed-module-2-combine",
			"raw-speed-module-3-combine",
			"raw-speed-module-4-combine",
			"raw-speed-module-5-combine",
			"raw-speed-module-6-combine",
			"raw-speed-module-7-combine",
			"raw-speed-module-8-combine"
		},
		["green-module-combine"] = {
			"green-module-1-combine",
			"green-module-2-combine",
			"green-module-3-combine",
			"green-module-4-combine",
			"green-module-5-combine",
			"green-module-6-combine",
			"green-module-7-combine",
			"green-module-8-combine"
		},
		["raw-productivity-combine"] = {
			"raw-productivity-module-1-combine",
			"raw-productivity-module-2-combine",
			"raw-productivity-module-3-combine",
			"raw-productivity-module-4-combine",
			"raw-productivity-module-5-combine",
			"raw-productivity-module-6-combine",
			"raw-productivity-module-7-combine",
			"raw-productivity-module-8-combine"
		},
		["case"] = {
			"module-case",
			"module-contact",
			"module-circuit-board",
			"module-processor-board",
			"module-processor-board-2",
			"module-processor-board-3"
		},
		["case1"] = {
			"speed-processor",
			"speed-processor-2",
			"speed-processor-3",
			"effectivity-processor",
			"effectivity-processor-2",
			"effectivity-processor-3",
			"productivity-processor",
			"productivity-processor-2",
			"productivity-processor-3",
		},
		["case2"] = {
			"pollution-clean-processor",
			"pollution-clean-processor-2",
			"pollution-clean-processor-3",
			"pollution-create-processor",
			"pollution-create-processor-2",
			"pollution-create-processor-3"
		}
	}
})

regroup.group.modules({
	["module"] = {
		["speed"] = {
			"speed-module-4",
			"speed-module-5",
			"speed-module-6",
			"speed-module-7",
			"speed-module-8"
		},
		["effectivity"] = {
			"effectivity-module-4",
			"effectivity-module-5",
			"effectivity-module-6",
			"effectivity-module-7",
			"effectivity-module-8"
		},
		["productivity"] = {
			"productivity-module-4",
			"productivity-module-5",
			"productivity-module-6",
			"productivity-module-7",
			"productivity-module-8"
		},
		["pollution-create"] = {
			"pollution-create-module-1",
			"pollution-create-module-2",
			"pollution-create-module-3",
			"pollution-create-module-4",
			"pollution-create-module-5",
			"pollution-create-module-6",
			"pollution-create-module-7",
			"pollution-create-module-8"
		},
		["pollution-clean"] = {
			"pollution-clean-module-1",
			"pollution-clean-module-2",
			"pollution-clean-module-3",
			"pollution-clean-module-4",
			"pollution-clean-module-5",
			"pollution-clean-module-6",
			"pollution-clean-module-7",
			"pollution-clean-module-8"
		},
		["raw-speed"] = {
			"raw-speed-module-1",
			"raw-speed-module-2",
			"raw-speed-module-3",
			"raw-speed-module-4",
			"raw-speed-module-5",
			"raw-speed-module-6",
			"raw-speed-module-7",
			"raw-speed-module-8"
		},
		["green-module"] = {
			"green-module-1",
			"green-module-2",
			"green-module-3",
			"green-module-4",
			"green-module-5",
			"green-module-6",
			"green-module-7",
			"green-module-8"
		},
		["raw-productivity"] = {
			"raw-productivity-module-1",
			"raw-productivity-module-2",
			"raw-productivity-module-3",
			"raw-productivity-module-4",
			"raw-productivity-module-5",
			"raw-productivity-module-6",
			"raw-productivity-module-7",
			"raw-productivity-module-8"
		}
	}
})
