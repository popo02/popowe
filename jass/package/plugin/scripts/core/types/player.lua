local ac = ac
local jass = require 'jass.common'
local japi = require 'jass.japi'
local code = require 'jass.code'
local dbg = require 'jass.debug'

local player = {}
setmetatable(player,player)
ac.player = player 

function player:__call(handle)
	return player[handle]
end

function player:__tostring()
	return ('玩家[%d]-%s'):format(self:id(),self:get_name())
end

local mt = {}
player.__index = mt 

--- 玩家
mt.type = 'player'

--- 玩家颜色
mt.color = nil

--- 玩家队伍
mt.team = nil

--- 句柄
mt.handle = jass.ConvertUnitState(0) 

function mt:dispatch(name, ...)
	local ok, res = ac.dispatch(self, name, ...)
	if ok ~= nil then 
		return ok, res 
	end 
    return ac.dispatch(ac.game,name,...)
end

function mt:notify(name, ...)
	ac.notify(self, name, ...)
    ac.notify(ac.game,name,...)
end

function mt:event(name)
	return ac.register(self, name)
end

mt.on = mt.event 
mt.register = mt.event

--- 获取ID
function mt:id()
    return (jass.GetPlayerId(self.handle) + 1)
end 

--- 获取ID
function mt:get_id()
    return (jass.GetPlayerId(self.handle) + 1)
end 

--- 获取名字
function mt:get_name()
    return jass.GetPlayerName(self.handle)
end 

player.colors = {
	"|cFFFF0303",
    "|cFF0042FF",
    "|cFF1CE6B9",
    "|cFF540081",
    "|cFFFFFC01",
    "|cFFFE8A0E",
    "|cFF20C000",
    "|cFFE55BB0",
    "|cFF959697",
    "|cFF7EBFF1",
    "|cFF106246",
    "|cFF4E2A04",
    "|cFF282828",
    "|cFF282828",
    "|cFF282828",
    "|cFF282828",
}

--- 获取名字
function mt:get_color_name()
    return player.colors[self:get_id()] .. self:get_name() .. "|r"
end 

---获取玩家颜色
function mt:get_color()
	local id = self:id()
    return player.colors[id]  
end

--- 获取玩家队伍
function mt:get_team()
    return self.team
end 

--- 设置玩家名字
function mt:set_name(name)
	jass.SetPlayerName(self.handle, name)
end

--- 是否是本地玩家
function mt:is_self()
	return self == player.self
end

--- 获取所有者
function mt:get_owner()
	return self
end

--- 是玩家控制
function mt:is_player()
	return jass.GetPlayerController(self.handle) == jass.ConvertMapControl(0)
end

--- 正在游戏中
function mt:is_playing()
	return jass.GetPlayerSlotState(self.handle) == jass.ConvertPlayerSlotState(1)
end 

--- 是在线玩家
function mt:is_online()
	return self:is_player() and self:is_playing()
end

--- 是否为敌人
function mt:is_enemy(dest)
	return jass.IsPlayerEnemy( dest.handle , self.handle )
end

--- 是否为友军
function mt:is_ally(dest)
	return jass.IsPlayerAlly( dest.handle , self.handle )
end

--- 设置玩家结盟 
--- @params dest 目标玩家 
--- @params flag 是否双向 默认为false
function mt:ally(dest,flag)
	jass.SetPlayerAlliance(self.handle,dest.handle, jass.ALLIANCE_PASSIVE,true)
	if flag then
		dest:ally(self)
	end
end

--- 设置玩家敌对
--- @params dest 目标玩家 
--- @params flag 是否双向 默认为false
function mt:enemy(dest,flag)
	jass.SetPlayerAlliance(self.handle,dest.handle, jass.ALLIANCE_PASSIVE,false)
	if flag then
		dest:enemy(self)
	end
end

local shared_states = {
	['视野'] = jass.ConvertAllianceType(5),		-- 视野
	['单位'] = jass.ConvertAllianceType(6),		-- 单位
	['完全控制权'] = jass.ConvertAllianceType(7),
}

--- 设置玩家联盟状态
--- @params dest 目标玩家 
--- @params name 联盟状态
--- @params flag 是否开启
function mt:shared(dest, name, flag)
	local state = shared_states[name]
	if state then 
		jass.SetPlayerAlliance(self.handle, dest.handle, state, flag and true or false)
	end
end

--- 判断玩家联盟状态
--- @returns boolean flag
function mt:is_shared(dest, name)
	local state = shared_states[name]
	if state then 
		return jass.GetPlayerAlliance(self.handle, dest.handle, state)
	end
	return false
end 

--- 获取在玩家A视角的玩家B联盟状态颜色
function mt:get_shared_flag(dest)
	if dest:is_shared(self, "单位") then 
		return 1, 0xff00ff00
	elseif dest:is_ally(self) then 
		return 2, 0xffffcc00
	elseif dest:is_enemy(self) then 
		return 3, 0xffff0000
	end 
	return 0, 0xffffffff
end 

--- 发送消息 (可持续时间,默认10秒)
function mt:message(text,time)
    if time then 
        jass.DisplayTimedTextToPlayer(self.handle,0,0,time,text)
    else 
        jass.DisplayTextToPlayer(self.handle,0,0,text)
    end
end

--- 清空屏幕显示
function mt:clear_message()
	if self == player.self then
		jass.ClearTextMessages()
	end
end

--- 小地图ping点
function mt:ping(dest,time)
	local x,y = dest:get_point():get()
	jass.PingMinimap(x,y, time or 1)
end

--- 命令玩家选中单位
function mt:select(u)
	if self:is_self() then
		jass.ClearSelection()
		jass.SelectUnit(u.handle, true)
	end
end

--- 命令玩家取消选择某单位
function mt:un_select(u)
	if self:is_self() then
		if u ~= nil then 
			jass.SelectUnit(u.handle, false)
		else 
			jass.ClearSelection()
		end
	end
end

--- 命令玩家添加选择某单位
function mt:add_select(u)
	if self:is_self() then
		jass.SelectUnit(u.handle, true)
	end
end

--- 获取商店单位选择目标
function mt:get_store_target(unit)
    return ac.unit(japi.GetStoreTarget(unit.handle,self.handle))
end

local camera_state = {
	['镜头距离'] 		= jass.CAMERA_FIELD_TARGET_DISTANCE,
	['远景截断距离']	= jass.CAMERA_FIELD_FARZ,
	['镜头区域']		= jass.CAMERA_FIELD_FIELD_OF_VIEW,
	['x轴旋转角度']		= jass.CAMERA_FIELD_ANGLE_OF_ATTACK,
	['y轴旋转角度']		= jass.CAMERA_FIELD_ROLL,
	['z轴旋转角度']		= jass.CAMERA_FIELD_ROTATION,
	['z轴偏移']         = jass.CAMERA_FIELD_ZOFFSET
}

-- 获取镜头属性
function mt:get_camera(key)
	return jass.GetCameraField(camera_state[key]) -- math.deg()
end

-- 设置镜头属性,镜头属性,数值,[持续时间]
function mt:set_camera(key, value, time)
	if self == player.self then
		jass.SetCameraField(camera_state[key], value, time or 0)
	end
end

-- 设置玩家镜头位置(点,平滑时间)
function mt:set_camera_point(where,time)
	local x, y
	if where then
		x, y = where:get_point():get()
	else
		x, y = jass.GetCameraTargetPositionX(), jass.GetCameraTargetPositionY()
	end
	if player.self == self then
		if time then
			jass.PanCameraToTimed(x, y, time)
		else
			jass.SetCameraPosition(x, y)
		end
	end
end

--获取玩家镜头位置 ( 注！返回的是异步数据 )
function mt:get_camera_point()
    return ac.point(jass.GetCameraTargetPositionX(), jass.GetCameraTargetPositionY())
end

-- 设置自定义值
function mt:set_data(key,value)
    self.user_data = self.user_data or {}
    self.user_data[key] = value 
end

-- 获取自定义值
function mt:get_data(key)
    return self.user_data and self.user_data[key] or nil
end

-- 判断是否解锁条件
function mt:has_lock(name)
    if self.locks[name] then 
        return self.locks[name]
    end 
    return false
end

--- 初始化
function player.init()
    for id = 1,16 do 
        local handle = jass.Player(id-1)
		--- 句柄引用
		dbg.handle_ref(handle)

        local object = setmetatable({
			handle = handle,
			stored_files = { },
		},player)

		object.gchash = handle 
		dbg.gchash(object, handle)

        player[id] = object
        player[handle] = object
    end 
	player[0] = player[1]
    player.self = player(jass.GetLocalPlayer())

end

return player