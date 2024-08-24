
local japi = require 'jass.japi'
local hook = require 'jass.hook'
local code = require 'jass.code'
local jass = require 'jass.common'
local record = require 'map.record'



if record.state == 1 then 

    local Hashmap = {
        ['存档'] = {},
        ['积分'] = {},
        ['道具'] = {},
        ['状态'] = {},
    } 
    
    -- 哈希映射
    function code.ReplaceHashmap(name, dzkey, rpkey)
        if not Hashmap[name] then return end;
        Hashmap[name][dzkey] = rpkey
    end

    function hook.DzAPI_Map_GetMapConfig(rkey)
        return record.get_map_config(rkey)
    end
    
    function hook.DzAPI_Map_HasMallItem(handle, key)
        local player = ac.player(handle)
        return player:has_status(Hashmap['状态'][key] or key) 
        or player:has_item(Hashmap['道具'][key] or key)
    end
    
    function code.DzAPI_Map_GetMallItemCount(handle, key)
        return ac.player(handle):get_item_count(Hashmap['道具'][key] or key)
    end 
    
    function hook.DzAPI_Map_UseConsumablesItem(handle, key)
        local rkey = Hashmap['道具'][key] or key
        ac.player(handle):use_item(rkey, 1)
    end 
    
    function code.DzAPI_Map_PlayedGames(handle)
        return ac.player(handle):get_played_games()
    end 
    
    function hook.DzAPI_Map_GetMapLevel(handle)
        return ac.player(handle):get_map_level()
    end
    
    function hook.RequestExtraIntegerData(index, handle, key, ...)
        if index == 41 then 
            return ac.player(handle):get_item_count(Hashmap['道具'][key] or key)
        elseif index == 45 then 
            return ac.player(handle):get_played_games()
        end 
        return 0
    end
    
    function hook.RequestExtraBooleanData(index, handle, key, _, _, count, _, _)
        if index == 42 then 
            local rkey = Hashmap['道具'][key] or key
            local amount = ac.player(handle):get_item_count(rkey)
            if amount >= count then 
                ac.player(handle):use_item(rkey, count)
                return true
            end 
        end 
        return false
    end
    
    function hook.DzAPI_Map_GetServerValue(handle, key)
        return ac.player(handle):load_server(Hashmap['存档'][key] or key)
    end 

    function hook.DzAPI_Map_SaveServerValue(handle, key, value)
        ac.player(handle):save_server(Hashmap['存档'][key] or key, value)
        return true 
    end 
    
    function code.DzAPI_Map_FlushStoredMission(handle, key)
        ac.player(handle):save_server(Hashmap['存档'][key] or key, "")
        return true 
    end 
    
    local oldDzAPI_Map_StoreInteger = code.DzAPI_Map_StoreInteger
    function code.DzAPI_Map_StoreInteger(handle, key, value)
        ac.player(handle):set_score(Hashmap['积分'][key] or key, value)
        return oldDzAPI_Map_StoreInteger(handle, key, value)
    end
    
    -- 存档组
    function code.DzAPI_Map_GetStoredIntegerGroup(handle, key, index)
        return ac.player(handle):get_stored_files(Hashmap['存档'][key] or key, index)
    end
    
    -- 存档组
    function code.DzAPI_Map_StoreIntegerGroup(handle, key, index, value)
        ac.player(handle):store_files(Hashmap['存档'][key] or key, index, value)
    end

else

    -- 存档组
    function code.DzAPI_Map_GetStoredIntegerGroup(handle, key, index)
        return ac.player(handle):get_stored_files(key, index)
    end
    
    -- 存档组
    function code.DzAPI_Map_StoreIntegerGroup(handle, key, index, value)
        ac.player(handle):store_files(key, index, value)
    end

    function hook.DzAPI_Map_SaveServerValue(handle, key, value)
        print(('dz设置存档:[%s][%s] = [%s]'):format(ac.player(handle):get_name(), key, value))
        japi.DzAPI_Map_SaveServerValue(ac.player(handle).handle, key, value)
        return true 
    end 

end

-- 获取当前地图游戏市场(单位：分)
function code.DzAPI_Map_MapsTotalPlayed(handle)
    return ac.player(handle):get_map_gametime()
end

-- 计算地图等级(单位：分)
function code.GetMapWorkOutLevel(gametime)
    return math.floor((math.max(0, gametime)/60) ^ 0.5) + 1
end

