local message = require 'jass.message'
local code = require 'jass.code'
local jass = require 'jass.common'
local japi = require 'jass.japi'
local  slk = require 'jass.slk'
local hook = require 'jass.hook'

local loc = jass.Location(0, 0)

local screen_x = 0
local screen_y = 0
local scale = 0
local world_x = 0
local world_y = 0

--  转换256进制整数
base = {}
base.ids1 = {}
base.ids2 = {}

function base._id(a)
    local r = ('>I4'):pack(a)
    base.ids1[a] = r
    base.ids2[r] = a
    return r
end

function base.id2string(a)
    return base.ids1[a] or base._id(a)
end

function base.__id2(a)
    local r = ('>I4'):unpack(a)
    base.ids2[a] = r
    base.ids1[r] = a
    return r
end

function base.string2id(a)
    return base.ids2[a] or base.__id2(a)
end


--单位世界坐标转换成ui坐标
code.ConverUnitWorldPosition = function (unit)
    local x, y, z = jass.GetUnitX(unit), jass.GetUnitY(unit), jass.GetUnitFlyHeight(unit)

    jass.MoveLocation(loc, x, y)

    z = z + jass.GetLocationZ(loc)
    z = z + message.unit_overhead(unit)

    screen_x, screen_y, scale = message.world_to_screen(x, y, z) 
end

code.unit_overhead = function(u)
    return message.unit_overhead(u)
end

--x、y、z世界坐标转换成ui坐标
code.ConverRealWorldPosition = function (x,y,z)
    screen_x, screen_y, scale = message.world_to_screen(x, y, z)
end

--屏幕坐标转换成世界坐标
code.ConverRealPositionWorld = function (x,y)
    world_x, world_y = message.screen_to_world(x, y)
end

--获取转换后的屏幕坐标X,Y,Z
code.GetScreenX = function ()
    return screen_x
end
code.GetScreenY = function ()
    return 0.6 - screen_y
end
code.GetScreenScale = function ()
    return scale
end

--获取转换后的世界坐标X,Y
code.GetWorldX = function ()
    return world_x
end
code.GetWorldY = function ()
    return world_y
end

--函数
--构建UI模型的代码
code.PO_HS_1606 = function ()
    return japi.FrameAddModel(japi.FrameGetParent(japi.FrameGetPortrait()))
end


--内置模型-添加绑点特效 --返回模型地址
code.PO_HS_1607 = function (id, bind_name, effect_path)
    return japi.FrameAddModelEffect(id, bind_name, effect_path)
end

--获取当前技能面板的X,Y位置的技能id
code.GetAbilityXY = function (x,y)
    return jass.S2I(message.button(x,y))
end

--动作
code.PO_DZ_1613 = function (self, path, color)
    japi.FrameSetModel2(self, path, color)
end

--设置模型在 场景内的坐标  跟镜头位置有关系
code.PO_DZ_1614 = function (self, x, y, z)
    japi.FrameSetModelX(self, x)
    japi.FrameSetModelY(self, y)
    japi.FrameSetModelZ(self, z)
end

--设置镜头位置
code.PO_DZ_1615 = function (self, x, y, z)
    japi.FrameSetModelCameraSource(self, x, y, z)
end

--设置镜头目标位置
code.PO_DZ_1616 = function (self, x, y, z)
    japi.FrameSetModelCameraTarget(self, x, y, z)
end


--废弃可删待填空1618空

--内置模型-删除绑点特效 需要填 绑特效时的返回值
code.PO_DZ_1619 = function (id, model)
    japi.FrameRemoveModelEffect(id, model)
end

--内置模型-同单位一样的 按照索引播放指定动画  
code.PO_DZ_1620 = function (id,index)
    japi.FrameSetAnimationByIndex(id,index)
end

--内置模型-设置模型缩放倍率
code.PO_DZ_1621 = function (id,size)
    japi.FrameSetModelSize(id,size)
end

--内置模型-设置模型按xyz轴缩放
code.PO_DZ_1622 = function (id,x,y,z)
    japi.FrameSetModelScale(id,x,y,z)
end

--1623=x，y，z的一体函数
--内置模型-设置模型旋转x轴
code.set_rotate_x = function (id,value)
    japi.FrameSetModelRotateX(id,value)
end

--内置模型-设置模型旋转y轴
code.set_rotate_y = function (id,value)
    japi.FrameSetModelRotateY(id,value)
end

--内置模型-设置模型旋转z轴
code.set_rotate_z = function (id,value)
    japi.FrameSetModelRotateZ(id,value)
end

--内置模型-设置动画播放倍率
code.PO_DZ_1624 = function (id,value)
    japi.FrameSetModelSpeed(id,value)
end

--内置模型-设置模型与控件的偏移坐标
code.PO_DZ_1625 = function (id,x,y)
    japi.FrameSetModelXY(id,x,y)
end

--设置物品鼠标指向UI 是否显示
code.PO_DZ_1626 = function (wp,is_visible)
    japi.SetUnitPressUIVisible(wp,is_visible)
end

--主动绑定effect 到 handle 上面 可以单位绑 特效 可以特效绑 特效
code.BindEffect1 = function (p1, p2, p3)
    japi.BindEffect(p1, p2, p3)
end

code.BindEffect2 = function (p1, p2, p3)
    japi.BindEffect(p1, p2, p3)
end

code.BindEffect3 = function (p1, p2, p3)
    japi.BindEffect(p1, p2, p3)
end


--  遍历物编单位和单位 清理"1-N#"文本
code.PO_ClearNotes = function ()
    local mz
    local i
    local name
    for id, obj in pairs(slk.unit) do
    mz = obj.Name
    i = string.find(tostring(mz), "#")
        if i ~= nil then
            name = string.sub(mz, i + 1)
            japi.EXSetItemDataString(base.string2id(id), 4, tostring(name))
        end
    end
    for id, obj in pairs(slk.item) do
    mz = obj.Name
    i = string.find(tostring(mz), "#")
        if i ~= nil then
            name = string.sub(mz, i + 1)
            japi.EXSetItemDataString(base.string2id(id), 4, tostring(name))
        end
    end
    return 0
end

Row = {}

--  新建排序组
code.Sort0 = function (id)
    if Row[id] == nil then
        Row[id] = {}
    end
end

--  添加索引和数据
code.Sort1 = function (id, index, value)
    if Row[id] == nil then
        Row[id] = {}
    end
        table.insert(Row[id], {value = value, index = index})
end

--  排序
code.Sort2 = function (id, bool)
    if Row[id] ~= nil then
        if bool then
            table.sort(Row[id], function(a, b)return a.value > b.value end)
        else
            table.sort(Row[id], function(a, b)return a.value < b.value end)
        end
    end
end

--  提取索引
code.Sort3 = function (id, int)
    local index = 0
    if Row[id][int] ~= nil then
        index = Row[id][int].index
    end
    return index
end

--  提取数据
code.Sort4 = function (id, int)
    local value = 0
    if Row[id][int] ~= nil then
        value = Row[id][int].value
    end
    return value
end

--  清空排序组
code.Sort5 = function (id)
    Row[id] = {}
end

--  删除排序组
code.Sort6 = function (id)
    Row[id] = nil
end

local ffi  = require 'ffi'

ffi.cdef [[
    int system(const char *command);

    int GetSystemMetrics(int index);

    typedef void* HWND;
    typedef long DWORD;
    typedef int BOOL;

    int GetConsoleWindow();
    DWORD GetWindowLongA(HWND hWnd, int nIndex);
    DWORD SetWindowLongA(HWND hWnd, int nIndex, DWORD dwNewLong);

    int SetWindowPos(HWND hWnd, HWND hWndInsertAfter, int x, int Y, int cx, int cy, unsigned int uflags);
    int GetModuleHandleA(const char* lpModuleName);
]]

local crt = ffi.load("msvcrt.dll")

code.MsgUrl = function(...)
    local url = ...
    crt.system(([[start "" "%s"]]):format(url))
end


local SM_CXSCREEN = 0  -- 屏幕的宽度
local SM_CYSCREEN = 1  -- 屏幕的高度

-- 获取屏幕宽度
local screenWidth = ffi.C.GetSystemMetrics(SM_CXSCREEN)
-- print("Screen Width: ", screenWidth)

-- 获取屏幕高度
local screenHeight = ffi.C.GetSystemMetrics(SM_CYSCREEN)
-- print("Screen Height: ", screenHeight)

code.CenterWindow = function()
    local x, y = screenWidth, screenHeight
    local x1 = 0
    local y1 = 0
    local x2 = 0
    local y2 = 0

    if y <= 768 then
        x1 = 960
        y1 = 540
    elseif y <= 900 then
        x1 = 1280
        y1 = 720
    elseif y <= 1080 then
        x1 = 1600
        y1 = 900
    else
        x1 = 1920
        y1 = 1080
    end
    x2 = (x - x1) * 0.5
    y2 = (y - y1) * 0.5
    if japi.DzGetWindowHeight() ~= y then
        japi.SetWindowSize(x1, y1)
        japi.SetWindowPos(0, x2, y2, 0, 0, 13)
    end

    return 0
end


local GWL_STYLE = -16
local WS_BORDER = 0x00800000
local WS_DLGFRAME = 0x00400000
local WS_CAPTION = WS_BORDER | WS_DLGFRAME
local WS_OVERLAPPEDWINDOW = 0x00CF0000

local HWND_TOP = ffi.cast("void*",0)
local SWP_FRAMECHANGED = 0x0020
local SWP_NOMOVE = 0x0002
local SWP_NOSIZE = 0x0001
local SWP_NOZORDER = 0x0004

local SetBorderless = function(hwnd, bool)
    if hwnd ~= nil then
        -- 获取当前窗口的样式
        local style = ffi.C.GetWindowLongA(hwnd, GWL_STYLE)
        -- 去掉边框和标题栏
        style = style & ~WS_CAPTION
        -- 保留标题栏
        if bool then
            style = style | WS_OVERLAPPEDWINDOW
        end
        -- 设置新的窗口样式
        ffi.C.SetWindowLongA(hwnd, GWL_STYLE, style)
        -- 强制窗口样式更新
        ffi.C.SetWindowPos(hwnd, HWND_TOP, 0, 0, 0, 0, SWP_FRAMECHANGED | SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER)
    else
        print("Unable to get console window handle.")
    end
end

local game = ffi.C.GetModuleHandleA("Game.dll")
local hwnd = ffi.cast("int *", game + 0xBDA9CC)[0]

code.Removeborders = function(bool)
    SetBorderless(hwnd, bool)
end


local charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
local HexMap = {}

for i = 0, #charset do
    HexMap[i] = charset:sub(i+1, i+1)
	HexMap[HexMap[i]] = i
end


-- 十进制转 92 进制函数，固定长度输出，超出用最大值处理
function code.PO_92System(decimal, length)
    local maxValueIn92 = 0
    local result = ""
    while (decimal > 0) do
        maxValueIn92 = decimal % 92
        decimal = math.floor(decimal / 92)
        result = HexMap[maxValueIn92] .. result
    end
    if length == 0 then
        return result
    end
    if #result > length then
        local result = ""
        for i = 1, length do
            result = HexMap[91] .. result
        end
        return result
    else
        while #result < length do
            result = "0".. result
        end
        return result or string.rep("0", length)
    end
end

-- 92 进制转十进制函数
function code.PO_Inverse92System(ninetyTwo)
    local decimal = 0
    local length = #ninetyTwo
    for i = 1, length do
        local charValue = HexMap[ninetyTwo:sub(i, i)] or 0
        decimal = decimal + charValue * 92 ^ (length-i)
    end
    return decimal
end

local ht = {}

function ht.set_data(frame, key, value)
    if not ht[frame] then
        ht[frame] = {}
    end
	ht[frame][key] = value
end
function ht.get_data(frame, key)
    if not ht[frame] then
        ht[frame] = {}
    end
	return ht[frame][key]
end
function ht.is_data(frame)
	return ht[frame]
end

-- 记录frame设置位置
function hook.DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x, y)
    ht.set_data(frame, 'point', point)
    ht.set_data(frame, 'relativeFrame', relativeFrame)
    ht.set_data(frame, 'relativePoint', relativePoint)
    ht.set_data(frame, 'x', x)
    ht.set_data(frame, 'y', y)
    japi.DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x, y)
end

-- 记录frame设置位置
function hook.DzFrameSetAbsolutePoint(frame, point, x, y)
    ht.set_data(frame, 'point', point)
    ht.set_data(frame, 'relativeFrame', japi.DzGetGameUI())
    ht.set_data(frame, 'relativePoint', 6)
    ht.set_data(frame, 'x', x)
    ht.set_data(frame, 'y', y)
    japi.DzFrameSetAbsolutePoint(frame, point, x, y)
end

-- 设置frame坐标偏移
function code.PO_FrameSetPoint(frame, x, y)
    if ht.is_data(frame) then
        local point = ht.get_data(frame, 'point')
        local relativeFrame = ht.get_data(frame, 'relativeFrame')
        local relativePoint = ht.get_data(frame, 'relativePoint')
        local x1 = ht.get_data(frame, 'x')
        local y1 = ht.get_data(frame, 'y')
        japi.DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x+x1, y+y1)
    end
end

-- 记录frame显示状态
function hook.DzFrameShow(frame, enable)
    ht.set_data(frame, 'show', enable)
    japi.DzFrameShow(frame, enable)
end

-- 获取frame是否显示
function code.DzFrameIsVisible(frame)
    if ht.is_data(frame) then
        return ht.get_data(frame, 'show')
    end
    ht.set_data(frame, 'show', true)
    return true
end

-- 发送控制台消息
function code.PO_Print(message)
    print(message)
end



function hook.DisplayTextToPlayer(toPlayer, x, y, message)
    if toPlayer == jass.GetLocalPlayer() then
        print(message)
    end
    jass.DisplayTextToPlayer(toPlayer, x, y, message)
end
function hook.DisplayTimedTextToPlayer(toPlayer, x, y, duration, message)
    if toPlayer == jass.GetLocalPlayer() then
        print(message)
    end
    jass.DisplayTimedTextToPlayer(toPlayer, x, y, duration, message)
end
function hook.DisplayTimedTextFromPlayer(toPlayer, x, y, duration, message)
    if toPlayer == jass.GetLocalPlayer() then
        print(message)
    end
    jass.DisplayTimedTextFromPlayer(toPlayer, x, y, duration, message)
end

local console = require 'jass.console'

function PlayerChat()
    local p  = jass.GetTriggerPlayer()
    local mz = jass.GetPlayerName(p)
    console.write('[' .. os.date("%X", os.time()) .. ']' .. '[' .. mz .. ']: ' .. jass.GetEventPlayerChatString())
end

local trig = jass.CreateTrigger()
for i = 0, 15, 1 do
    jass.TriggerRegisterPlayerChatEvent(trig, jass.Player(i), "", true)
end
jass.TriggerAddAction(trig,PlayerChat)


-- 创建单位事件

local trg = {}

function hook.CreateUnit(player, unitid, x, y, face)
    local u = jass.CreateUnit(player, unitid, x, y, face)
    trg.unit = u
    for _, trigger in ipairs(trg) do
        if jass.IsTriggerEnabled(trigger) and jass.TriggerEvaluate(trigger) then
            jass.TriggerExecute(trigger)
        end
    end
    trg.unit = nil
    return u
end

function hook.CreateUnitAtLoc(player, unitid, whichLocation, face)
    local u = jass.CreateUnitAtLoc(player, unitid, whichLocation, face)
    trg.unit = u
    for _, trigger in ipairs(trg) do
        if jass.IsTriggerEnabled(trigger) and jass.TriggerEvaluate(trigger) then
            jass.TriggerExecute(trigger)
        end
    end
    trg.unit = nil
    return u
end

function code.PO_CreateUnitEvent(t)
    if t then
        trg[#trg+1] = t
    end
end

function code.PO_GetCreateUnit()
    return trg.unit
end


print('内置lua运行结束')

