local pcall = pcall
local hex = require 'util.hex'
local base64 = require 'util.base64'

local m = {}

local parser = hex.define{
    "map_level:i4",
    "map_exp:i4",
    "played_games:i4",
}

local function default()
    return {
        map_level = 1,
        map_exp = 0,
        played_games = 0,
    }
end

function m.decode(buf)
    local ok, res = pcall(base64.decode, buf)
    if not ok or not res then 
        return default()
    end 
    local ok, res = pcall(parser.decode, parser, res)
    if not ok or not res then 
        return default()
    end 
    return res
end 

function m.encode(tbl)
    local ok, res = pcall(parser.encode, parser, tbl)
    if not ok or not res then 
        return ""
    end 
    local ok, res = pcall(base64.encode, res)
    if not ok or not res then 
        return ""
    end 
    return res 
end 

return m