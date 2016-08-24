
log("5dim_logistic")

regroup.group.insert_subgroups("drone", {
	"chest-2"
}, "chest")

regroup.group.items({
	["drone"] = {
		["logistic-robot"] = {
			"5d-logistic-robot-2"
		},
		["construction-robot"] = {
			"5d-construction-robot-2"
		},
		["chest-2"] = {
			"5d-active",
			"5d-passive",
			"5d-requester",
			"5d-storage"
		},
		["roboport"] = {
			"5d-roboport-2"
		}
	},
	["armor"] = {
		["tool"] = {
			{["name"]="5d-repair-pack-2",["typeof"]="repair-tool"}
		}
	}
})