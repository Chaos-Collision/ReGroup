
log("5dim_transport")

regroup.group.insert_subgroups("transport", {
	"ground30",
	"ground50"
}, "belt")

regroup.group.subgroups("transport", {
	"pipe-to-ground30",
	"pipe-to-ground50",
})

regroup.group.subgroups("machine",{
	"storage"
})

regroup.group.insert({
	["transport"] = {
		["belt"] = {
			"5d-mk4-transport-belt",
			"5d-mk5-transport-belt"
		},
		["ground"] = {
			"5d-mk4-transport-belt-to-ground",
			"5d-mk5-transport-belt-to-ground"
		},
		["ground30"] = {
			"5d-mk1-transport-belt-to-ground-30",
			"5d-mk2-transport-belt-to-ground-30",
			"5d-mk3-transport-belt-to-ground-30",
			"5d-mk4-transport-belt-to-ground-30",
			"5d-mk5-transport-belt-to-ground-30"
		},
		["ground50"] = {
			"5d-mk1-transport-belt-to-ground-50",
			"5d-mk2-transport-belt-to-ground-50",
			"5d-mk3-transport-belt-to-ground-50",
			"5d-mk4-transport-belt-to-ground-50",
			"5d-mk5-transport-belt-to-ground-50"
		},
		["splitter"] = {
			"5d-mk4-splitter",
			"5d-mk5-splitter"
		},
		["pipe"] = {
			"5d-pipe-mk2",
			"5d-pipe-mk3"
		},
		["pipe-to-ground"] = {
			"5d-pipe-to-ground-mk2",
			"5d-pipe-to-ground-mk3",
		},
		["pipe-to-ground30"] = {
			"5d-pipe-to-ground-mk1-30",
			"5d-pipe-to-ground-mk2-30",
			"5d-pipe-to-ground-mk3-30"
		},
		["pipe-to-ground50"] = {
			"5d-pipe-to-ground-mk1-50",
			"5d-pipe-to-ground-mk2-50",
			"5d-pipe-to-ground-mk3-50"
		}
	},
	["machine"] = {
		["storage"] = {
			"5d-iron-chest-mk2",
			"5d-iron-chest-mk2-2",
			"5d-iron-chest-mk2-3"
		}
	}
})