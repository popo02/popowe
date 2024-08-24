local console = require 'jass.console'
local runtime = require 'jass.runtime'
local japi    = require 'jass.japi'

runtime.sleep = true

runtime.handle_level = 0

local ok, is_local = pcall(require, 'path')



--[[错误汇报]]
function runtime.error_handle(msg)
    console.write("---------------------------------------")
    console.write("              Lua报错了                ")
    console.write("---------------------------------------")
    console.write(tostring(msg) .. "\n")
    console.write("---------------------------------------")
    console.write(debug.traceback() .. "\n")
    console.write("---------------------------------------")
end

function print(...)
    console.write('[' .. os.date("%X", os.time()) .. ']' .. '[Print]: ' .. ...)
end

japi.SetOwner "问号"

xpcall( function() 
    require "scripts" 
end , runtime.error_handle )
