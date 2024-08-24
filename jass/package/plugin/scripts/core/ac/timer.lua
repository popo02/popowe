---@diagnostic disable: undefined-field
---@class timer "计时器"
local setmetatable = setmetatable
local ipairs = ipairs
local pairs = pairs
local math_max = math.max
local math_floor = math.floor
local table_insert = table.insert

local cur_frame = 0
local max_frame = 0
local cur_index = 0
local free_queue = {}
local timer = {}

ac.alltimers = setmetatable({}, {__mode = 'kv'})

local function alloc_queue()
	local n = #free_queue
	if n > 0 then
		local r = free_queue[n]
		free_queue[n] = nil
		return r
	else
		return {}
	end
end

local function m_timeout(self, timeout)
	local ti = cur_frame + timeout
	local q = timer[ti]
	if q == nil then
		q = alloc_queue()
		timer[ti] = q
	end
	self.timeout_frame = ti
	q[#q + 1] = self
end

local runtime = require 'jass.runtime'

local function m_wakeup(self)
	if self.removed then
		return
	end

	xpcall(self.on_timer, runtime.error_handle, self)

	if self.removed or self.pause_remaining then
		return
	end
	if self.timeout then
		m_timeout(self, self.timeout)
	else
		self.removed = true
		ac.alltimers[self] = nil
	end
end

local function on_tick()
	local q = timer[cur_frame]
	if q == nil then
		cur_index = 0
		return
	end
	for i = cur_index + 1, #q do
		local callback = q[i]
		cur_index = i
		q[i] = nil
		if callback then
			m_wakeup(callback)
		end
	end
	cur_index = 0
	timer[cur_frame] = nil
	free_queue[#free_queue + 1] = q
end

function ac.clock()
	return cur_frame
end

function ac.timer_size()
	local n = 0
	for _, ts in pairs(timer) do
		n = n + #ts
	end
	return n
end

function ac.debug_print_timer()
	if ac.enable_debug_timer ~= true then 
		return 
	end 
	local map = {}
	for _, ts in pairs(timer) do
		for index, t in ipairs(ts) do 
			if t.traceback then 
				map[t.traceback] = (map[t.traceback] or 0) + 1
			end 
		end 
		
	end

	for info, count in pairs(map) do 
		print('计时器数量', count, info)
	end 
end 

function ac.init_timer(timer)
	if package.local_test then 
		local info = debug.getinfo(3, 'Sl')
		if info then 
			timer._src = info.short_src
			timer._line = info.currentline
		end
	end 
	ac.alltimers[timer] = true
	if ac.enable_debug_timer then 
		timer.traceback = debug.traceback(1)
	end 
end


local jass = require 'jass.common'
local jtimer = jass.CreateTimer()
require('jass.debug').handle_ref(jtimer)
local function jtimercallback()
	local delta = 10
	if cur_index ~= 0 then
		cur_frame = cur_frame - 1
	end
	max_frame = max_frame + delta
	while cur_frame < max_frame do
		cur_frame = cur_frame + 1
		on_tick()
	end
end
jass.TimerStart(jtimer, 0.01, true, jtimercallback)

local mt = {}
local api = {}
mt.__index = api
mt.type = 'timer'

--输出
function mt:__tostring()
    return ('[计时器] @%q #(line:%d)'):format(self._src,self._line)
end

---销毁计时器
function api:remove()
	if self.removed then 
		return 
	end 
	if self.on_remove then 
		self:on_remove()
	end 
	self.removed = true
	ac.alltimers[self] = nil
end

---获取剩余时间
function api:get_remaining()
	if self.removed then
		return 0
	end
    if self.pause_remaining then
        return self.pause_remaining
    end
    if self.timeout_frame == cur_frame then
        return self.timeout or 0
    end
    return self.timeout_frame - cur_frame
end

---暂停计时器
function api:pause()
	self.pause_remaining = self:get_remaining()
	local ti = self.timeout_frame
	local q = timer[ti]
	if q then
		for i= #q, 1, -1 do
			if q[i] == self then
				q[i] = false
				return
			end
		end
	end
end

---恢复计时器
function api:resume()
	if self.pause_remaining then
		m_timeout(self, self.pause_remaining)
		self.pause_remaining = nil
	end
end

---直接运行计时器
function api:execute()
	if not self.removed and not self.pause_remaining then 
		self:on_timer()
	end 
	return self
end

local function utimer_initialize(u)
	if not u._timers then
		u._timers = {}
	end
	if #u._timers > 0 then
		return
	end
	u._timers[1] = ac.loop(10000, function()
		local timers = u._timers
		for i = #timers, 2, -1 do
			if timers[i].removed then
				local len = #timers
				timers[i] = timers[len]
				timers[len] = nil
			end
		end
		if #timers == 1 then
			timers[1]:remove()
			timers[1] = nil
		end
	end)
end

---等待
---@param timeout number
---@param on_timer function
---@return timer
function ac.wait(timeout, on_timer)
	if timeout == nil or on_timer == nil then 
		print('计时器参数不对',timeout, on_timer, debug.traceback())
	end
	local timeout = math_max(math_floor(timeout) or 1, 1)
	local t = setmetatable({
		['on_timer'] = on_timer,
	}, mt)
	ac.init_timer(t)
	m_timeout(t, timeout)
	return t
end

---循环
---@param timeout number
---@param on_timer function 
---@return timer
function ac.loop(timeout, on_timer)
	if timeout == nil or on_timer == nil then 
		print('计时器参数不对',timeout, on_timer, debug.traceback())
	end
	local t = setmetatable({
		['timeout'] = math_max(math_floor(timeout) or 1, 1),
		['on_timer'] = on_timer,
	}, mt)
	ac.init_timer(t)
	m_timeout(t, t.timeout)
	return t
end

---计时
---@param timeout number 
---@param count number
---@param on_timer function 
---@return timer
function ac.timer(timeout, count, on_timer)
	if timeout == nil or count == nil or on_timer == nil then 
		print('计时器参数不对',timeout, count, on_timer, debug.traceback())
	end
	if count == 0 then
		return ac.loop(timeout, on_timer)
	end
	local c = count
	local t = ac.loop(timeout, function(t)
		c = c - 1 
		t.count = c
		on_timer(t)
		if c <= 0 then
			t:remove()
		end
	end)
	ac.init_timer(t)
	return t
end

---等待
---@param u table 
---@param timeout number  
---@param on_timer function 
---@return timer
function ac.uwait(u, timeout, on_timer)
	utimer_initialize(u)
	local t = ac.wait(timeout, on_timer)
	table_insert(u._timers, t)
	return t
end

---循环
---@param u table 
---@param timeout number  
---@param on_timer function 
---@return timer
function ac.uloop(u, timeout, on_timer)
	utimer_initialize(u)
	local t = ac.loop(timeout, on_timer)
	table_insert(u._timers, t)
	return t
end

---计时器
---@param u table 
---@param timeout number  
---@param count number  
---@param on_timer function 
---@return timer
function ac.utimer(u, timeout, count, on_timer)
	utimer_initialize(u)
	local t = ac.timer(timeout, count, on_timer)
	table_insert(u._timers, t)
	return t
end
