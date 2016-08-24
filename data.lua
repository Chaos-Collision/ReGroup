
require 'stdlib/table'
require 'stdlib/string'
require 'stdlib/data/data'

regroup = regroup or {}

require 'lib/modloader'
require 'lib/table'
require 'lib/logging'
require 'lib/groups'

require 'config'

log = regroup.logging.makelog("data")

table.iterate(regroup.config.group_list, function(group)
	regroup.group.makegroup(group)
end)
