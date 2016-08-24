
log("bobpower")

regroup.group.insert_subgroups("energy", {
	"air-pump",
	"water-pump",
	"small-solar"
}, "pump")

regroup.group.insert_subgroups("energy", {"large-solar"}, "solar")

regroup.group.insert_subgroups("energy", {
	"fast-accumulator",
	"capacity-accumulator"
}, "accumulator")

regroup.group.insert_subgroups("energy", {
	"medium-pole",
	"big-pole",
	"station"
}, "poles")

regroup.group.reset_index("energy", "poles", 1)

regroup.group.items({
	["energy"] = {
		["boiler"] = {
			"boiler-2",
			"boiler-3",
			"boiler-4"
		},
		["steam-engine"] = {
			"steam-engine-2",
			"steam-engine-3"
		},
		["pump"] = {
			"small-pump-2",
			"small-pump-3",
			"small-pump-4",
			"void-pump"
		},
		["air-pump"] = {
			"air-pump",
			"air-pump-2",
			"air-pump-3",
			"air-pump-4",
		},
		["water-pump"] = {
			"water-pump",
			"water-pump-2",
			"water-pump-3",
			"water-pump-4",
		},
		["small-solar"] = {
			"solar-panel-small",
			"solar-panel-small-2",
			"solar-panel-small-3"
		},
		["solar"] = {
			"solar-panel-2",
			"solar-panel-3"
		},
		["large-solar"] = {
			"solar-panel-large",
			"solar-panel-large-2",
			"solar-panel-large-3"
		},
		["accumulator"] = {
			"slow-accumulator",
			"slow-accumulator-2",
			"slow-accumulator-3"
		},
		["fast-accumulator"] = {
			"fast-accumulator",
			"fast-accumulator-2",
			"fast-accumulator-3"
		},
		["capacity-accumulator"] = {
			"large-accumulator",
			"large-accumulator-2",
			"large-accumulator-3"
		},
		["medium-pole"] = {
			"medium-electric-pole",
			"medium-electric-pole-2",
			"medium-electric-pole-3",
			"medium-electric-pole-4"
		},
		["big-pole"] = {
			"big-electric-pole",
			"big-electric-pole-2",
			"big-electric-pole-3",
			"big-electric-pole-4"
		},
		["station"] = {
			"substation",
			"substation-2",
			"substation-3",
			"substation-4"
		}
	}
})