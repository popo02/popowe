local japi = require 'jass.japi'

local record = {}

function record.is_sync(callback)
	if not record.current_player:is_online() then
        for i = 1, 12 do
            if ac.player(i):is_online() then
                record.current_player = ac.player(i)
                break
            end
        end
    end 
    record.current_player:is_self()
end

-- 获取地图配置项
function  record.get_map_config(name)
	return japi.GetStoredString(record.server_game_cache, "config", name) or "" 
end

local mt = ac.player.__index

---可以获取玩家的官方RPG积分数据(数值类型)
---@param keyName string 1.rpg_gamec 用户在地图中的累计游戏局数 2.rpg_gametime 用户在地图中的累计游戏时长
---@return number
function mt:GetOfficalRPGScoreStr(keyName)
    local pid = self:get_id()
    if not self.rpg_servers[keyName] then 
        if self:is_online() then 
            self.rpg_servers[keyName] = japi.GetStoredString(record.RpgScore_game_cache,"OfficalRpgScore",tostring(pid) .. "@" .. keyName) or ""
        else 
            self.rpg_servers[keyName] = ""
        end 
	end 
	return self.rpg_servers[keyName]
end

function mt:letter()
    return string.char(0x40 + self:get_id())
end

-- 获取积分
function mt:get_score(name)
    if not self.rpg_scores[name] then 
        if self:is_online() then 
            self.rpg_scores[name] = japi.GetStoredInteger(record.scores_game_cache, self:letter(), name) or 0
            print(('获取RPG积分:[%s][%s] = [%s]'):format(self:get_name(), name, self.rpg_scores[name]))
        else
            self.rpg_scores[name] = 0
        end
    end 
    return self.rpg_scores[name]
end

-- 保存积分
function mt:set_score(name, value)
    assert(math.type(value) == 'integer', "积分只能保存 “整数” ")
    self.rpg_scores[name] = value 
    if self:is_online() then 
        local letter = self:letter() .. "="
        japi.StoreInteger(record.scores_game_cache, letter, name, value)
        if record.is_sync() then 
            japi.SyncStoredInteger(record.scores_game_cache, letter, name)
        end
        print(('设置RPG积分:[%s][%s] = [%s]'):format(self:get_name(), name, value))
    end
end

-- 累加积分 (是否是通行证)
function mt:add_score(name, value, is_pc)
    assert(math.type(value) == 'integer', "积分只能保存 “整数” ")
    if not is_pc then 
        self:set_score(name, self:get_score(name) + value)
    else 
        self.rpg_scores[name] = self:get_score(name) + value
        if self:is_online() then 
            local letter = self:letter() .. "+"
            japi.StoreInteger(record.scores_game_cache, letter, name, value)
            if record.is_sync() then 
                japi.SyncStoredInteger(record.scores_game_cache, letter, name)
            end
            print(('增加RPG积分:[%s][%s] = [%s]'):format(self:get_name(), name, value))
        end
    end 
end 

-- 保存存档
function mt:save_server(name, value)
    assert(type(value) == 'string', "存档只能保存 “字符串” ")
    print(('11设置存档:[%s][%s] = [%s]'):format(self:get_name(), name, value))
	if self.rpg_servers[name] == value then 
        return 
    end 
    self.rpg_servers[name] = value 
    if self:is_online() then 
        japi.EXNetSaveRemoteData(self:get_id()-1, name, value)
    end 
end 
	
-- 读取存档
function mt:load_server(name)
	if not self.rpg_servers[name] then 
        if self:is_online() then 
            self.rpg_servers[name] = japi.GetStoredString(record.server_game_cache, japi.EXGetPlayerRealName(self.handle), name) or ""
        else 
            self.rpg_servers[name] = ""
        end 
	end 
	return self.rpg_servers[name]
end 

-- 获取玩家次数类道具剩余次数
function mt:get_item_count(name)
    if not self.rpg_items[name] then
        if self:is_online() then 
	        self.rpg_items[name] = (japi.GetStoredInteger(self.billing_game_cache, "道具", name) or 0 )
        else 
	        self.rpg_items[name] = 0
        end 
    end 
    return self.rpg_items[name] 
end

-- 消耗次数性道具 TODO 未验证
function mt:use_item(name, amount)
    amount = amount or 1
	if self:get_item_count(name) >= amount then 
        self.rpg_items[name] = self.rpg_items[name] - amount 
        -- mark 这里必须要等0秒 将这个api的 调用放到新的逻辑帧，否则直接崩溃
        ac.wait(0, function()
            japi.EXNetUseItem(self.handle , name, amount)
        end)
	end 
end 

-- 玩家是否拥有状态(时间类 道具)
function mt:has_status(name)
    if not self.rpg_status[name] then
        if self:is_online() then 
	        self.rpg_status[name] = japi.HaveStoredInteger(self.billing_game_cache, "状态", name) and 1 or 0
        else 
	        self.rpg_status[name] = 0
        end 
    end 
    return self.rpg_status[name] == 1
end

-- 玩家是否拥有道具(次数类 道具)
function mt:has_item(name)
	return self:get_item_count(name) > 0
end

function mt:get_played_games()
    local games = tonumber(self:GetOfficalRPGScoreStr('rpg_gamec')) or 0
    if games == 0 then
        games = self.played_games
    end
    return games
end 

function mt:get_map_level()
    local gametime = tonumber(self:GetOfficalRPGScoreStr('rpg_gametime')) or 0
    local maptime  = math.min(self.map_exp, gametime+2880)
    local level    = math.floor((maptime/60) ^ 0.5) + 1
    return level
end 

function mt:get_map_gametime()
    local gametime = tonumber(self:GetOfficalRPGScoreStr('rpg_gametime')) or 0
    local maptime  = math.min(self.map_exp, gametime+2880)
    return maptime
end


local template = require 'map.template'

function record.update()
    for i=1,12 do 
        local p = ac.player(i)
        if p:is_online() then 
            local t = p.infomation
            local l = t.map_level
            t.map_exp = t.map_exp + 1
            t.map_level = math.floor( ( t.map_exp // 60 ) ^ 0.5 ) + 1
            if p.played_games == t.played_games then 
                t.played_games = t.played_games + 1
                p:set_score("count", t.played_games)
            end
            p:set_score("exp", t.map_exp)
            p:set_score("lv", t.map_level)
            p:save_server("meta", template.encode(t))
        end 
    end 
end 

function record.init()

    record.server_game_cache = japi.InitGameCache "11.s"
    record.scores_game_cache = japi.InitGameCache "11.x"
    -- record.rank_game_cache = japi.InitGameCache "11.rank"
    record.RpgScore_game_cache =japi.InitGameCache("dr.x")
    record.current_player = ac.player(1)

    for i=1,12 do 
        local p = ac.player(i)
        p.billing_game_cache = japi.InitGameCache("11billing@" .. p:letter())
        p.rpg_scores = {}   
        p.rpg_servers = {}
        p.rpg_items = {}
        p.rpg_status = {}
        p.infomation = template.decode(p:load_server("meta"))
        p.map_exp = p.infomation.map_exp
        p.map_level = math.floor( ( p.infomation.map_exp // 60 ) ^ 0.5 ) + 1
        p.played_games = p.infomation.played_games
        p:set_score("exp", p.infomation.map_exp)
        p:set_score("lv", p.infomation.map_level)
    end 

    ac.loop(60 * 1000, function()
        record.update()
    end)

end

return record