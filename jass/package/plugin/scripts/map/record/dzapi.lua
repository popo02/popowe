local japi = require 'jass.japi'

local record = {}

-- 获取地图配置项
function  record.get_map_config(name)
	return japi.DzAPI_Map_GetMapConfig(name) or "" 
end

local mt = ac.player.__index

-- 是否读取成功
function mt:is_succuse()
    if package.local_test then
        return true
    end
    return self.server_error_code == 0 and self.server_loaded_items == true
end

-- 保存存档
function mt:save_server(name, value)
    assert(type(value) == 'string', "存档只能保存 “字符串” ")
    assert(#(value) <= 64, "存档长度超过上限")
    if self.rpg_servers[name] == value then
        return
    end
    self.rpg_servers[name] = value
    if self:is_succuse() then
        print(('dz设置存档:[%s][%s] = [%s]'):format(self:get_name(), name, value))
        japi.DzAPI_Map_SaveServerValue(self.handle, name, value)
    end
end 
	
-- 读取存档
function mt:load_server(name)
    if not self.rpg_servers[name] then
        if self:is_succuse() then
            self.rpg_servers[name] = japi.DzAPI_Map_GetServerValue(self.handle, name) or ""
        else
            self.rpg_servers[name] = ""
        end
    end
    return self.rpg_servers[name]
end 

function mt:get_map_gametime()
    return math.floor(japi.RequestExtraIntegerData(56, self.handle, nil, nil, false, 0, 0, 0) / 60) or 0
end


function record.init()

    for i=1,12 do 
        local p = ac.player(i)
        p.rpg_servers = {}
        p.server_error_code = 0 
        p.server_loaded_items = true 
        if not package.local_test then 
            --p.server_error_code = japi.DzAPI_Map_GetServerValueErrorCode(p.handle)
            --p.server_loaded_items = japi.RequestExtraBooleanData(77, p.handle, nil, nil, false, 0, 0, 0)
            -- 关闭 视距 显血显蓝 智能施法
            -- japi.RequestExtraBooleanData(43, p.handle, null, null, false, 1, 0, 0)
            -- japi.RequestExtraBooleanData(43, p.handle, null, null, false, 2, 0, 0)
            -- japi.RequestExtraBooleanData(43, p.handle, null, null, false, 3, 0, 0)
        end 
    end 

end


return record