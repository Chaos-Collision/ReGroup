
config = {}

config.DEBUG_MODE = false

config.active_mods = {
	["vanilla"] = "vanilla",
	["5dim"] = {
		"5dim_core", "5dim_transport",
		"5dim_resources", "5dim_ores",
		"5dim_logistic", "5dim_automatization",
		"5dim_mining", "5dim_battlefield",
		"5dim_module", "5dim_energy",
		"5dim_vehicle",	"5dim_decoration",
		"5dim_fixes"
	},
	["bob"] = {
		"boblibrary", "bobassembly",
		"bobenemies", "bobmining",
		"bobores", "bobpower",
		"bobtechsave", "bobelectronics",
		"boblogistics", "bobmodules",
		"bobplates", "bobtech",
		"bobwarfare", "bobconfig"
	},
	["more_floors"] = "more_floors",
}

config.mod_order = {
	"vanilla",
	"5dim",
	"bob",
	"more_floors"
}

--internal settings beware of bear traps!

config.group_list = {
	"transport",
	"energy",
	"machine",
	"resource",
	"vehicle",
	"defense",
	"drone",
	"module",
	"armor",
	"gun",
	"floor",
	"alien"
}

config.item_types = {
	"rail-planner",
	"mining-tool",
	"repair-tool",
	"blueprint-book",
	"blueprint",
	"deconstruction-item",
	"gun",
	"ammo",
	"armor",
	"virtual-signal",
	"module",
	"tool",
	"capsule",
	"selection-tool",
	"market",
	"combat-robot"
}