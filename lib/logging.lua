
regroup = regroup or {}

local logging = {}

logging._log = log

function logging.makelog(key)
	return function(str, ...)
		if not regroup.config.DEBUG_MODE then return "" end
		return logging._log("[GO-" .. key .. "] " .. string.format(str, ...))
	end
end

function logging.dumpvar(data, depth, sortdepth)
    --credits go to groupchange
    local tablecache = {}
    local buffer = ""
    local padder = "	"
    local depth = depth or 30
    local sortdepth = sortdepth or 0

    local function dumpvar(d, _depth)
        local t = type(d)
        local str = tostring(d)
        if (t == "table") then
            if (tablecache[str]) then
                -- table already dumped before, so we dont
                -- dump it again, just mention it
                buffer = buffer.."<"..str..">\n"
            else
                tablecache[str] = (tablecache[str] or 0) + 1

				if _depth >= depth then buffer = buffer.."\n"; return end
				buffer = buffer..string.format(" {%s-- <%s>\n",padder,str)

				if _depth <= sortdepth then
					for k, v in pairsByKeys(d) do
						buffer = buffer..string.rep(padder, _depth+1).."["..k.."]"
						if _depth+1 < depth then buffer = buffer.." => " end
						dumpvar(v, _depth+1)
					end
				else for k, v in pairs(d) do
						buffer = buffer..string.rep(padder, _depth+1).."["..k.."]"
						if _depth+1 < depth then buffer = buffer.." => " end
						dumpvar(v, _depth+1)
					end
				end

				buffer = buffer..string.rep(padder, _depth).."}\n"
            end
        elseif (t == "number") then
            buffer = buffer.."("..t..") "..str.."\n"
        else
            buffer = buffer.."("..t..") \""..str.."\"\n"
        end
    end
    dumpvar(data, 0)
    return buffer
end

regroup.logging = logging