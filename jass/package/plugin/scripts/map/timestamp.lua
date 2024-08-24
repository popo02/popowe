-- 获取服务器时间戳，自动转化为年月日，兼容UP&11平台
local os = os 
local japi = require 'jass.japi'
local hook = require 'jass.hook'
local code = require 'jass.code'

local time_datas = {
    ['年'] = '%Y', -- 年
    ['月'] = '%m', -- 月
    ['日'] = '%d', -- 日
    ['时'] = '%H', -- 时
    ['分'] = '%M', -- 分
    ['秒'] = '%S', -- 秒
    ['星期'] = '%w', -- 周
}

local GameStartTime = 0

-- 获取 时间戳 -> 属性
function code.PO_GetTimeStamp(state)
    if time_datas[state] then 
        local t = tonumber(os.date(time_datas[state], GameStartTime))
        if state == '星期' and t == 0 then
            t = 7
        end
        return t
    end
    return 0
end

-- 缺少网易平台环境直接拜拜
if japi.DzAPI_Map_GetGameStartTime then 

    GameStartTime = japi.DzAPI_Map_GetGameStartTime()
    
    -- 如果有11平台环境则进行判定,可以获取到时间就把网易的hook为11的
    if japi.EXNetGetTime then 
        local year, month, day, hour, min, sec = japi.EXNetGetTime():match('(%d+)%-(%d+)%-(%d+)%s-(%d+)%:(%d+)%:(%d+)')
        if year and month and day and hour and min and sec then 
            GameStartTime = os.time{
                year  = tonumber(year), 
                month = tonumber(month), 
                hour  = tonumber(hour), 
                day   = tonumber(day),
                min   = tonumber(min), 
                sec   = tonumber(sec),
            }
        end 
    end 
    

    -- 直接进行一个hook
    function hook.DzAPI_Map_GetGameStartTime()
        return GameStartTime
    end 
    
end


