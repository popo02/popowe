

local jass = require 'jass.common'
local japi = require 'jass.japi'
local dbg = require 'jass.debug'
local math = math
local setmetatable = setmetatable

local point = {}
setmetatable(point, point)
ac.point = point 

--- 输出点
function point:__tostring()
    return ('{%.4f, %.4f, %.4f}'):format(self:get())
end

--- 创建点
function point:__call(x, y, z)
	return setmetatable( {x = x or 0, y = y or 0, z = z or 0,} , point)
end

--- 模块初始化
function point.init()
    --- jass中的点
	point.handle = jass.Location(0, 0) 
	dbg.handle_ref(point.handle)
end

--- 移动点 按照直角坐标系移动(point + {x, y})
---	@params dest table
--- @return point 新点
function point:__add(dest)
	return ac.point(self.x + (dest[1] or 0), self.y + (dest[2] or 0),self.z + (dest[3] or 0))
end

--- 移动点 按照极坐标系移动(point - {angle,distance})
---	@params dest table
--- @return point 新点
function point:__sub(dest)
	local x, y = self:get()
	local angle, distance = (dest[1] or 0),(dest[2] or 0)
	return ac.point(x + distance * math.cos(angle), y + distance * math.sin(angle))
end

--- 获取两点间距 (point * point)
--- @param dest point 
--- @return number
function point:__mul(dest)
	local x1, y1 = self:get()
	local x2, y2 = dest:get()
	local x0, y0 = x1 - x2, y1 - y2
	return math.sqrt(x0 * x0 + y0 * y0)
end

--- 获取两点间方向 (point / point)
--- @param dest point 
--- @returns number
function point:__div(dest)
	local x1, y1 = self:get()
	local x2, y2 = dest:get()
	return math.atan(y2 - y1, x2 - x1)
end

--- 获取两点间仰俯角 (point ^ point)
--- @params dest point 
--- @return number
function point:__pow(dest)
    local x1 , y1 , z1 = self:get( )
    local x2 , y2 , z2 = dest:get( )
	return math.atan( z2-z1 , math.sqrt( (x2-x1)^2 + (y1-y2)^2 ) )
end

--- 获取两点间高度差 (point % point)
--- @params dest point 
--- @returns number
function point:__mod(dest)
	return math.abs(self.z - dest.z)
end

--- 判断两点坐标是否相同
--- @param dest point 
--- @returns boolean
function point:__eq(dest)
	local x1,y1,z1 = self:get()
	if dest and dest.type == 'point' then 
		local x2,y2,z2 = dest:get()
		return (x1==x2) and (y1==y2) and (z1==z2)
	end 
	return false 
end 

--- 获取鼠标点
function point.get_mouse_point()
	return ac.point(japi.GetMouseX(), japi.GetMouseY())
end 

--- 获取x, y坐标的高度
function point.get_location_height(x, y)
	if not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_FLOATABILITY) and jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_WALKABILITY) then 
		return 0.0
	end	
	jass.MoveLocation(point.handle, x, y)
	return jass.GetLocationZ(point.handle)
end

--结构
local mt = {}
point.__index = mt

--- 类型
mt.type = 'point'

--坐标x
mt.x = 0	

--坐标y
mt.y = 0	

--坐标z
mt.z = 0	

--- 获取点的x,y,z
function mt:get()
	return self.x,self.y,self.z
end

--- 兼容性通用接口
function mt:get_point()
	return self 
end 

--- 拷贝
function mt:copy()
	return ac.point(self:get() )
end 

--- 获取碰撞
function mt:get_collision()
	return 0
end

--移动点
function mt:move(x, y, z)
	self.x = x
	self.y = y
	self.z = z
end

--- 获得地层级别
function mt:get_level()
	return jass.GetTerrainCliffLevel(self:get()) 
end

--- 获取地层高度
function mt:get_terrain()
    return (self:get_level() - 2) * 128
end

--- 获取点的地面高度
function mt:get_height()
	return point.get_location_height(self.x, self.y)
end

--- 是否可通行
function mt:is_flyable()
	local x,y = self:get()
	if jass.IsTerrainPathable(x,y,jass.ConvertPathingType(2)) then 
		return false 
	end
	return true
end

--- 是否可通行
function mt:is_walkable(strict)
	local x,y = self:get()
	if jass.IsTerrainPathable(x,y,jass.ConvertPathingType(1)) then 
		return false 
	end
	return true
end

--- 是否可建造
function mt:is_buildable()
	local x,y = self:get()
	if jass.IsTerrainPathable(x,y,jass.ConvertPathingType(3)) then 
		return false 
	end
	return true
end

-- 地形为深水
function mt:is_deepwater()
	local x,y = self:get()
    return not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_FLOATABILITY) and jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_WALKABILITY)
end

-- 地形为浅水
function mt:is_shallowwater()
	local x,y = self:get()
    return not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_FLOATABILITY) and not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_WALKABILITY) and jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_BUILDABILITY)
end

-- 地形为陆地
function mt:is_land()
	local x,y = self:get()
    return jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_FLOATABILITY)
end

-- 地形为平台
function mt:is_platform()
	local x,y = self:get()
    return not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_FLOATABILITY) and not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_WALKABILITY) and not jass.IsTerrainPathable(x, y, jass.PATHING_TYPE_BUILDABILITY)
end

--- 插值点
function mt:lerp(dest,t)
    return ac.point(
		math.lerp(self.x,dest.x,t),
		math.lerp(self.y,dest.y,t),
		math.lerp(self.z,dest.z,t)
	)
end

return point