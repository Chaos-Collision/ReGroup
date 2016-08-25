
log("boblogistics")

regroup.group.subgroups("transport", {
	"storage-tank"
})

regroup.group.insert_subgroups("drone", {
	"chest-2",
	"robo-chest",
	"expander",
	"charge",
	"charge-big"
}, "chest")

regroup.group.insert_subgroups("vehicle", {
	"cargo"
}, "train")

regroup.group.reset_index("vehicle", "train", 0)

regroup.group.insert({
	["transport"] = {
		["belt"] = {
			"green-transport-belt",
			"purple-transport-belt"
		},
		["ground"] = {
			"green-underground-belt",
			"purple-underground-belt"
		},
		["splitter"] = {
			"green-splitter",
			"purple-splitter"
		},
		["pipe"] = {
			"copper-pipe",
			"stone-pipe",
			"bronze-pipe",
			"steel-pipe",
			"plastic-pipe",
			"brass-pipe",
			"titanium-pipe",
			"ceramic-pipe",
			"tungsten-pipe"
		},
		["pipe-to-ground"] = {
			"copper-pipe-to-ground",
			"stone-pipe-to-ground",
			"bronze-pipe-to-ground",
			"steel-pipe-to-ground",
			"plastic-pipe-to-ground",
			"brass-pipe-to-ground",
			"titanium-pipe-to-ground",
			"ceramic-pipe-to-ground",
			"tungsten-pipe-to-ground"
		},
		["storage-tank"] = {
			"storage-tank",
			"storage-tank-2",
			"storage-tank-3",
			"storage-tank-4",
			"valve"
		}
	},
	["drone"] = {
		["logistic-robot"] = {
			"bob-logistic-robot-2",
			"bob-logistic-robot-3",
			"bob-logistic-robot-4"
		},
		["construction-robot"] = {
			"bob-construction-robot-2",
			"bob-construction-robot-3",
			"bob-construction-robot-4",
		},
		["chest-2"] = {
			"logistic-chest-active-provider-2",
			"logistic-chest-passive-provider-2",
			"logistic-chest-requester-2",
			"logistic-chest-storage-2"
		},
		["robo-chest"] = {
			"bob-robochest",
			"bob-robochest-2",
			"bob-robochest-3",
			"bob-robochest-4",
		},
		["roboport"] = {
			"bob-roboport-2",
			"bob-roboport-3",
			"bob-roboport-4"
		},
		["charge"] = {
			"bob-robo-charge-port",
			"bob-robo-charge-port-2",
			"bob-robo-charge-port-3",
			"bob-robo-charge-port-4"
		},
		["charge-big"] = {
			"bob-robo-charge-port-large",
			"bob-robo-charge-port-large-2",
			"bob-robo-charge-port-large-3",
			"bob-robo-charge-port-large-4"
		},
		["expander"] = {
			"bob-logistic-zone-expander",
			"bob-logistic-zone-expander-2",
			"bob-logistic-zone-expander-3",
			"bob-logistic-zone-expander-4"
		},
		["blueprint"] = {
			"bob-logistic-zone-interface"
		}
	},
	["vehicle"] = {
		["train"] = {
			"diesel-locomotive",
			"diesel-locomotive-2",
			"diesel-locomotive-3",
			"armoured-diesel-locomotive"
		},
		["cargo"] = {
			"cargo-wagon",
			"cargo-wagon-2",
			"cargo-wagon-3",
			"armoured-cargo-wagon"
		}
	}
})
