
require 'stdlib/table'
require 'stdlib/string'
require 'stdlib/data/data'

go = {}
require 'lib/modloader'
require 'lib/table'
require 'lib/logging'
require 'lib/groups'

require 'config'

go._log = log

log = go.makelog("data")

table.iterate(config.group_list, function(group) 
	go.makegroup(group)
end)