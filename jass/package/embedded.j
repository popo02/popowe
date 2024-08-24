#ifndef JAPI_LIBRARY
#define JAPI_LIBRARY

library japi
    
    function FrameHideInterface takes nothing returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEventDamageData takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetEventDamage takes real p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetUnitReal takes integer p1, integer p2, real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function DestroyFrame takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitCollisionType takes boolean p1, unit p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitReal takes integer p1, integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function VirtualMpqRegisterPath takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction

    
    function EXGetUnitString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetUnitInteger takes integer p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetEffectSpeed takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatReset takes effect p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlpRect takes string p1, string p2, integer p3, integer p4, integer p5, integer p6 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    //  移动特效坐标
    function EXSetEffectXY takes effect p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitArrayString takes integer p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    //  设置模型队伍颜色
    function FrameSetModelColor takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlendButtonIcon takes string p1, string p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function FrameShowInterface takes nothing returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetItemDataString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    //  获取特效Y坐标
    function EXGetEffectY takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXPauseUnit takes unit p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataString takes ability p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitMoveType takes unit p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitFacing takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextColor takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXExecuteScript takes string p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXGetUnitAbility takes unit p1, integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetUnitAbilityByIndex takes unit p1, integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetAbilityId takes ability p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXGetAbilityState takes ability p1, integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetAbilityState takes ability p1, integer p2, real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXEffectMatRotateX takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataReal takes ability p1, integer p2, integer p3 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function GetMouseX takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function GetFps takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetAbilityDataReal takes ability p1, integer p2, integer p3, real p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function ShowFpsText takes boolean p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataInteger takes ability p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetAbilityDataInteger takes ability p1, integer p2, integer p3, integer p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityString takes integer p1, integer p2, integer p3, string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityDataString takes ability p1, integer p2, integer p3, string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityAEmeDataA takes ability p1, integer p2 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetBuffDataString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetBuffDataString takes integer p1, integer p2, string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetAbilityString takes integer p1, integer p2, integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function LocalPointOrder takes integer p1, real p2, real p3, integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetItemDataString takes integer p1, integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction

    //  设置特效高度
    function EXSetEffectZ takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  获取特效X坐标
    function EXGetEffectX takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function ExExecuteFunc takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetByte takes string p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  获取特效高度
    function EXGetEffectZ takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetEffectSize takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXDisplayChat takes player p1, integer p2, string p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEffectSize takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXEffectMatRotateY takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  绕Z轴旋转
    function EXEffectMatRotateZ takes effect p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatScale takes effect p1, real p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置特效动画
    function EXSetEffectAnimation takes effect p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    

    //  聊天窗口是否打开
    function GetChatState takes nothing returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function Hex takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXDclareButtonIcon takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlpSector takes string p1, string p2, integer p3, integer p4, integer p5, integer p6, integer p7 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXPolygon takes string p1, integer p2, integer p3, hashtable p4, integer p5, integer p6 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXClear takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function png2tga_file takes string p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function SaveFunc takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTexture takes integer p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMouseY takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function timer_start takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function timer_end takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function timer_destroy takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EnableWideScreen takes boolean p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetPlayerSelectedUnit takes integer p1 returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function LocalOrder takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function LocalTargetOrder takes integer p1, widget p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMapName takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetMapPath takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetWar3Path takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetGameVersion takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetPluginVersion takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SetUnitAbilityButtonShow takes integer p1, integer p2, boolean p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetHeroLevels takes code p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function get_code_addr takes string p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function get_code_id takes string p1 returns code
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function get_code_name takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function FrameGetHeroManaBar takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function Box takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetOwner takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function get_copy_str takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function GetTargetObject takes nothing returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    //  获取大头像单位(异步)                异步获取 当前玩家大头像模型的单位 当框选一群单位时 切换选择也会改变返回值 一般用来做UI操作时需要用到的接口
    function GetRealSelectUnit takes nothing returns unit
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function FrameGetUnitMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetUnitAddress takes unit p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SetUnitPosition2 takes unit p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitTexture takes unit p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitModel takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitPortrait takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    

    
    function GetWindowHeight takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    

    
    function DestroySimpleFrame takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置单位普攻弹道模型 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileModel takes unit p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextFontSpacing takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置单位普攻弹道弧度 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileArc takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SimpleFontStringFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  设置单位普攻弹道速度 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileSpeed takes unit p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction

    //  设置单位普攻弹道自导允许 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileHoming takes unit p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGlueUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  设置Frame模型
    function FrameSetModel2 takes integer p1, string p2, integer p3 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置模型按xyz轴缩放
    function FrameSetModelScale takes integer p1, real p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGameUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetScale takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameEditBlackBorders takes real p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetMinimapButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetMinimap takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetPortrait takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetCommandBarButton takes integer p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetHeroBarButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetHeroHPBar takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetTooltip takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetChatMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBarButton takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetTopMessage takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  获取技能冷却模型
    function FrameGetButtonCooldownModel takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowX takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetButtonCooldownModelSize takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetMouseBorders takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBar takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowWidth takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBackground takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetItemBackgroundTexture takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetSimpleConsole takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetSimpleConsole2 takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function LoadToc takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAllPoints takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetTextHeight takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function CreateFrame takes string p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateSimpleFrame takes string p1, integer p2, integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateFrameByTagName takes string p1, string p2, integer p3, string p4, integer p5 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetSize takes integer p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetKeyboard takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetWidth takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function RegisterMessageEvent takes trigger p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameClearAllPoints takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetHeight takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetPoint takes integer p1, integer p2, integer p3, integer p4, real p5, real p6 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAbsolutePoint takes integer p1, integer p2, real p3, real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameShow takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetEnable takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetFocus takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetModelSize takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetEditFocus takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAlpha takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetAlpha takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetWidth takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameGetHeight takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameGetTextWidth takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetText takes integer p1, string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetText takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function FrameGetTextColor takes integer p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetTextFont takes integer p1, string p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowY takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetModelTexture takes integer p1, string p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameCageMouse takes integer p1, boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetLevel takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetParent takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetSimpleFrameParent takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleFrameFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleTextureFindByName takes string p1, integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetMouseFocus takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameGetType takes integer p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SetWar3MapMap takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetTriggerKey takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWheelDelta takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function IsWindowActive takes nothing returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function GetKeyState takes integer p1 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function RegisterFrameEvent takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMessagePlayer takes nothing returns player
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function GetTriggerMessage takes nothing returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function SendCustomMessage takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SendMessage takes integer p1, integer p2, integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetMouseVectorX takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction

    function GetMouseVectorY takes nothing returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function SetMousePos takes real p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowMouseX takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function GetWindowMouseY takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function set_copy_str takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
        
    //单位添加眩晕
    function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
    
    //单位删除眩晕
	function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction
    
    //判断是否是物理伤害
    function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(1)
	endfunction

    //判断是否是攻击伤害
	function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(2)
	endfunction
	
    //判断是否是范围伤害
	function YDWEIsEventRangedDamage takes nothing  returns boolean
		return 0 != EXGetEventDamageData(3)
	endfunction
	
    //判断伤害类型
	function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(4))
	endfunction
    
    //判断武器类型
	function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(5))
	endfunction
	
    //判断攻击类型
	function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(6))
	endfunction

	//设置伤害
	function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction

    //设置物品数据 (字符串) [JAPI]
    function YDWESetItemDataString takes integer ItemTypeId,integer Type,string Value returns nothing
        call EXSetItemDataString(ItemTypeId, Type, Value)
    endfunction

    //获取物品数据 (字符串) [JAPI] 1.图标 2.提示基础 3.提示扩展 4.名字 5.说明
    function YDWEGetItemDataString takes integer ItemTypeId,integer Type returns string
        return EXGetItemDataString(ItemTypeId, Type)
    endfunction

    function YDWEDisplayChat takes player p, integer chat_recipient, string message returns nothing
		call EXDisplayChat(p, chat_recipient, message)
	endfunction

     //技能属性 [JAPI]
	function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer data_type returns real
		return EXGetAbilityState(EXGetUnitAbility(u, abilcode), data_type)
	endfunction
	//技能数据 (整数) [JAPI]
	function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
		return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
	//技能数据 (实数) [JAPI]
	function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
		return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction

	//技能数据 (字符串) [JAPI]
	function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
		return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction

	//设置技能属性 [JAPI]
	function YDWESetUnitAbilityState takes unit u, integer abilcode, integer data_type, real value returns nothing
        call EXSetAbilityState(EXGetUnitAbility(u, abilcode), data_type, value)
    endfunction

	//设置技能数据 (整数) [JAPI]
	function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns nothing
        call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

	//设置技能数据 (实数) [JAPI]
	function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns nothing
        call EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction


	//设置技能数据 (字符串) 
	function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns nothing
        call EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
	
 
    function UnlockFps takes boolean is_unlock returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    function GetCacheModelCount takes nothing returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    function ReleaseAllModel takes nothing returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    //  设置特效显示
    function EXSetEffectVisible takes effect u, boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    function EXSetEffectFogVisible takes effect u, boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    function EXSetEffectMaskVisible  takes effect u, boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction

    function ReleaseString  takes string s returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    function ReleaseAllString  takes nothing returns nothing
        call GetTriggeringTrigger()
        return 
    endfunction
    
    function GetCacheStringCount takes nothing returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    function FrameSetViewPort takes integer frame, boolean enable returns nothing
        call GetTriggeringTrigger()
    endfunction
    
    //  修改窗口大小 可以强行限制用户 窗口模式下的 窗口比例 16/9
    function SetWindowSize takes integer w, integer h returns nothing
        call GetTriggeringTrigger()
    endfunction
    
    //  获取窗口是否全屏
    function IsWindowMode takes nothing returns boolean
        call GetTriggeringTrigger()
        return false
    endfunction
    
    function UnlockBlpSize  takes boolean isunlock returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置特效颜色 1.特效 2.颜色代码 0xffffffff
    function EXSetEffectColor takes effect p1, integer p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置单位名字 每个单位独立 互相不影响 修改后 获取单位名字 还是返回原值
    function SetUnitName takes unit p1, string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置英雄称谓 每个单位独立 互相不影响 GetHeroProperName获取英雄称谓 是修改后的值。
    function SetUnitProperName takes unit p1, string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置 单位 鼠标指向UI跟血条 是否显示
    function SetUnitPressUIVisible takes unit u, boolean is_visible returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置动画
    function FrameSetAnimate takes integer p1, integer p2, boolean p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置动画进度 百分比
    function FrameSetAnimateOffset takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction

    //  同单位一样的 按照索引播放指定动画  
    function FrameSetAnimationByIndex takes integer p1, integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型路径
    function FrameSetModel takes integer p1, string p2, integer p3, integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型缩放倍率
    function FrameSetModelSize takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型与控件的偏移坐标
    function FrameSetModelXY takes integer p1, real p2, real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  获取模型与控件的偏移坐标X
    function FrameGetModelX takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    //  获取模型与控件的偏移坐标Y
    function FrameGetModelY takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    //  设置动画播放倍率
    function FrameSetModelSpeed takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction

    //  获取动画播放倍率
    function FrameGetModelSpeed takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    //  设置模型旋转x轴
    function FrameSetModelRotateX takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction

    //  设置模型旋转y轴
    function FrameSetModelRotateY takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型旋转z轴
    function FrameSetModelRotateZ takes integer p1, real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction


    //  设置 忽略鼠标点击事件  默认是 true 填 false 可以 屏蔽鼠标点击
    function FrameSetIgnoreTrackEvents takes integer p1, boolean p2 returns nothing
        call GetTriggeringTrigger()
    endfunction


    //  网易的uid 整数
    function GetUserId takes nothing returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    //  网易的uid 字符串
    function GetUserIdEx takes nothing returns string
        call GetTriggeringTrigger()
        return ""
    endfunction

    //  获取父控件
    function FrameGetParent takes integer frame returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    //  获取子控件
    function FrameGetChilds takes integer frame, integer last returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    //  获取商店目标  /** 获取指定商店 选择 指定玩家的哪个单位 返回值是同步的接口 可以安全使用 */
    function GetStoreTarget takes unit store, player p returns unit
        call GetTriggeringTrigger()
        return null
    endfunction


    //  创建UI模型
    function FrameAddModel takes integer frame returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    //  可以让绑定在单位身上的特效 分离出来， 被分离的特效能设置坐标 跟缩放、
    function UnBindEffect takes effect p1 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  可以播放特效动画
    function EXPlayEffectAnimation takes effect p1, string animation_name, string link_name returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  可以用来 缩放 单位/特效的 粒子2 的模型缩放 相当于是绿苹果里中间那3个缩放
    function SetPariticle2Size takes effect Handle, real scale returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  是用来缩放 ui模型上面的粒子2的
    function FrameSetModelPariticle2Size takes integer frame, real scale returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  是否接触屏幕限制
    function SetFrameLimitScreen takes boolean is_limit returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置单位移动类型
    function SetUnitMoveType takes unit u, string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  修改单位碰撞体积大小
    function SetUnitCollisionSize takes unit u, real size returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  获取物品技能handle
    function GetItemAbility takes item Item, integer slot returns integer 
        call GetTriggeringTrigger()
        return 0
    endfunction

    
    // 获取 框选按钮 slot 从0 ~ 11 
    function FrameGetInfoSelectButton takes integer slot returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    // 获取 下方buff按钮 slot 从0 ~ 7 
    function FrameGetBuffButton takes integer slot returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 获取 农民按钮 
    function FrameGetUnitButton takes nothing returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 获取 技能右下角数字文本控件 button = 技能按钮  返回值 = SimpleString 类型控件
    function FrameGetButtonSimpleString takes integer button1 returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 获取 技能右下角控件  button = 技能按钮  返回值 = SimpleFrame 类型控件
    function FrameGetButtonSimpleFrame takes integer button1 returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    
    // 判断控件是否显示
    function FrameIsShow takes integer frame returns boolean
        call GetTriggeringTrigger()
        return false
    endfunction
    
    // 修改原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
    function FrameSetOriginButtonTexture takes integer button1, string path returns nothing 
        call GetTriggeringTrigger()
    endfunction
    
    //  获取原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
    function FrameGetOriginButtonTexture takes integer button1 returns string 
        call GetTriggeringTrigger()
        return ""
    endfunction
    
    
    // 获取 simple类型控件的 父控件
    function FrameGetSimpleParent takes integer SimpleFrame returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction

    // 修改 simple类型控件的 父控件
    function FrameSetSimpleParent takes integer SimpleFrame, integer parentSimple returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 为Simple绑定 frame类型的子控件
    // 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
    // 返回的是一个 SetupFrame值
    function FrameSimpleBindFrame takes integer SimpleFrame, integer Frame returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 解除绑定 解除后 frame跟simple 就不再关联
    function FrameSimpleUnBindFrame takes integer SetupFrame returns nothing
        call GetTriggeringTrigger()
    endfunction

    // 设置模型在 场景内的坐标  跟镜头位置有关系 X
    function FrameSetModelX takes integer p1, real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    // 设置模型在 场景内的坐标  跟镜头位置有关系 Y
    function FrameSetModelY takes integer p1, real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    // 设置模型在 场景内的坐标  跟镜头位置有关系 Z
    function FrameSetModelZ takes integer p1, real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置镜头位置
    function FrameSetModelCameraSource takes integer p1, real p2, real p3, real p4 returns nothing
        call GetTriggeringTrigger()
    endfunction

    //  设置镜头目标位置
    function FrameSetModelCameraTarget takes integer p1, real p2, real p3, real p4 returns nothing
        call GetTriggeringTrigger()
    endfunction

    function md5 takes string str returns string
        call GetTriggeringTrigger()
        return ""
    endfunction

    // 设置魔兽窗口在屏幕中的位置
    function SetWindowPos takes integer p1, real p2, real p3, integer p4, integer p5, integer p6 returns nothing
        call GetTriggeringTrigger()
    endfunction

    function DzIsUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns boolean
        return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16+19*index))))==attackType
    endfunction

    function DzSetUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns nothing
        call SetUnitState(whichUnit, ConvertUnitState(16+19*index), GetHandleId(attackType ))
    endfunction

    function DzIsUnitDefenseType takes unit whichUnit,integer defenseType returns boolean
        return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50)))==defenseType
    endfunction

    function DzSetUnitDefenseType takes unit whichUnit,integer defenseType returns nothing
        call SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType )
    endfunction

    function QOSetwuqi takes unit u, integer lx returns nothing
        call SetUnitState(u, ConvertUnitState(88), lx)
    endfunction

    function QOIswuqi takes unit u, integer lx returns boolean
        return GetUnitState(u, ConvertUnitState(88)) == lx
    endfunction
    
    //单位变身
    function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call YDWESetUnitAbilityDataInteger(u, abilcode, 1, 117, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction

    function initializePlugin takes nothing returns integer
        call ExecuteFunc("DoNothing")
        call StartCampaignAI( Player(PLAYER_NEUTRAL_AGGRESSIVE), "callback" )
        call ExecuteFunc("DoNothing")
        call AbilityId("exec-lua:plugin_main")
        return 0
    endfunction
endlibrary

#endif
