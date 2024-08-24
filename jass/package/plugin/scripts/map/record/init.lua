local japi = require "jass.japi"

local record 

if Maprecord then 
    record = require 'map.record.dzapi'
    record.state = 0
    print("kk运行环境")
else 
    record = require 'map.record.11api'
    record.state = 1
    print("11运行环境")
end 

record.init() 

return record 

