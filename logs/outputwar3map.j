globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from DRWJ:
constant boolean LIBRARY_DRWJ=true
//endglobals from DRWJ
//globals from DzAPI:
constant boolean LIBRARY_DzAPI=true
//endglobals from DzAPI
//globals from XGYDTriggerLocalVariablePool:
constant boolean LIBRARY_XGYDTriggerLocalVariablePool=true
integer array XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool
        //当前索引存货量
        //正常的空闲时间 它应该等于index
        //如果很长一段连续时间内不成立，并且你没有等待动作，很有可能发生奇怪的bug了
        //比如申请了但是没有释放，所以请检查你的代码逻辑
integer XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size= 0
        //当前索引池索引【当前已使用的索引数量】
integer XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index= 0
integer XG_YDTrigger_StackIdx= 0
//endglobals from XGYDTriggerLocalVariablePool
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
hashtable array YDWJHT
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//ȫ�ֹ�ϣ�� 
string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//全局系统变量
unit bj_lastAbilityCastingUnit=null
unit bj_lastAbilityTargetUnit=null
unit bj_lastPoolAbstractedUnit=null
unitpool bj_lastCreatedUnitPool=null
item bj_lastPoolAbstractedItem=null
itempool bj_lastCreatedItemPool=null
attacktype bj_lastSetAttackType= ATTACK_TYPE_NORMAL
damagetype bj_lastSetDamageType= DAMAGE_TYPE_NORMAL
weapontype bj_lastSetWeaponType= WEAPON_TYPE_WHOKNOWS
real yd_MapMaxX= 0
real yd_MapMinX= 0
real yd_MapMaxY= 0
real yd_MapMinY= 0
string array YDWEBase___yd_PlayerColor
trigger array YDWEBase___AbilityCastingOverEventQueue
integer array YDWEBase___AbilityCastingOverEventType
integer YDWEBase___AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from japi:
constant boolean LIBRARY_japi=true
//endglobals from japi
//globals from nzjapi:
constant boolean LIBRARY_nzjapi=true
hashtable nzjapi___ht=InitHashtable()
real array nzjapi___screen
real array nzjapi___world
location nzjapi___loc=Location(0., 0.)
string array nzjapi___moveType
//endglobals from nzjapi
//globals from Other:
constant boolean LIBRARY_Other=true
hashtable Other___ht=InitHashtable()
real Other___Speel_X
real Other___Speel_Y
real Other___Screen_X
real Other___Screen_Y
unit Other___Speel_U
location Other___Loc=Location(0, 0)
string array Other___HexMap
string array Other___I2ASCII
string array Other___suffixes
item Other___pItem=null
rect Other___pFind=null
item array Other___pHid
integer Other___HidMax=0
real Other___pX=0.0
real Other___pY=0.0
unit Other___Majia
string PO_font="FZDBSJW.ttf"
hashtable POHT=InitHashtable()
//endglobals from Other
trigger gg_trg_______u= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__japi=1
integer si__japi_F=0
integer si__japi_I=0
integer array si__japi_V
integer array s__japi_AbilityDataInteger
integer array s__japi_AbilityDataReal
integer array s__japi_AbilityDataString
integer array s__japi_ItemDataString
damagetype array s__japi_GetDamageType
weapontype array s__japi_GetWeaponType
attacktype array s__japi_GetAttackType
integer array s__japi_CollisionType
integer array s__japi_MoveType

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzGetLocale takes nothing returns string
    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
    native DzFrameSetPriority takes integer frame, integer priority returns nothing
    native DzFrameSetParent takes integer frame, integer parent returns nothing
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
    native EXSetUnitArrayString takes integer uid, integer id,integer n,string name returns boolean
	native EXSetUnitInteger takes integer uid, integer id,integer n returns boolean
    native DzAPI_Map_HasMallItem takes player whichPlayer, string key returns boolean
    native DzAPI_Map_GetMapLevel takes player whichPlayer returns integer
    native RequestExtraIntegerData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns integer
    native RequestExtraBooleanData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns boolean
    native RequestExtraStringData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns string
    native RequestExtraRealData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns real
    native DzAPI_Map_SaveServerValue takes player whichPlayer, string key, string value returns boolean
    native DzAPI_Map_GetServerValue takes player whichPlayer, string key returns string
    native DzAPI_Map_GetMapConfig takes string key returns string
    native DzAPI_Map_UseConsumablesItem takes player whichPlayer, string key returns nothing


//Generated allocator of japi
function s__japi__allocate takes nothing returns integer
 local integer this=si__japi_F
    if (this!=0) then
        set si__japi_F=si__japi_V[this]
    else
        set si__japi_I=si__japi_I+1
        set this=si__japi_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__japi_V[this]=-1
 return this
endfunction

//Generated destructor of japi
function s__japi_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__japi_V[this]!=-1) then
        return
    endif
    set si__japi_V[this]=si__japi_F
    set si__japi_F=this
endfunction

//library BzAPI:
    //hardware




























    //plus











    //sync




    //gui










































































    function DzSetHeroTypeProperName takes integer uid,string name returns nothing
        call EXSetUnitArrayString(uid, 61, 0, name)
        call EXSetUnitInteger(uid, 61, 1)
    endfunction
    function DzSetUnitTypeName takes integer uid,string name returns nothing
        call EXSetUnitArrayString(uid, 10, 0, name)
        call EXSetUnitInteger(uid, 10, 1)
    endfunction
    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction
 function DzTriggerRegisterMallItemSyncData takes trigger trig returns nothing
		call DzTriggerRegisterSyncData(trig, "DZMIA", true)
	endfunction
  function DzGetTriggerMallItemPlayer takes nothing returns player
		return DzGetTriggerSyncPlayer()
	endfunction
  function DzGetTriggerMallItem takes nothing returns string
		return DzGetTriggerSyncData()
	endfunction

//library BzAPI ends
//library DRWJ:
      
    

//library DRWJ ends
//library DzAPI:


    // native DzAPI_Map_GetGuildName takes player whichPlayer returns string




    
    // SaveServerValue,               //保存服务器存档

    // function DzAPI_Map_SaveServerValue takes player whichPlayer, string key, string value returns boolean
    //     return RequestExtraBooleanData(4, whichPlayer, key, value, false, 0, 0, 0)
    // endfunction
    // GetServerValue,                //读取服务器存档

    // function DzAPI_Map_GetServerValue takes player whichPlayer, string key returns string
    //     return RequestExtraStringData(5, whichPlayer, key, null, false, 0, 0, 0)
    // endfunction
    // GetGameStartTime,              //取游戏开始时间
    function DzAPI_Map_GetGameStartTime takes nothing returns integer
        return RequestExtraIntegerData(11, null, null, null, false, 0, 0, 0)
    endfunction
    // IsRPGLadder,                   //判断当前是否rpg天梯
    function DzAPI_Map_IsRPGLadder takes nothing returns boolean
        return RequestExtraBooleanData(12, null, null, null, false, 0, 0, 0)
    endfunction
    // GetMatchType,                  //获取匹配类型
    function DzAPI_Map_GetMatchType takes nothing returns integer
        return RequestExtraIntegerData(13, null, null, null, false, 0, 0, 0)
    endfunction
        // SetStat,                       //统计-提交地图数据
    function DzAPI_Map_Stat_SetStat takes player whichPlayer,string key,string value returns nothing
        call RequestExtraIntegerData(7, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // SetLadderStat,                 //天梯-统计数据
    function DzAPI_Map_Ladder_SetStat takes player whichPlayer,string key,string value returns nothing
        call RequestExtraIntegerData(8, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // SetLadderPlayerStat,           //天梯-统计数据
    function DzAPI_Map_Ladder_SetPlayerStat takes player whichPlayer,string key,string value returns nothing
        call RequestExtraIntegerData(9, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
        // GetServerValueErrorCode,       //读取加载服务器存档时的错误码
    function DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer
        return RequestExtraIntegerData(6, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetLadderLevel,                //提供给地图的接口，用与取天梯等级
    function DzAPI_Map_GetLadderLevel takes player whichPlayer returns integer
        return RequestExtraIntegerData(14, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // PlayerIdentityType, // 获取玩家身份类型
    function KKApiPlayerIdentityType takes player whichPlayer,integer id returns boolean
        return RequestExtraBooleanData(92, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    // IsRedVIP,                      //提供给地图的接口，用与判断是否红V
    function DzAPI_Map_IsRedVIP takes player whichPlayer returns boolean
        return (RequestExtraBooleanData(92, (whichPlayer ), null, null, false, ( 4), 0, 0)) // INLINED!!
    endfunction
    // IsBlueVIP,                     //提供给地图的接口，用与判断是否蓝V
    function DzAPI_Map_IsBlueVIP takes player whichPlayer returns boolean
        return (RequestExtraBooleanData(92, (whichPlayer ), null, null, false, ( 3), 0, 0)) // INLINED!!
    endfunction
    // GetLadderRank,                 //提供给地图的接口，用与取天梯排名
    function DzAPI_Map_GetLadderRank takes player whichPlayer returns integer
        return RequestExtraIntegerData(17, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetMapLevelRank,               //提供给地图的接口，用与取地图等级排名
    function DzAPI_Map_GetMapLevelRank takes player whichPlayer returns integer
        return RequestExtraIntegerData(18, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetGuildRole,                  //获取公会职责 Member=10 Admin=20 Leader=30
    function DzAPI_Map_GetGuildRole takes player whichPlayer returns integer
        return RequestExtraIntegerData(20, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // IsRPGLobby,                    //检查是否大厅地图
    function DzAPI_Map_IsRPGLobby takes nothing returns boolean
        return RequestExtraBooleanData(10, null, null, null, false, 0, 0, 0)
    endfunction
    
    // MissionComplete,               //用作完成某个任务，发奖励
    function DzAPI_Map_MissionComplete takes player whichPlayer,string key,string value returns nothing
        call RequestExtraIntegerData(1, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // GetActivityData,               //提供给地图的接口，用作取服务器上的活动数据
    function DzAPI_Map_GetActivityData takes nothing returns string
        return RequestExtraStringData(2, null, null, null, false, 0, 0, 0)
    endfunction
    // GetMapConfig,                  //获取地图配置

    // function DzAPI_Map_GetMapConfig takes string key returns string
    //     return RequestExtraStringData(21, null, key, null, false, 0, 0, 0)
    // endfunction
    // SavePublicArchive,             //保存服务器存档组
    function DzAPI_Map_SavePublicArchive takes player whichPlayer,string key,string value returns boolean
        return RequestExtraBooleanData(31, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    // GetPublicArchive,              //读取服务器存档组
    function DzAPI_Map_GetPublicArchive takes player whichPlayer,string key returns string
        return RequestExtraStringData(32, whichPlayer, key, null, false, 0, 0, 0)
    endfunction

    // function DzAPI_Map_UseConsumablesItem takes player whichPlayer, string key returns nothing
    //     call RequestExtraIntegerData(33, whichPlayer, key, null, false, 0, 0, 0)
    // endfunction
    // OrpgTrigger,                   //触发boss击杀
    function DzAPI_Map_OrpgTrigger takes player whichPlayer,string key returns nothing
        call RequestExtraIntegerData(28, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetServerArchiveDrop,          //读取服务器掉落数据
    function DzAPI_Map_GetServerArchiveDrop takes player whichPlayer,string key returns string
        return RequestExtraStringData(27, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetServerArchiveEquip,         //读取服务器装备数据
    function DzAPI_Map_GetServerArchiveEquip takes player whichPlayer,string key returns integer
        return RequestExtraIntegerData(26, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GetPlatformVIP takes player whichPlayer returns integer
        return RequestExtraIntegerData(30, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsPlatformVIP takes player whichPlayer returns boolean
        return (RequestExtraIntegerData(30, (whichPlayer), null, null, false, 0, 0, 0)) > 0 // INLINED!!
    endfunction
    function DzAPI_Map_Global_GetStoreString takes string key returns string
        return RequestExtraStringData(36, GetLocalPlayer(), key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Global_StoreString takes string key,string value returns nothing
        call RequestExtraBooleanData(37, GetLocalPlayer(), key, value, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Global_ChangeMsg takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZGAU", true)
    endfunction
    function DzAPI_Map_ServerArchive takes player whichPlayer,string key returns string
        return RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_SaveServerArchive takes player whichPlayer,string key,string value returns nothing
        call RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsRPGQuickMatch takes nothing returns boolean
        return RequestExtraBooleanData(40, null, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GetMallItemCount takes player whichPlayer,string key returns integer
        return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_ConsumeMallItem takes player whichPlayer,string key,integer count returns boolean
        return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0)
    endfunction
    function DzAPI_Map_EnablePlatformSettings takes player whichPlayer,integer option,boolean enable returns boolean
        return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0)
    endfunction
    function GetPlayerServerValueSuccess takes player whichPlayer returns boolean
        if ( (RequestExtraIntegerData(6, (whichPlayer), null, null, false, 0, 0, 0)) == 0 ) then // INLINED!!
            return true
        else
            return false
        endif
    endfunction
    function DzAPI_Map_StoreIntegerEX takes player whichPlayer,string key,integer value returns nothing
        set key="I" + key
        call RequestExtraBooleanData(39, whichPlayer, key, I2S(value), false, 0, 0, 0)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredIntegerEX takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreInteger takes player whichPlayer,string key,integer value returns nothing
        set key="I" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredInteger takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
        function DzAPI_Map_CommentTotalCount1 takes player whichPlayer,integer id returns integer
            return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    function DzAPI_Map_StoreReal takes player whichPlayer,string key,real value returns nothing
        set key="R" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, R2S(value))
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredReal takes player whichPlayer,string key returns real
        local real value
        set key="R" + key
        set value=S2R(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreBoolean takes player whichPlayer,string key,boolean value returns nothing
        set key="B" + key
        if ( value ) then
            call DzAPI_Map_SaveServerValue(whichPlayer, key, "1")
        else
            call DzAPI_Map_SaveServerValue(whichPlayer, key, "0")
        endif
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredBoolean takes player whichPlayer,string key returns boolean
        local boolean value
        set key="B" + key
        set key=DzAPI_Map_GetServerValue(whichPlayer, key)
        if ( key == "1" ) then
            set value=true
        else
            set value=false
        endif
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_StoreString takes player whichPlayer,string key,string value returns nothing
        set key="S" + key
        call DzAPI_Map_SaveServerValue(whichPlayer, key, value)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredString takes player whichPlayer,string key returns string
        return DzAPI_Map_GetServerValue(whichPlayer, "S" + key)
    endfunction
    function DzAPI_Map_StoreStringEX takes player whichPlayer,string key,string value returns nothing
        set key="S" + key
        call RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GetStoredStringEX takes player whichPlayer,string key returns string
        return RequestExtraStringData(38, whichPlayer, "S" + key, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GetStoredUnitType takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_GetStoredAbilityId takes player whichPlayer,string key returns integer
        local integer value
        set key="I" + key
        set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
        set key=null
        set whichPlayer=null
        return value
    endfunction
    function DzAPI_Map_FlushStoredMission takes player whichPlayer,string key returns nothing
        call DzAPI_Map_SaveServerValue(whichPlayer, key, null)
        set key=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitIntegerData takes player whichPlayer,string key,integer value returns nothing
        call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
    endfunction
    function DzAPI_Map_Stat_SubmitUnitIdData takes player whichPlayer,string key,integer value returns nothing
        if ( value == 0 ) then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
        endif
    endfunction
    function DzAPI_Map_Stat_SubmitUnitData takes player whichPlayer,string key,unit value returns nothing
        call DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer , key , GetUnitTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitAblityIdData takes player whichPlayer,string key,integer value returns nothing
        if ( value == 0 ) then
            //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitItemIdData takes player whichPlayer,string key,integer value returns nothing
        local string S
        if ( value == 0 ) then
            set S="0"
        else
            set S=I2S(value)
            call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( S), false, 0, 0, 0) // INLINED!!
        endif
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        set S=null
        set whichPlayer=null
    endfunction
    function DzAPI_Map_Ladder_SubmitItemData takes player whichPlayer,string key,item value returns nothing
        call DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer , key , GetItemTypeId(value))
    endfunction
    function DzAPI_Map_Ladder_SubmitBooleanData takes player whichPlayer,string key,boolean value returns nothing
        if ( value ) then
            call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( "1"), false, 0, 0, 0) // INLINED!!
        else
            call RequestExtraIntegerData(8, (whichPlayer ), ( key ), ( "0"), false, 0, 0, 0) // INLINED!!
        endif
    endfunction
    function DzAPI_Map_Ladder_SubmitTitle takes player whichPlayer,string value returns nothing
        call RequestExtraIntegerData(8, (whichPlayer ), ( value ), ( "1"), false, 0, 0, 0) // INLINED!!
    endfunction
    function DzAPI_Map_Ladder_SubmitPlayerRank takes player whichPlayer,integer value returns nothing
        call RequestExtraIntegerData(9, (whichPlayer ), ( "RankIndex" ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
    endfunction
    function DzAPI_Map_Ladder_SubmitPlayerExtraExp takes player whichPlayer,integer value returns nothing
        call RequestExtraIntegerData(8, (whichPlayer ), ( "ExtraExp" ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
    endfunction
    function DzAPI_Map_PlayedGames takes player whichPlayer returns integer
        return RequestExtraIntegerData(45, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CommentCount takes player whichPlayer returns integer
        return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_FriendCount takes player whichPlayer returns integer
        return RequestExtraIntegerData(47, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsConnoisseur takes player whichPlayer returns boolean
        return RequestExtraBooleanData(48, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_IsAuthor takes player whichPlayer returns boolean
        return RequestExtraBooleanData(50, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CommentTotalCount takes nothing returns integer
        return RequestExtraIntegerData(51, null, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_Statistics takes player whichPlayer,string eventKey,string eventType,integer value returns nothing
        call RequestExtraBooleanData(34, whichPlayer, eventKey, "", false, value, 0, 0)
    endfunction
    function DzAPI_Map_Returns takes player whichPlayer,integer label returns boolean
        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
    endfunction
    function DzAPI_Map_ContinuousCount takes player whichPlayer,integer id returns integer
        return RequestExtraIntegerData(54, whichPlayer, null, null, false, id, 0, 0)
    endfunction
    // IsPlayer,                      //是否为玩家
    function DzAPI_Map_IsPlayer takes player whichPlayer returns boolean
        return RequestExtraBooleanData(55, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // MapsTotalPlayed,               //所有地图的总游戏时长
    // function DzAPI_Map_MapsTotalPlayed takes player whichPlayer returns integer
    //     return RequestExtraIntegerData(56, whichPlayer, null, null, false, 0, 0, 0)
    // endfunction
    // MapsLevel,                    //指定地图的地图等级
    function DzAPI_Map_MapsLevel takes player whichPlayer,integer mapId returns integer
        return RequestExtraIntegerData(57, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeGold,              //所有地图的金币消耗
    function DzAPI_Map_MapsConsumeGold takes player whichPlayer,integer mapId returns integer
        return RequestExtraIntegerData(58, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLumber,            //所有地图的木材消耗
    function DzAPI_Map_MapsConsumeLumber takes player whichPlayer,integer mapId returns integer
        return RequestExtraIntegerData(59, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv1,               //消费 1-199
    function DzAPI_Map_MapsConsumeLv1 takes player whichPlayer,integer mapId returns boolean
        return RequestExtraBooleanData(60, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv2,               //消费 200-499
    function DzAPI_Map_MapsConsumeLv2 takes player whichPlayer,integer mapId returns boolean
        return RequestExtraBooleanData(61, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv3,               //消费 500~999
    function DzAPI_Map_MapsConsumeLv3 takes player whichPlayer,integer mapId returns boolean
        return RequestExtraBooleanData(62, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // MapsConsumeLv4,               //消费 1000+
    function DzAPI_Map_MapsConsumeLv4 takes player whichPlayer,integer mapId returns boolean
        return RequestExtraBooleanData(63, whichPlayer, null, null, false, mapId, 0, 0)
    endfunction
    // IsPlayerUsingSkin,            //检查是否装备着皮肤（skinType：头像=1、边框=2、称号=3、底纹=4）
    function DzAPI_Map_IsPlayerUsingSkin takes player whichPlayer,integer skinType,integer id returns boolean
        return RequestExtraBooleanData(64, whichPlayer, null, null, false, skinType, id, 0)
    endfunction
    //获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
    function DzAPI_Map_GetForumData takes player whichPlayer,integer whichData returns integer
        return RequestExtraIntegerData(65, whichPlayer, null, null, false, whichData, 0, 0)
    endfunction
    // PlayerFlags,                   //玩家标记 label（1=曾经是平台回流用户，2=当前是平台回流用户，4=曾经是地图回流用户，8=当前是地图回流用户，16=地图是否被玩家收藏）
    function DzAPI_Map_PlayerFlags takes player whichPlayer,integer label returns boolean
        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
    endfunction
    // GetLotteryUsedCount, // 获取宝箱抽取次数
    function DzAPI_Map_GetLotteryUsedCountEx takes player whichPlayer,integer index returns integer
        return RequestExtraIntegerData(68, whichPlayer, null, null, false, index, 0, 0)
    endfunction
    function DzAPI_Map_GetLotteryUsedCount takes player whichPlayer returns integer
        return (RequestExtraIntegerData(68, (whichPlayer ), null, null, false, ( 0), 0, 0)) + (RequestExtraIntegerData(68, (whichPlayer ), null, null, false, ( 1), 0, 0)) + (RequestExtraIntegerData(68, (whichPlayer ), null, null, false, ( 2), 0, 0)) // INLINED!!
    endfunction
    function DzAPI_Map_OpenMall takes player whichPlayer,string whichkey returns boolean
        return RequestExtraBooleanData(66, whichPlayer, whichkey, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_GameResult_CommitData takes player whichPlayer,string key,string value returns nothing
        call RequestExtraIntegerData(69, whichPlayer, key, value, false, 0, 0, 0)
    endfunction
    //游戏结算
    function DzAPI_Map_GameResult_CommitTitle takes player whichPlayer,string value returns nothing
        call RequestExtraIntegerData(69, (whichPlayer ), ( value ), ( "1"), false, 0, 0, 0) // INLINED!!
        set whichPlayer=null
        set value=null
    endfunction
    function DzAPI_Map_GameResult_CommitPlayerRank takes player whichPlayer,integer value returns nothing
        call RequestExtraIntegerData(69, (whichPlayer ), ( "RankIndex" ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
        set whichPlayer=null
        set value=0
    endfunction
    function DzAPI_Map_GameResult_CommitGameMode takes string value returns nothing
        call RequestExtraIntegerData(69, (GetLocalPlayer() ), ( "InnerGameMode" ), ( value), false, 0, 0, 0) // INLINED!!
        set value=null
    endfunction
    function DzAPI_Map_GameResult_CommitGameResult takes player whichPlayer,integer value returns nothing
        call RequestExtraIntegerData(69, (whichPlayer ), ( "GameResult" ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
        set whichPlayer=null
    endfunction
    function DzAPI_Map_GameResult_CommitGameResultNoEnd takes player whichPlayer,integer value returns nothing
        call RequestExtraIntegerData(69, (whichPlayer ), ( "GameResultNoEnd" ), ( I2S(value)), false, 0, 0, 0) // INLINED!!
        set whichPlayer=null
    endfunction
    // GetSinceLastPlayedSeconds, // 获取距最后一次游戏的秒数
    function DzAPI_Map_GetSinceLastPlayedSeconds takes player whichPlayer returns integer
        return RequestExtraIntegerData(70, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // QuickBuy, //游戏内快速购买
    function DzAPI_Map_QuickBuy takes player whichPlayer,string key,integer count,integer seconds returns boolean
        return RequestExtraBooleanData(72, whichPlayer, key, null, false, count, seconds, 0)
    endfunction
    // CancelQuickBuy, //取消快速购买
    function DzAPI_Map_CancelQuickBuy takes player whichPlayer returns boolean
        return RequestExtraBooleanData(73, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    //判断是加载成功某个玩家的道具
    function DzAPI_Map_PlayerLoadedItems takes player whichPlayer returns boolean
        return RequestExtraBooleanData(77, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function DzAPI_Map_CustomRankCount takes integer id returns integer
        return RequestExtraIntegerData(78, null, null, null, false, id, 0, 0)
    endfunction
    // CustomRankPlayerName            // 获取排行榜上指定排名的用户名称
    function DzAPI_Map_CustomRankPlayerName takes integer id,integer ranking returns string
        return RequestExtraStringData(79, null, null, null, false, id, ranking, 0)
    endfunction
    // CustomRankPlayerValue           // 获取排行榜上指定排名的值
    function DzAPI_Map_CustomRankValue takes integer id,integer ranking returns integer
        return RequestExtraIntegerData(80, null, null, null, false, id, ranking, 0)
    endfunction
    //获取玩家在KK平台的完整昵称（基础昵称#编号）
    function DzAPI_Map_GetPlayerUserName takes player whichPlayer returns string
        return RequestExtraStringData(81, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    // GetServerValueLimitLeft,   // 获取服务器存档限制余额
    function KKApiGetServerValueLimitLeft takes player whichPlayer,string key returns integer
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // RequestBackendLogic,       //请求后端逻辑生成 
    function KKApiRequestBackendLogic takes player whichPlayer,string key,string groupkey returns boolean
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false, 0, 0, 0)
    endfunction
    // CheckBackendLogicExists,   // 获取后端逻辑生成结果 是否存在
    function KKApiCheckBackendLogicExists takes player whichPlayer,string key returns boolean
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicIntResult,  // 获取后端逻辑生成结果 整型
    function KKApiGetBackendLogicIntResult takes player whichPlayer,string key returns integer
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicStrResult,  // 获取后端逻辑生成结果 字符串
    function KKApiGetBackendLogicStrResult takes player whichPlayer,string key returns string
        return RequestExtraStringData(86, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicUpdateTime, // 获取后端逻辑生成时间
    function KKApiGetBackendLogicUpdateTime takes player whichPlayer,string key returns integer
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // GetBackendLogicGroup,      // 获取后端逻辑生成组
    function KKApiGetBackendLogicGroup takes player whichPlayer,string key returns string
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // RemoveBackendLogicResult,  // 删除后端逻辑生成结果
    function KKApiRemoveBackendLogicResult takes player whichPlayer,string key returns boolean
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0)
    endfunction
    // 获取随机存档剩余次数
    function KKApiRandomSaveGameCount takes player whichPlayer,string groupkey returns integer
        return RequestExtraIntegerData(101, whichPlayer, groupkey, null, false, 0, 0, 0)
    endfunction
    function KKApiTriggerRegisterBackendLogicUpdata takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZBLU", true)
    endfunction
    function KKApiTriggerRegisterBackendLogicDelete takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZBLD", true)
    endfunction
    function KKApiGetSyncBackendLogic takes nothing returns string
        return DzGetTriggerSyncData()
    endfunction
    function KKApiIsGameMode takes nothing returns boolean
        return RequestExtraBooleanData(90, null, null, null, false, 0, 0, 0)
    endfunction
    function KKApiInitializeGameKey takes player whichPlayer,integer setIndex,string k,string data returns boolean
        return RequestExtraBooleanData(91, whichPlayer, "[{\"name\":\"" + data + "\",\"key\":\"" + k + "\"}]", null, false, setIndex, 0, 0)
    endfunction
    function KKApiPlayerGUID takes player whichPlayer returns string
        return RequestExtraStringData(93, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    function KKApiIsTaskInProgress takes player whichPlayer,integer setIndex,integer taskstat returns boolean
        return RequestExtraIntegerData(94, whichPlayer, null, null, false, setIndex, 0, 0) == taskstat
    endfunction
    function KKApiQueryTaskCurrentProgress takes player whichPlayer,integer setIndex returns integer
        return RequestExtraIntegerData(95, whichPlayer, null, null, false, setIndex, 0, 0)
    endfunction
    function KKApiQueryTaskTotalProgress takes player whichPlayer,integer setIndex returns integer
        return RequestExtraIntegerData(96, whichPlayer, null, null, false, setIndex, 0, 0)
    endfunction
    // IsAchievementCompleted,  // 获取玩家成就是否完成
    function KKApiIsAchievementCompleted takes player whichPlayer,string id returns boolean
        return RequestExtraBooleanData(98, whichPlayer, id, null, false, 0, 0, 0)
    endfunction
    // AchievementPoints,  // 获取玩家地图成就点数
    function KKApiAchievementPoints takes player whichPlayer returns integer
        return RequestExtraIntegerData(99, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    
    // 判断游戏时长是否满足条件 minHours: 最小小时数，maxHours: 最大小时数，0表示不限制
    function KKApiPlayedTime takes player whichPlayer,integer minHours,integer maxHours returns boolean
        return RequestExtraBooleanData(100, whichPlayer, null, null, false, minHours, maxHours, 0)
    endfunction
    // BeginBatchSaveArchive,  // 开始批量保存存档
    function KKApiBeginBatchSaveArchive takes player whichPlayer returns boolean
        return RequestExtraBooleanData(102, whichPlayer, null, null, false, 0, 0, 0)
    endfunction
    
    // AddBatchSaveArchive,    // 添加批量保存存档条目
    function KKApiAddBatchSaveArchive takes player whichPlayer,string key,string value,boolean caseInsensitive returns boolean
        return RequestExtraBooleanData(103, whichPlayer, key, value, caseInsensitive, 0, 0, 0)
    endfunction
    
    // EndBatchSaveArchive,    // 结束批量保存存档
    function KKApiEndBatchSaveArchive takes player whichPlayer,boolean abandon returns boolean
        return RequestExtraBooleanData(104, whichPlayer, null, null, abandon, 0, 0, 0)
    endfunction
    //天梯投降
    function KKApiTriggerRegisterLadderSurrender takes trigger trig returns nothing
        call DzTriggerRegisterSyncData(trig, "DZSR", true)
    endfunction
    function KKApiGetLadderSurrenderTeamId takes nothing returns integer
        return S2I(DzGetTriggerSyncData())
    endfunction

//library DzAPI ends
//library XGYDTriggerLocalVariablePool:
    //声明一个索引池,一个申请函数，一个释放函数
    //申请函数：申请一个索引，如果索引池为空，新建一个索引，否则返回最后一个可用索引
    function XG_YDLocalIndex_Alloc takes nothing returns integer
        local integer index
        if XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size == 0 then
            //如果索引池为空，新建一个索引
            set XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index + 1
            set XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool[XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index]=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index
            set index=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index //省一层嵌套的效率，反正 array[index] = index
else
            //如果索引池不为空，返回最后一个可用索引
            set index=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool[XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size]
            set XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size - 1
        endif
        //call BJDebugMsg( "申请idx："+I2S(index) )
        set XG_YDTrigger_StackIdx=XG_YDTrigger_StackIdx + 1
        return index
    endfunction
    //释放函数：释放一个索引，将索引放入索引池
    //注意：为了提高效率将不判断传入的索引，释放的索引必须由Alloc函数申请，且请勿重复释放，否则将会出错、污染池子
    function XG_YDLocalIndex_Release takes integer index returns nothing
        set XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size=XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size + 1
        set XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool[XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size]=index
        set XG_YDTrigger_StackIdx=XG_YDTrigger_StackIdx - 1
    endfunction
    function XG_YDLocalIndex_Debug takes nothing returns nothing
        call BJDebugMsg("最大元素数量 = " + I2S(XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Index))
        call BJDebugMsg("剩余元素数量 = " + I2S(XGYDTriggerLocalVariablePool___g_YDTrigger_IndexPool_Size))
    endfunction

//library XGYDTriggerLocalVariablePool ends
//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem___Init takes nothing returns nothing
        local integer index= 0
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
        
        loop
            set YDWJHT[index]=InitHashtable()
            set index=index + 1
            exitwhen index == bj_MAX_PLAYER_SLOTS
        endloop
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEBase:
//===========================================================================
//HashTable
//===========================================================================
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//����
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT, i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT, StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT, i, j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT, i, j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT, pTable, pKey, i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT, pTable, pKey, r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT, pTable, pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT, pTable, pKey, s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT, pTable, pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT, pTable, pKey, b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT, pTable, pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, pTable, pKey, u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT, pTable, pKey, uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT, pTable, pKey, abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT, pTable, pKey, p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT, pTable, pKey, it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT, pTable, pKey, itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, pTable, pKey, t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, pTable, pKey, trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, pTable, pKey, pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT, pTable, pKey, g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, pTable, pKey, m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, pTable, pKey, tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, pTable, pKey, ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, pTable, pKey, e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, pTable, pKey, da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, pTable, pKey, et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT, pTable, pKey, fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, pTable, pKey, be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, pTable, pKey, sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, pTable, pKey, td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, pTable, pKey, d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, pTable, pKey, bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, pTable, pKey, qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, pTable, pKey, qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID,integer key,integer missionKey,hashtable table returns nothing
    call SaveInteger(table, missionKey, key, AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table,integer parentKey,integer childKey,integer AbilityID returns nothing
    call SaveInteger(table, parentKey, childKey, AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key,integer missionKey,hashtable table returns integer
    return LoadInteger(table, missionKey, key)
endfunction
function YDWELoadAbilityHandle takes hashtable table,integer parentKey,integer childKey returns integer
    return LoadInteger(table, parentKey, childKey)
endfunction
//===========================================================================
//返回参数
//===========================================================================
//地图边界判断
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
//两个单位之间的距离
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    return SquareRoot(( GetUnitX(a) - GetUnitX(b) ) * ( GetUnitX(a) - GetUnitX(b) ) + ( GetUnitY(a) - GetUnitY(b) ) * ( GetUnitY(a) - GetUnitY(b) ))
endfunction
//两个单位之间的角度
function YDWEAngleBetweenUnits takes unit fromUnit,unit toUnit returns real
    return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
endfunction
//生成区域
function YDWEGetRect takes real x,real y,real width,real height returns rect
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
endfunction
//===========================================================================
//设置单位可以飞行
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u, 'Amrf')
    call UnitRemoveAbility(u, 'Amrf')
endfunction
//===========================================================================
//字符窜与ID转换
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result= ""
    local integer remainingValue= value
    local integer charValue
    local integer byteno
    set byteno=0
    loop
        set charValue=ModuloInteger(remainingValue, 256)
        set remainingValue=remainingValue / 256
        set result=SubString(charMap, charValue, charValue + 1) + result
        set byteno=byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0
local integer b=0
local integer numx=1
local integer result=0
    loop
    exitwhen b > strlength - 1
        set numx=R2I(Pow(256, strlength - 1 - b))
        set a=1
        loop
            exitwhen a > 255
            if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
                set result=result + a * numx
                set a=256
            endif
            set a=a + 1
        endloop
        set b=b + 1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//YDWE特殊技能结束事件 
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero,integer index returns nothing
 local integer i= 0
    loop
        exitwhen i >= YDWEBase___AbilityCastingOverEventNumber
        if YDWEBase___AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase___AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase___AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase___AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase___AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase___AbilityCastingOverEventQueue[YDWEBase___AbilityCastingOverEventNumber]=trg
	set YDWEBase___AbilityCastingOverEventType[YDWEBase___AbilityCastingOverEventNumber]=index
	set YDWEBase___AbilityCastingOverEventNumber=YDWEBase___AbilityCastingOverEventNumber + 1
endfunction 
//===========================================================================
//系统函数完善
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up, p, x, y, face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip, x, y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p,string s returns string
    return YDWEBase___yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//系统函数补充
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i= 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i=i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//===========================================================================
//显示版本
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00YDWE 0.0.0.0")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t= CreateTrigger()
    local integer i= 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
        set i=i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t=null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable()
	//=================设置变量=====================
	set yd_MapMinX=GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY=GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX=GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY=GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set YDWEBase___yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase___yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase___yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase___yd_PlayerColor[3]="|cFF540081"
    set YDWEBase___yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase___yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase___yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase___yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase___yd_PlayerColor[8]="|cFF959697"
    set YDWEBase___yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase___yd_PlayerColor[10]="|cFF106246"
    set YDWEBase___yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase___yd_PlayerColor[12]="|cFF282828"
    set YDWEBase___yd_PlayerColor[13]="|cFF282828"
    set YDWEBase___yd_PlayerColor[14]="|cFF282828"
    set YDWEBase___yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library japi:
    
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
    
    function EXSetUnitReal takes integer p1,integer p2,real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function DestroyFrame takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitCollisionType takes boolean p1,unit p2,integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitReal takes integer p1,integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function VirtualMpqRegisterPath takes string p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitString takes integer p1,integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitString takes integer p1,integer p2,string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetUnitInteger takes integer p1,integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetEffectSpeed takes effect p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatReset takes effect p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlpRect takes string p1,string p2,integer p3,integer p4,integer p5,integer p6 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    //  移动特效坐标
    function EXSetEffectXY takes effect p1,real p2,real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetUnitArrayString takes integer p1,integer p2,integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    //  设置模型队伍颜色
    function FrameSetModelColor takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXBlendButtonIcon takes string p1,string p2,string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function FrameShowInterface takes nothing returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetItemDataString takes integer p1,integer p2,string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    //  获取特效Y坐标
    function EXGetEffectY takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXPauseUnit takes unit p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataString takes ability p1,integer p2,integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetUnitMoveType takes unit p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXSetUnitFacing takes unit p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextColor takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXExecuteScript takes string p1 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXGetUnitAbility takes unit p1,integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetUnitAbilityByIndex takes unit p1,integer p2 returns ability
    	call GetTriggeringTrigger()
    	return null
    endfunction
    
    function EXGetAbilityId takes ability p1 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXGetAbilityState takes ability p1,integer p2 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXSetAbilityState takes ability p1,integer p2,real p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXEffectMatRotateX takes effect p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataReal takes ability p1,integer p2,integer p3 returns real
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
    
    function EXSetAbilityDataReal takes ability p1,integer p2,integer p3,real p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function ShowFpsText takes boolean p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetAbilityDataInteger takes ability p1,integer p2,integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function EXSetAbilityDataInteger takes ability p1,integer p2,integer p3,integer p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityString takes integer p1,integer p2,integer p3,string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityDataString takes ability p1,integer p2,integer p3,string p4 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXSetAbilityAEmeDataA takes ability p1,integer p2 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetBuffDataString takes integer p1,integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function EXSetBuffDataString takes integer p1,integer p2,string p3 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXGetAbilityString takes integer p1,integer p2,integer p3 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    
    function LocalPointOrder takes integer p1,real p2,real p3,integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetItemDataString takes integer p1,integer p2 returns string
    	call GetTriggeringTrigger()
    	return ""
    endfunction
    //  设置特效高度
    function EXSetEffectZ takes effect p1,real p2 returns nothing
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
    
    function EXSetEffectSize takes effect p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXDisplayChat takes player p1,integer p2,string p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXGetEffectSize takes effect p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function EXEffectMatRotateY takes effect p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  绕Z轴旋转
    function EXEffectMatRotateZ takes effect p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function EXEffectMatScale takes effect p1,real p2,real p3,real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置特效动画
    function EXSetEffectAnimation takes effect p1,integer p2 returns nothing
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
    
    function EXBlpSector takes string p1,string p2,integer p3,integer p4,integer p5,integer p6,integer p7 returns boolean
    	call GetTriggeringTrigger()
    	return false
    endfunction
    
    function EXPolygon takes string p1,integer p2,integer p3,hashtable p4,integer p5,integer p6 returns boolean
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
    
    function FrameSetTexture takes integer p1,string p2,integer p3 returns nothing
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
    
    function LocalOrder takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function LocalTargetOrder takes integer p1,widget p2,integer p3 returns nothing
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
    
    function SetUnitAbilityButtonShow takes integer p1,integer p2,boolean p3 returns nothing
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
    
    function SetUnitPosition2 takes unit p1,real p2,real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitTexture takes unit p1,string p2,integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitModel takes unit p1,string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetUnitPortrait takes unit p1,string p2 returns nothing
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
    function SetUnitMissileModel takes unit p1,string p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetTextFontSpacing takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置单位普攻弹道弧度 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileArc takes unit p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SimpleFontStringFindByName takes string p1,integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  设置单位普攻弹道速度 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileSpeed takes unit p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    //  设置单位普攻弹道自导允许 每个单位独立 互相不影响 会被法球覆盖
    function SetUnitMissileHoming takes unit p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGlueUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    //  设置Frame模型
    function FrameSetModel2 takes integer p1,string p2,integer p3 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置模型按xyz轴缩放
    function FrameSetModelScale takes integer p1,real p2,real p3,real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetGameUI takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetScale takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameEditBlackBorders takes real p1,real p2 returns nothing
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
    
    function FrameGetCommandBarButton takes integer p1,integer p2 returns integer
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
    
    function FrameSetButtonCooldownModelSize takes integer p1,real p2 returns nothing
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
    
    function FrameSetAllPoints takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetTextHeight takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function CreateFrame takes string p1,integer p2,integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateSimpleFrame takes string p1,integer p2,integer p3 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function CreateFrameByTagName takes string p1,string p2,integer p3,string p4,integer p5 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetSize takes integer p1,real p2,real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function SetKeyboard takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetWidth takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function RegisterMessageEvent takes trigger p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameClearAllPoints takes integer p1 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetHeight takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetPoint takes integer p1,integer p2,integer p3,integer p4,real p5,real p6 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAbsolutePoint takes integer p1,integer p2,real p3,real p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameShow takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetEnable takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetFocus takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameGetModelSize takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    function FrameSetEditFocus takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetAlpha takes integer p1,integer p2 returns nothing
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
    
    function FrameSetText takes integer p1,string p2 returns nothing
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
    
    function FrameSetTextFont takes integer p1,string p2,real p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function GetWindowY takes nothing returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function FrameSetModelTexture takes integer p1,string p2,integer p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameCageMouse takes integer p1,boolean p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetLevel takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetParent takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameSetSimpleFrameParent takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    function FrameFindByName takes string p1,integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleFrameFindByName takes string p1,integer p2 returns integer
    	call GetTriggeringTrigger()
    	return 0
    endfunction
    
    function SimpleTextureFindByName takes string p1,integer p2 returns integer
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
    
    function SendMessage takes integer p1,integer p2,integer p3 returns nothing
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
    
    function SetMousePos takes real p1,real p2 returns nothing
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
		call EXPauseUnit(u , true)
	endfunction
    
    //单位删除眩晕
 function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u , false)
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
 function YDWEIsEventRangedDamage takes nothing returns boolean
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
        call EXSetItemDataString(ItemTypeId , Type , Value)
    endfunction
    //获取物品数据 (字符串) [JAPI] 1.图标 2.提示基础 3.提示扩展 4.名字 5.说明
    function YDWEGetItemDataString takes integer ItemTypeId,integer Type returns string
        return EXGetItemDataString(ItemTypeId , Type)
    endfunction
    function YDWEDisplayChat takes player p,integer chat_recipient,string message returns nothing
		call EXDisplayChat(p , chat_recipient , message)
	endfunction
     //技能属性 [JAPI]
 function YDWEGetUnitAbilityState takes unit u,integer abilcode,integer data_type returns real
		return EXGetAbilityState(EXGetUnitAbility(u , abilcode) , data_type)
	endfunction
	//技能数据 (整数) [JAPI]
 function YDWEGetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
		return EXGetAbilityDataInteger(EXGetUnitAbility(u , abilcode) , level , data_type)
	endfunction
	//技能数据 (实数) [JAPI]
 function YDWEGetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
		return EXGetAbilityDataReal(EXGetUnitAbility(u , abilcode) , level , data_type)
    endfunction
	//技能数据 (字符串) [JAPI]
 function YDWEGetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
		return EXGetAbilityDataString(EXGetUnitAbility(u , abilcode) , level , data_type)
	endfunction
	//设置技能属性 [JAPI]
 function YDWESetUnitAbilityState takes unit u,integer abilcode,integer data_type,real value returns nothing
        call EXSetAbilityState(EXGetUnitAbility(u , abilcode) , data_type , value)
    endfunction
	//设置技能数据 (整数) [JAPI]
 function YDWESetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns nothing
        call EXSetAbilityDataInteger(EXGetUnitAbility(u , abilcode) , level , data_type , value)
    endfunction
	//设置技能数据 (实数) [JAPI]
 function YDWESetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns nothing
        call EXSetAbilityDataReal(EXGetUnitAbility(u , abilcode) , level , data_type , value)
    endfunction
	//设置技能数据 (字符串) 
 function YDWESetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns nothing
        call EXSetAbilityDataString(EXGetUnitAbility(u , abilcode) , level , data_type , value)
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
    function EXSetEffectVisible takes effect u,boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return
    endfunction
    
    function EXSetEffectFogVisible takes effect u,boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return
    endfunction
    
    function EXSetEffectMaskVisible takes effect u,boolean is_visible returns nothing
        call GetTriggeringTrigger()
        return
    endfunction
    function ReleaseString takes string s returns nothing
        call GetTriggeringTrigger()
        return
    endfunction
    
    function ReleaseAllString takes nothing returns nothing
        call GetTriggeringTrigger()
        return
    endfunction
    
    function GetCacheStringCount takes nothing returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    function FrameSetViewPort takes integer frame,boolean enable returns nothing
        call GetTriggeringTrigger()
    endfunction
    
    //  修改窗口大小 可以强行限制用户 窗口模式下的 窗口比例 16/9
    function SetWindowSize takes integer w,integer h returns nothing
        call GetTriggeringTrigger()
    endfunction
    
    //  获取窗口是否全屏
    function IsWindowMode takes nothing returns boolean
        call GetTriggeringTrigger()
        return false
    endfunction
    
    function UnlockBlpSize takes boolean isunlock returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置特效颜色 1.特效 2.颜色代码 0xffffffff
    function EXSetEffectColor takes effect p1,integer p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置单位名字 每个单位独立 互相不影响 修改后 获取单位名字 还是返回原值
    function SetUnitName takes unit p1,string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置英雄称谓 每个单位独立 互相不影响 GetHeroProperName获取英雄称谓 是修改后的值。
    function SetUnitProperName takes unit p1,string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置 单位 鼠标指向UI跟血条 是否显示
    function SetUnitPressUIVisible takes unit u,boolean is_visible returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置动画
    function FrameSetAnimate takes integer p1,integer p2,boolean p3 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置动画进度 百分比
    function FrameSetAnimateOffset takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    //  同单位一样的 按照索引播放指定动画  
    function FrameSetAnimationByIndex takes integer p1,integer p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型路径
    function FrameSetModel takes integer p1,string p2,integer p3,integer p4 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型缩放倍率
    function FrameSetModelSize takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型与控件的偏移坐标
    function FrameSetModelXY takes integer p1,real p2,real p3 returns nothing
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
    function FrameSetModelSpeed takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    //  获取动画播放倍率
    function FrameGetModelSpeed takes integer p1 returns real
    	call GetTriggeringTrigger()
    	return 0.0
    endfunction
    
    //  设置模型旋转x轴
    function FrameSetModelRotateX takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    //  设置模型旋转y轴
    function FrameSetModelRotateY takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    
    //  设置模型旋转z轴
    function FrameSetModelRotateZ takes integer p1,real p2 returns nothing
    	call GetTriggeringTrigger()
    endfunction
    //  设置 忽略鼠标点击事件  默认是 true 填 false 可以 屏蔽鼠标点击
    function FrameSetIgnoreTrackEvents takes integer p1,boolean p2 returns nothing
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
    function FrameGetChilds takes integer frame,integer last returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    //  获取商店目标  /** 获取指定商店 选择 指定玩家的哪个单位 返回值是同步的接口 可以安全使用 */
    function GetStoreTarget takes unit store,player p returns unit
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
    function EXPlayEffectAnimation takes effect p1,string animation_name,string link_name returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  可以用来 缩放 单位/特效的 粒子2 的模型缩放 相当于是绿苹果里中间那3个缩放
    function SetPariticle2Size takes effect Handle,real scale returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  是用来缩放 ui模型上面的粒子2的
    function FrameSetModelPariticle2Size takes integer frame,real scale returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  是否接触屏幕限制
    function SetFrameLimitScreen takes boolean is_limit returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置单位移动类型
    function SetUnitMoveType takes unit u,string p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  修改单位碰撞体积大小
    function SetUnitCollisionSize takes unit u,real size returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  获取物品技能handle
    function GetItemAbility takes item Item,integer slot returns integer
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
    function FrameSetOriginButtonTexture takes integer button1,string path returns nothing
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
    function FrameSetSimpleParent takes integer SimpleFrame,integer parentSimple returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 为Simple绑定 frame类型的子控件
    // 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
    // 返回的是一个 SetupFrame值
    function FrameSimpleBindFrame takes integer SimpleFrame,integer Frame returns integer
        call GetTriggeringTrigger()
        return 0
    endfunction
    
    // 解除绑定 解除后 frame跟simple 就不再关联
    function FrameSimpleUnBindFrame takes integer SetupFrame returns nothing
        call GetTriggeringTrigger()
    endfunction
    // 设置模型在 场景内的坐标  跟镜头位置有关系 X
    function FrameSetModelX takes integer p1,real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    // 设置模型在 场景内的坐标  跟镜头位置有关系 Y
    function FrameSetModelY takes integer p1,real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    // 设置模型在 场景内的坐标  跟镜头位置有关系 Z
    function FrameSetModelZ takes integer p1,real p2 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置镜头位置
    function FrameSetModelCameraSource takes integer p1,real p2,real p3,real p4 returns nothing
        call GetTriggeringTrigger()
    endfunction
    //  设置镜头目标位置
    function FrameSetModelCameraTarget takes integer p1,real p2,real p3,real p4 returns nothing
        call GetTriggeringTrigger()
    endfunction
    function md5 takes string str returns string
        call GetTriggeringTrigger()
        return ""
    endfunction
    // 设置魔兽窗口在屏幕中的位置
    function SetWindowPos takes integer p1,real p2,real p3,integer p4,integer p5,integer p6 returns nothing
        call GetTriggeringTrigger()
    endfunction
    function DzIsUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns boolean
        return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16 + 19 * index)))) == attackType
    endfunction
    function DzSetUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns nothing
        call SetUnitState(whichUnit, ConvertUnitState(16 + 19 * index), GetHandleId(attackType))
    endfunction
    function DzIsUnitDefenseType takes unit whichUnit,integer defenseType returns boolean
        return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50))) == defenseType
    endfunction
    function DzSetUnitDefenseType takes unit whichUnit,integer defenseType returns nothing
        call SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType)
    endfunction
    function QOSetwuqi takes unit u,integer lx returns nothing
        call SetUnitState(u, ConvertUnitState(88), lx)
    endfunction
    function QOIswuqi takes unit u,integer lx returns boolean
        return GetUnitState(u, ConvertUnitState(88)) == lx
    endfunction
    
    //单位变身
    function YDWEUnitTransform takes unit u,integer abilcode,integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call YDWESetUnitAbilityDataInteger(u , abilcode , 1 , 117 , GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u , abilcode) , GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u , abilcode) , targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction
    function initializePlugin takes nothing returns integer
        call ExecuteFunc("DoNothing")
        call StartCampaignAI(Player(PLAYER_NEUTRAL_AGGRESSIVE), "callback")
        call ExecuteFunc("DoNothing")
        call AbilityId("exec-lua:plugin_main")
        return 0
    endfunction

//library japi ends
//library nzjapi:

    //private:
        function nzjapi___onInit takes nothing returns nothing
            call DzLoadToc("Ui\\textareaPath.toc")
            set nzjapi___moveType[0]=""
            set nzjapi___moveType[1]="foot"
            set nzjapi___moveType[2]="horse"
            set nzjapi___moveType[3]="fly"
            set nzjapi___moveType[4]="hover"
            set nzjapi___moveType[5]="float"
            set nzjapi___moveType[6]="amph"
        endfunction
    //public:
        function ConverUnitWorldPosition takes unit u returns nothing
            call GetTriggeringTrigger()
        endfunction
        function unit_overhead takes unit u returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function ConverRealWorldPosition takes real x,real y,real z returns nothing
            call GetTriggeringTrigger()
        endfunction
        function ConverRealPositionWorld takes real x,real y returns nothing
            call GetTriggeringTrigger()
        endfunction
        function GetScreenX takes nothing returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function GetScreenY takes nothing returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function GetScreenScale takes nothing returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function GetAbilityXY takes integer x,integer y returns integer
            call GetTriggeringTrigger()
            return 0
        endfunction
        function GetWorldX takes nothing returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function GetWorldY takes nothing returns real
            call GetTriggeringTrigger()
            return 0.0
        endfunction
        function BindEffect1 takes unit Handle,string socket,effect e returns nothing
            call GetTriggeringTrigger()
        endfunction
        function BindEffect2 takes item Handle,string socket,effect e returns nothing
            call GetTriggeringTrigger()
        endfunction
        function BindEffect3 takes effect Handle,string socket,effect e returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_HS_1600 takes nothing returns string
            return GetPluginVersion()
        endfunction
        function PO_HS_1601 takes nothing returns unit
            return GetRealSelectUnit()
        endfunction
        function PO_HS_1602 takes nothing returns unit
            return GetTargetObject()
        endfunction
        function PO_HS_1603 takes nothing returns integer
            return GetCacheModelCount()
        endfunction
        function PO_HS_1604 takes nothing returns boolean
            return IsWindowMode()
        endfunction
        function PO_HS_1605 takes nothing returns real
            return GetFps()
        endfunction
        function PO_HS_1606 takes nothing returns integer
            call GetTriggeringTrigger()
            return 0
        endfunction
        function PO_HS_1608 takes real x,real y,integer id returns real
            call ConverRealPositionWorld(x , 0.6 - y)
            set nzjapi___world[1]=GetWorldX()
            set nzjapi___world[2]=GetWorldY()
            return nzjapi___world[id]
        endfunction  //  获取父控件  /** 获取指定frame的父控件 不能对simple类型的控件使用 可以获取 大头像模型 的父控件 然后为其新建子控件 用来放置在所有界面之下 */
        function PO_HS_1609 takes integer p1 returns integer
            return FrameGetParent(p1)
        endfunction
        function PO_HS_1610 takes integer p1,integer p2 returns integer
            return FrameGetChilds(p1 , p2)
        endfunction
        function PO_HS_1611 takes unit p1,player p2 returns unit
            return GetStoreTarget(p1 , p2)
        endfunction
        function PO_HS_1612 takes integer x,integer y returns integer
            return GetAbilityXY(x , y)
        endfunction
        function PO_HS_1613 takes real x,real y,integer id returns real
            call MoveLocation(nzjapi___loc, x, y)
            call ConverRealWorldPosition(x , y , GetLocationZ(nzjapi___loc))
            set nzjapi___screen[1]=GetScreenX()
            set nzjapi___screen[2]=GetScreenY()
            return nzjapi___screen[id]
        endfunction  //  构建一个模型Frame
        function PO_HS_1614 takes integer frame returns integer
            return FrameAddModel(frame)
        endfunction
        function PO_HS_1615 takes nothing returns integer
            return GetUserId()
        endfunction
        function PO_HS_1616 takes nothing returns string
            return GetUserIdEx()
        endfunction
        function PO_HS_1617 takes item Item,integer slot returns integer
            return GetItemAbility(Item , slot)
        endfunction
        function PO_HS_1618 takes integer slot returns integer
            return FrameGetInfoSelectButton(slot)
        endfunction
        function PO_HS_1619 takes integer slot returns integer
            return FrameGetBuffButton(slot)
        endfunction
        function PO_HS_1620 takes nothing returns integer
            return FrameGetUnitButton()
        endfunction
        function PO_HS_1621 takes integer button1 returns integer
            return FrameGetButtonSimpleString(button1)
        endfunction
        function PO_HS_1622 takes integer button1 returns integer
            return FrameGetButtonSimpleFrame(button1)
        endfunction
        function PO_HS_1623 takes integer frame returns boolean
            return FrameIsShow(frame)
        endfunction
        function PO_HS_1624 takes integer button1 returns string
            return FrameGetOriginButtonTexture(button1)
        endfunction
        function PO_HS_1625 takes integer SimpleFrame returns integer
            return FrameGetSimpleParent(SimpleFrame)
        endfunction
        function PO_HS_1626 takes integer SimpleFrame,integer Frame returns integer
            return FrameSimpleBindFrame(SimpleFrame , Frame)
        endfunction
        function PO_HS_1627 takes unit u,integer id returns real
            call ConverUnitWorldPosition(u)
            set nzjapi___screen[1]=GetScreenX()
            set nzjapi___screen[2]=GetScreenY()
            return nzjapi___screen[id]
        endfunction  //动作
        function PO_DZ_1600 takes unit cs_1,string cs_2 returns nothing
            call SetUnitModel(cs_1 , cs_2)
        endfunction
        function PO_DZ_1601 takes unit cs_1,string cs_2 returns nothing
            call SetUnitPortrait(cs_1 , cs_2)
        endfunction
        function PO_DZ_1602 takes boolean cs_1 returns nothing
            call ShowFpsText(cs_1)
        endfunction
        function PO_DZ_1603 takes boolean cs_1 returns nothing
            call UnlockFps(cs_1)
        endfunction
        function PO_DZ_1604 takes nothing returns nothing
            call ReleaseAllModel()
        endfunction
        function PO_DZ_1605 takes unit cs_1,boolean cs_2 returns nothing
            call SetUnitPressUIVisible(cs_1 , cs_2)
        endfunction
        function PO_DZ_1606 takes effect cs_1,boolean cs_2 returns nothing
            call EXSetEffectVisible(cs_1 , cs_2)
        endfunction
        function PO_DZ_1607 takes effect cs_1,boolean cs_2 returns nothing
            call EXSetEffectFogVisible(cs_1 , cs_2)
        endfunction
        function PO_DZ_1608 takes effect cs_1,boolean cs_2 returns nothing
            call EXSetEffectMaskVisible(cs_1 , cs_2)
        endfunction
        function PO_DZ_1609 takes nothing returns nothing
            call ReleaseAllString()
        endfunction
        function PO_DZ_1610 takes integer cs_1,integer cs_2 returns nothing
            call SetWindowSize(cs_1 , cs_2)
        endfunction
        function PO_DZ_1610_1 takes real x,real y returns nothing
            call SetWindowPos(0 , x , y , 0 , 0 , 13)
        endfunction
        function PO_DZ_1611 takes integer cs_1,integer cs_2,unit cs_3,real cs_4,real cs_5,boolean cs_6 returns nothing
            call ConverUnitWorldPosition(cs_3)
            call DzFrameSetAbsolutePoint(cs_1, cs_2, GetScreenX() + cs_4, GetScreenY() + cs_5) //  是否继承缩放
            if ( cs_6 == false ) then
                call DzFrameSetScale(cs_1, GetScreenScale())
            endif
        endfunction  //  锁定解除blp像素限制
        function PO_DZ_1612 takes boolean cs_1 returns nothing
            call UnlockBlpSize(cs_1)
        endfunction
        function PO_DZ_1613 takes integer self,string modle,integer id returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1614 takes integer self,real x,real y,real z returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1615 takes integer self,real x,real y,real z returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1616 takes integer self,real x,real y,real z returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1617 takes effect p1,real red,real green,real blue returns nothing
            call EXSetEffectColor(p1 , 0xFF000000 + 0x10000 * PercentTo255(red) + 0x100 * PercentTo255(green) + PercentTo255(blue))
        endfunction  //  获取当前技能面板的X,Y位置的技能id
        function PO_DZ_1618 takes real x,real y returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1619 takes integer self,integer ID returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1620 takes integer self,integer ID returns nothing
            call FrameSetAnimationByIndex(self , ID)
        endfunction
        function PO_DZ_1621 takes integer p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1622 takes integer p1,real p2,real p3,real p4 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function set_rotate_x takes integer p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function set_rotate_y takes integer p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function set_rotate_z takes integer p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1623 takes integer p1,integer p2,real p3 returns nothing
            if ( p2 == 1 ) then
                call set_rotate_x(p1 , - LoadReal(nzjapi___ht, p1, StringHash("rotatex")))
                call set_rotate_x(p1 , p3)
                call SaveReal(nzjapi___ht, p1, StringHash("rotatex"), p3)
            elseif ( p2 == 2 ) then
                call set_rotate_y(p1 , - LoadReal(nzjapi___ht, p1, StringHash("rotatey")))
                call set_rotate_y(p1 , p3)
                call SaveReal(nzjapi___ht, p1, StringHash("rotatey"), p3)
            else
                call set_rotate_z(p1 , - LoadReal(nzjapi___ht, p1, StringHash("rotatez")))
                call set_rotate_z(p1 , p3)
                call SaveReal(nzjapi___ht, p1, StringHash("rotatez"), p3)
            endif
        endfunction  //  设置动画播放倍率
        function PO_DZ_1624 takes integer p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1625 takes integer p1,real p2,real p3 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1626 takes item u,boolean is_visible returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_DZ_1627 takes integer p1,boolean p2 returns nothing
            call FrameSetIgnoreTrackEvents(p1 , p2)
        endfunction
        function PO_DZ_1628 takes integer p1,boolean p2 returns nothing
            call FrameSetViewPort(p1 , p2)
        endfunction
        function PO_DZ_1629 takes unit Handle,string socket,effect e returns nothing
            call BindEffect1(Handle , socket , e)
        endfunction
        function PO_DZ_1630 takes item Handle,string socket,effect e returns nothing
            call BindEffect2(Handle , socket , e)
        endfunction
        function PO_DZ_1631 takes effect Handle,string socket,effect e returns nothing
            call BindEffect3(Handle , socket , e)
        endfunction
        function PO_DZ_1632 takes effect e returns nothing
            call UnBindEffect(e)
        endfunction
        function PO_DZ_1633 takes effect e,string animation_name returns nothing
            call EXPlayEffectAnimation(e , animation_name , "")
        endfunction
        function PO_DZ_1634 takes effect Handle,real scale returns nothing
            call SetPariticle2Size(Handle , scale)
        endfunction
        function PO_DZ_1635 takes integer Handle,real scale returns nothing
            call FrameSetModelPariticle2Size(Handle , scale)
        endfunction
        function PO_DZ_1636 takes boolean is_limit returns nothing
            call SetFrameLimitScreen(is_limit)
        endfunction
        function PO_DZ_1637 takes unit u,integer p2 returns nothing
            call SetUnitMoveType(u , nzjapi___moveType[p2])
        endfunction
        function PO_DZ_1638 takes unit u,real size returns nothing
            call SetUnitCollisionSize(u , size)
        endfunction
        function PO_DZ_1639 takes integer button1,string path returns nothing
            call FrameSetOriginButtonTexture(button1 , path)
        endfunction
        function PO_DZ_1640 takes integer SetupFrame returns nothing
            call FrameSimpleUnBindFrame(SetupFrame)
        endfunction
        function PO_HS_1641 takes integer SimpleFrame,integer parentSimple returns nothing
            call FrameSetSimpleParent(SimpleFrame , parentSimple)
        endfunction
        function pp_stimer_main takes nothing returns boolean
            call GetTriggeringTrigger()
            return false
        endfunction
        function pp_stimer_create takes real timeout,boolean periodic,code func returns timer
            call GetTriggeringTrigger()
            return null
        endfunction
        function pp_stimer_remove takes nothing returns boolean
            call GetTriggeringTrigger()
            return false
        endfunction
        function pp_stimer_Handle takes nothing returns timer
            call GetTriggeringTrigger()
            return null
        endfunction
        function pp_life_Refresh takes nothing returns boolean
            call GetTriggeringTrigger()
            return false
        endfunction
        function pp_life_create takes unit u,real p1,real p2,real p3,integer p4 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function pp_life_delete takes unit u returns nothing
            call GetTriggeringTrigger()
        endfunction
        function pp_life_setBorders takes real p1,real p2 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function pp_life_setHDbar takes unit u,real p1 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function pp_life_setBTbar takes unit u,real p1 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function pp_life_setJBbar takes unit u,boolean p1 returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_ClearNotes takes nothing returns integer
            call GetTriggeringTrigger()
            return 0
        endfunction
        function Sort0 takes integer id returns nothing
            call GetTriggeringTrigger()
        endfunction
        function Sort1 takes integer id,integer index,real value returns nothing
            call GetTriggeringTrigger()
        endfunction
        function Sort2 takes integer id,boolean bool returns nothing
            call GetTriggeringTrigger()
        endfunction
        function Sort3 takes integer id,integer int returns integer
            call GetTriggeringTrigger()
            return 0
        endfunction
        function Sort4 takes integer id,integer int returns real
            call GetTriggeringTrigger()
            return 0
        endfunction
        function Sort5 takes integer id returns nothing
            call GetTriggeringTrigger()
        endfunction
        function Sort6 takes integer id returns nothing
            call GetTriggeringTrigger()
        endfunction
        function MsgUrl takes string msg returns nothing
            call GetTriggeringTrigger()
        endfunction
        function PO_SetModel takes integer p1,string p2 returns nothing
            call FrameSetModel2(p1 , p2 , 0)
            call FrameSetModelX(p1 , 0)
            call FrameSetModelY(p1 , 0)
            call FrameSetModelZ(p1 , - 100)
            call FrameSetModelCameraSource(p1 , 200 , 0 , - 20)
            call FrameSetModelCameraTarget(p1 , 0 , 0 , - 40)
        endfunction  // 一键调整UI模型位置
        function PO_SetModellocation takes integer p1,real x1,real y1,real x2,real y2,real z2,real x3,real y3,real z3 returns nothing
            call FrameSetModelXY(p1 , x1 , y2)
            call FrameSetModelRotateX(p1 , x2)
            call FrameSetModelRotateY(p1 , y2)
            call FrameSetModelRotateZ(p1 , z2)
            call FrameSetModelX(p1 , x3)
            call FrameSetModelY(p1 , y3)
            call FrameSetModelZ(p1 , z3)
        endfunction  // 窗口居中（16:9）
        function CenterWindow takes nothing returns integer
            call GetTriggeringTrigger()
            return 0
        endfunction
        function Removeborders takes boolean bool returns nothing
            call GetTriggeringTrigger()
        endfunction

//library nzjapi ends
//library Other:

        //private:
            function s__japi_onInit takes nothing returns nothing
                set s__japi_AbilityDataInteger[1]=104 //  魔法消耗 //  单位类型
                set s__japi_AbilityDataInteger[2]=117 //  热键
                set s__japi_AbilityDataInteger[3]=200 //  关闭热键
                set s__japi_AbilityDataInteger[4]=201 //  学习热键
                set s__japi_AbilityDataInteger[5]=202
                set s__japi_AbilityDataReal[1]=101 //  单位技能实数数据类型 //  施放时间 //  持续时间(普通)
                set s__japi_AbilityDataReal[2]=102 //  持续时间(英雄)
                set s__japi_AbilityDataReal[3]=103 //  施放间隔
                set s__japi_AbilityDataReal[4]=105 //  影响区域
                set s__japi_AbilityDataReal[5]=106 //  施法距离
                set s__japi_AbilityDataReal[6]=107 //  数据A
                set s__japi_AbilityDataReal[7]=108 //  数据B
                set s__japi_AbilityDataReal[8]=109 //  数据C
                set s__japi_AbilityDataReal[9]=110 //  数据D
                set s__japi_AbilityDataReal[10]=111 //  数据E
                set s__japi_AbilityDataReal[11]=112 //  数据F
                set s__japi_AbilityDataReal[12]=113 //  数据G
                set s__japi_AbilityDataReal[13]=114 //  数据H
                set s__japi_AbilityDataReal[14]=115 //  数据I
                set s__japi_AbilityDataReal[15]=116
                set s__japi_AbilityDataString[1]=203 //  单位技能字符串数据类型 //  名字 //  图标
                set s__japi_AbilityDataString[2]=204 //  目标效果
                set s__japi_AbilityDataString[3]=205 //  施法者效果
                set s__japi_AbilityDataString[4]=206 //  目标点效果
                set s__japi_AbilityDataString[5]=207 //  区域效果
                set s__japi_AbilityDataString[6]=208 //  投射物
                set s__japi_AbilityDataString[7]=209 //  特殊效果
                set s__japi_AbilityDataString[8]=210 //  闪电效果
                set s__japi_AbilityDataString[9]=211 //  buff提示
                set s__japi_AbilityDataString[10]=212 //  buff提示(扩展)
                set s__japi_AbilityDataString[11]=213 //  学习提示
                set s__japi_AbilityDataString[12]=214 //  提示
                set s__japi_AbilityDataString[13]=215 //  关闭提示
                set s__japi_AbilityDataString[14]=216 //  学习提示(扩展)
                set s__japi_AbilityDataString[15]=217 //  提示(扩展)
                set s__japi_AbilityDataString[16]=218 //  关闭提示(扩展)
                set s__japi_AbilityDataString[17]=219
                set s__japi_ItemDataString[1]=1 //  物品字符串数据类型 // 图标 // 提示(基础)
                set s__japi_ItemDataString[4]=2 // 提示(扩展)
                set s__japi_ItemDataString[5]=3 // 名字
                set s__japi_ItemDataString[2]=4 // 说明
                set s__japi_ItemDataString[3]=5
                set s__japi_GetDamageType[1]=DAMAGE_TYPE_UNKNOWN //  伤害类型 // 未知 // 普通
                set s__japi_GetDamageType[2]=DAMAGE_TYPE_NORMAL // 强化
                set s__japi_GetDamageType[3]=DAMAGE_TYPE_ENHANCED // 火焰
                set s__japi_GetDamageType[4]=DAMAGE_TYPE_FIRE // 冰冻
                set s__japi_GetDamageType[5]=DAMAGE_TYPE_COLD // 闪电
                set s__japi_GetDamageType[6]=DAMAGE_TYPE_LIGHTNING // 毒药
                set s__japi_GetDamageType[7]=DAMAGE_TYPE_POISON // 疾病
                set s__japi_GetDamageType[8]=DAMAGE_TYPE_DISEASE // 神圣
                set s__japi_GetDamageType[9]=DAMAGE_TYPE_DIVINE // 魔法
                set s__japi_GetDamageType[10]=DAMAGE_TYPE_MAGIC // 音速
                set s__japi_GetDamageType[11]=DAMAGE_TYPE_SONIC // 酸性
                set s__japi_GetDamageType[12]=DAMAGE_TYPE_ACID // 力量
                set s__japi_GetDamageType[13]=DAMAGE_TYPE_FORCE // 死亡
                set s__japi_GetDamageType[14]=DAMAGE_TYPE_DEATH // 精神
                set s__japi_GetDamageType[15]=DAMAGE_TYPE_MIND // 植物
                set s__japi_GetDamageType[16]=DAMAGE_TYPE_PLANT // 防御
                set s__japi_GetDamageType[17]=DAMAGE_TYPE_DEFENSIVE // 破坏
                set s__japi_GetDamageType[18]=DAMAGE_TYPE_DEMOLITION // 慢性毒药
                set s__japi_GetDamageType[19]=DAMAGE_TYPE_SLOW_POISON // 灵魂锁链
                set s__japi_GetDamageType[20]=DAMAGE_TYPE_SPIRIT_LINK // 暗影突袭
                set s__japi_GetDamageType[21]=DAMAGE_TYPE_SHADOW_STRIKE // 通用
                set s__japi_GetDamageType[22]=DAMAGE_TYPE_UNIVERSAL
                set s__japi_GetWeaponType[1]=WEAPON_TYPE_WHOKNOWS //  武器类型 // 无 // 金属轻砍
                set s__japi_GetWeaponType[2]=WEAPON_TYPE_METAL_LIGHT_CHOP // 金属中砍
                set s__japi_GetWeaponType[3]=WEAPON_TYPE_METAL_MEDIUM_CHOP // 金属重砍
                set s__japi_GetWeaponType[4]=WEAPON_TYPE_METAL_HEAVY_CHOP // 金属轻切
                set s__japi_GetWeaponType[5]=WEAPON_TYPE_METAL_LIGHT_SLICE // 金属中切
                set s__japi_GetWeaponType[6]=WEAPON_TYPE_METAL_MEDIUM_SLICE // 金属重切
                set s__japi_GetWeaponType[7]=WEAPON_TYPE_METAL_HEAVY_SLICE // 金属中击
                set s__japi_GetWeaponType[8]=WEAPON_TYPE_METAL_MEDIUM_BASH // 金属重击
                set s__japi_GetWeaponType[9]=WEAPON_TYPE_METAL_HEAVY_BASH // 木头轻击
                set s__japi_GetWeaponType[10]=WEAPON_TYPE_WOOD_LIGHT_BASH // 木头中击
                set s__japi_GetWeaponType[11]=WEAPON_TYPE_WOOD_MEDIUM_BASH // 木头重击
                set s__japi_GetWeaponType[12]=WEAPON_TYPE_WOOD_HEAVY_BASH // 斧头中砍
                set s__japi_GetWeaponType[13]=WEAPON_TYPE_AXE_MEDIUM_CHOP // 岩石重击
                set s__japi_GetWeaponType[14]=WEAPON_TYPE_ROCK_HEAVY_BASH
                set s__japi_GetAttackType[1]=ATTACK_TYPE_NORMAL //  攻击类型 // 法术 // 普通
                set s__japi_GetAttackType[2]=ATTACK_TYPE_MELEE // 穿刺
                set s__japi_GetAttackType[3]=ATTACK_TYPE_PIERCE // 攻城
                set s__japi_GetAttackType[4]=ATTACK_TYPE_SIEGE // 魔法
                set s__japi_GetAttackType[5]=ATTACK_TYPE_MAGIC // 混乱
                set s__japi_GetAttackType[6]=ATTACK_TYPE_CHAOS // 英雄
                set s__japi_GetAttackType[7]=ATTACK_TYPE_HERO
                set s__japi_CollisionType[1]=1 //  碰撞类型 //  单位 //  建筑
                set s__japi_CollisionType[2]=3
                set s__japi_MoveType[1]=0x00 //  移动类型 // 没有 // 无法移动
                set s__japi_MoveType[2]=0x01 // 步行
                set s__japi_MoveType[3]=0x02 // 飞行
                set s__japi_MoveType[4]=0x04 // 地雷
                set s__japi_MoveType[5]=0x08 // 疾风步
                set s__japi_MoveType[6]=0x10 // 未知
                set s__japi_MoveType[7]=0x20 // 漂浮(水)
                set s__japi_MoveType[8]=0x40 // 两栖
                set s__japi_MoveType[9]=0x80
            endfunction
        //public:
            function s__japi_GetAbilityState takes unit u,integer abilcode returns real
                return EXGetAbilityState(EXGetUnitAbility(u , abilcode) , 1)
            endfunction  //  获取单位技能数据(整数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型)
            function s__japi_GetAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
                return EXGetAbilityDataInteger(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataInteger[data_type])
            endfunction  //  获取单位技能数据(实数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型)
            function s__japi_GetAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
                return EXGetAbilityDataReal(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataReal[data_type])
            endfunction
            function s__japi_GetAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
                return EXGetAbilityDataString(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataString[data_type])
            endfunction  //  设置单位技能冷却时间(u:单位  abilcode:技能  value:数值)
            function s__japi_SetAbilityState takes unit u,integer abilcode,real value returns boolean
                return EXSetAbilityState(EXGetUnitAbility(u , abilcode) , 1 , value)
            endfunction  //  设置单位技能数据(整数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型  value:数值)
            function s__japi_SetAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns boolean
                return EXSetAbilityDataInteger(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataInteger[data_type] , value)
            endfunction  //  设置单位技能数据(实数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型  value:数值)
            function s__japi_SetAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns boolean
                return EXSetAbilityDataReal(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataReal[data_type] , value)
            endfunction
            function s__japi_SetAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns boolean
                return EXSetAbilityDataString(EXGetUnitAbility(u , abilcode) , level , s__japi_AbilityDataString[data_type] , value)
            endfunction  //  获取物品或单位数据(字符串)(itemcode:物品类型或单位类型  data_type:数据类型)
            function s__japi_GetItemDataString takes integer itemcode,integer data_type returns string
                return EXGetItemDataString(itemcode , s__japi_ItemDataString[data_type])
            endfunction
            function s__japi_SetItemDataString takes integer itemcode,integer data_type,string value returns boolean
                return EXSetItemDataString(itemcode , s__japi_ItemDataString[data_type] , value)
            endfunction  //1.  单位受到的伤害类型(edd_type:数据类型)
            function s__japi_GetEventDamageData takes integer edd_type returns boolean
                return 0 != EXGetEventDamageData(edd_type)
            endfunction  //  单位所受伤害的伤害类型(damageType:伤害类型)
            function s__japi_IsEventDamageType takes integer damageType returns boolean
                return s__japi_GetDamageType[damageType] == ConvertDamageType(EXGetEventDamageData(4))
            endfunction  //  伤害类型    [1.未知  2.普通  3.强化  4.火焰  5.冰冻  6.闪电  7.毒药  8.疾病  9.神圣  10.魔法  11.音速  12.酸性  13.力量  14.死亡  15.精神  16.植物  17.防御  18.破坏  19.慢性毒药  20.灵魂锁链  21.暗影突袭  22.通用]
            function s__japi_EventDamageType takes integer damageType returns damagetype
                return s__japi_GetDamageType[damageType]
            endfunction  //  单位所受伤害的武器类型(weaponType:武器类型)
            function s__japi_IsEventWeaponType takes integer weaponType returns boolean
                return s__japi_GetWeaponType[weaponType] == ConvertWeaponType(EXGetEventDamageData(5))
            endfunction  //  武器类型    [1.无  2.金属轻砍  3.金属中砍  4.金属重砍  5.金属轻切  6.金属中切  7.金属重切  8.金属中击  9.金属重击  10.木头轻击  11.木头中击  12.木头重击  13.斧头中砍  14.岩石重击]
            function s__japi_EventWeaponType takes integer weaponType returns weapontype
                return s__japi_GetWeaponType[weaponType]
            endfunction  //  单位所受伤害的攻击类型(attackType:攻击类型)
            function s__japi_IsEventAttackType takes integer attackType returns boolean
                return s__japi_GetAttackType[attackType] == ConvertAttackType(EXGetEventDamageData(6))
            endfunction  //  攻击类型    [1.法术  2.普通  3.穿刺  4.攻城  5.魔法  6.混乱  7.英雄]
            function s__japi_EventAttackType takes integer attackType returns attacktype
                return s__japi_GetAttackType[attackType]
            endfunction  //  获取伤害值
            function s__japi_getEventDamage takes nothing returns real
                return GetEventDamage()
            endfunction
            function s__japi_SetEventDamage takes real amount returns nothing
                call EXSetEventDamage(amount)
            endfunction  //  获取特效X坐标
            function s__japi_GetEffectX takes effect e returns real
                return EXGetEffectX(e)
            endfunction  //  获取特效Y坐标
            function s__japi_GetEffectY takes effect e returns real
                return EXGetEffectY(e)
            endfunction  //  获取特效高度
            function s__japi_GetEffectZ takes effect e returns real
                return EXGetEffectZ(e)
            endfunction  //  移动特效到坐标
            function s__japi_SetEffectXY takes effect e,real x,real y returns nothing
                call EXSetEffectXY(e , x , y)
            endfunction  //  移动特效到高度
            function s__japi_SetEffectZ takes effect e,real z returns nothing
                call EXSetEffectZ(e , z)
            endfunction  //  获取特效大小
            function s__japi_GetEffectSiz takes effect e returns real
                return EXGetEffectSize(e)
            endfunction  //  设置特效大小
            function s__japi_SetEffectSize takes effect e,real size returns nothing
                call EXSetEffectSize(e , size)
            endfunction  //  设置特效绕X轴旋转
            function s__japi_EffectMatRotateX takes effect e,real angle returns nothing
                call EXEffectMatRotateX(e , angle)
            endfunction  //  设置特效绕Y轴旋转
            function s__japi_EffectMatRotateY takes effect e,real angle returns nothing
                call EXEffectMatRotateY(e , angle)
            endfunction  //  设置特效绕Z轴旋转
            function s__japi_EffectMatRotateZ takes effect e,real angle returns nothing
                call EXEffectMatRotateZ(e , angle)
            endfunction  //  设置特效缩放
            function s__japi_EffectMatScale takes effect e,real x,real y,real z returns nothing
                call EXEffectMatScale(e , x , y , z)
            endfunction  //  重置特效变换
            function s__japi_EffectMatReset takes effect e returns nothing
                call EXEffectMatReset(e)
            endfunction
            function s__japi_SetEffectSpeed takes effect e,real speed returns nothing
                call EXSetEffectSpeed(e , speed)
            endfunction  //  设置单位面向角度
            function s__japi_SetUnitFacing takes unit u,real angle returns nothing
                call EXSetUnitFacing(u , angle)
            endfunction  //  设置单位的碰撞类型(enable:开关  u:碰撞单位  t:碰撞类型)
            function s__japi_SetUnitCollisionType takes boolean enable,unit u,integer t returns nothing
                call EXSetUnitCollisionType(enable , u , s__japi_CollisionType[t])
            endfunction  //  设置单位的移动类型(u:单位  t:移动类型)
            function s__japi_SetUnitMoveType takes unit u,integer t returns nothing
                call EXSetUnitMoveType(u , s__japi_MoveType[t])
            endfunction
    //private:
        function Other___onInit takes nothing returns nothing
            local integer i
            set Other___HexMap[0]="0"
            set Other___HexMap[1]="1"
            set Other___HexMap[2]="2"
            set Other___HexMap[3]="3"
            set Other___HexMap[4]="4"
            set Other___HexMap[5]="5"
            set Other___HexMap[6]="6"
            set Other___HexMap[7]="7"
            set Other___HexMap[8]="8"
            set Other___HexMap[9]="9"
            set Other___HexMap[10]="a"
            set Other___HexMap[11]="b"
            set Other___HexMap[12]="c"
            set Other___HexMap[13]="d"
            set Other___HexMap[14]="e"
            set Other___HexMap[15]="f"
            set Other___HexMap[16]="g"
            set Other___HexMap[17]="h"
            set Other___HexMap[18]="i"
            set Other___HexMap[19]="j"
            set Other___HexMap[20]="k"
            set Other___HexMap[21]="l"
            set Other___HexMap[22]="m"
            set Other___HexMap[23]="n"
            set Other___HexMap[24]="o"
            set Other___HexMap[25]="p"
            set Other___HexMap[26]="q"
            set Other___HexMap[27]="r"
            set Other___HexMap[28]="s"
            set Other___HexMap[29]="t"
            set Other___HexMap[30]="u"
            set Other___HexMap[31]="v"
            set Other___HexMap[32]="w"
            set Other___HexMap[33]="x"
            set Other___HexMap[34]="y"
            set Other___HexMap[35]="z"
            set Other___HexMap[36]="A"
            set Other___HexMap[37]="B"
            set Other___HexMap[38]="C"
            set Other___HexMap[39]="D"
            set Other___HexMap[40]="E"
            set Other___HexMap[41]="F"
            set Other___HexMap[42]="G"
            set Other___HexMap[43]="H"
            set Other___HexMap[44]="I"
            set Other___HexMap[45]="J"
            set Other___HexMap[46]="K"
            set Other___HexMap[47]="L"
            set Other___HexMap[48]="M"
            set Other___HexMap[49]="N"
            set Other___HexMap[50]="O"
            set Other___HexMap[51]="P"
            set Other___HexMap[52]="Q"
            set Other___HexMap[53]="R"
            set Other___HexMap[54]="S"
            set Other___HexMap[55]="T"
            set Other___HexMap[56]="U"
            set Other___HexMap[57]="V"
            set Other___HexMap[58]="W"
            set Other___HexMap[59]="X"
            set Other___HexMap[60]="Y"
            set Other___HexMap[61]="Z"
            set i=0
            loop
            exitwhen ( i >= 36 )
                call SaveInteger(Other___ht, StringHash("36进制"), StringHash(Other___HexMap[i]), i)
            set i=i + 1
            endloop
            set i=0
            loop
            exitwhen ( i >= 62 )
                call SaveInteger(Other___ht, StringHash("62进制"), StringHash(Other___HexMap[i]), i)
            set i=i + 1
            endloop
            set i=( 0 ) + 1
            loop
            exitwhen ( i >= 33 )
                set Other___I2ASCII[i]=" "
            set i=i + 1
            endloop
            set Other___I2ASCII[33]="!"
            set Other___I2ASCII[34]=" "
            set Other___I2ASCII[35]="#"
            set Other___I2ASCII[36]="$"
            set Other___I2ASCII[37]="%"
            set Other___I2ASCII[38]="&"
            set Other___I2ASCII[39]="'"
            set Other___I2ASCII[40]="("
            set Other___I2ASCII[41]=")"
            set Other___I2ASCII[42]="*"
            set Other___I2ASCII[43]="+"
            set Other___I2ASCII[44]=","
            set Other___I2ASCII[45]="-"
            set Other___I2ASCII[46]="."
            set Other___I2ASCII[47]="/"
            set Other___I2ASCII[48]="0"
            set Other___I2ASCII[49]="1"
            set Other___I2ASCII[50]="2"
            set Other___I2ASCII[51]="3"
            set Other___I2ASCII[52]="4"
            set Other___I2ASCII[53]="5"
            set Other___I2ASCII[54]="6"
            set Other___I2ASCII[55]="7"
            set Other___I2ASCII[56]="8"
            set Other___I2ASCII[57]="9"
            set Other___I2ASCII[58]=":"
            set Other___I2ASCII[59]=";"
            set Other___I2ASCII[60]="<"
            set Other___I2ASCII[61]="="
            set Other___I2ASCII[62]=">"
            set Other___I2ASCII[63]="?"
            set Other___I2ASCII[64]="@"
            set Other___I2ASCII[65]="A"
            set Other___I2ASCII[66]="B"
            set Other___I2ASCII[67]="C"
            set Other___I2ASCII[68]="D"
            set Other___I2ASCII[69]="E"
            set Other___I2ASCII[70]="F"
            set Other___I2ASCII[71]="G"
            set Other___I2ASCII[72]="H"
            set Other___I2ASCII[73]="I"
            set Other___I2ASCII[74]="J"
            set Other___I2ASCII[75]="K"
            set Other___I2ASCII[76]="L"
            set Other___I2ASCII[77]="M"
            set Other___I2ASCII[78]="N"
            set Other___I2ASCII[79]="O"
            set Other___I2ASCII[80]="P"
            set Other___I2ASCII[81]="Q"
            set Other___I2ASCII[82]="R"
            set Other___I2ASCII[83]="S"
            set Other___I2ASCII[84]="T"
            set Other___I2ASCII[85]="U"
            set Other___I2ASCII[86]="V"
            set Other___I2ASCII[87]="W"
            set Other___I2ASCII[88]="X"
            set Other___I2ASCII[89]="Y"
            set Other___I2ASCII[90]="Z"
            set Other___I2ASCII[91]="["
            set Other___I2ASCII[92]=" "
            set Other___I2ASCII[93]="]"
            set Other___I2ASCII[94]="^"
            set Other___I2ASCII[95]="_"
            set Other___I2ASCII[96]="`"
            set Other___I2ASCII[97]="a"
            set Other___I2ASCII[98]="b"
            set Other___I2ASCII[99]="c"
            set Other___I2ASCII[100]="d"
            set Other___I2ASCII[101]="e"
            set Other___I2ASCII[102]="f"
            set Other___I2ASCII[103]="g"
            set Other___I2ASCII[104]="h"
            set Other___I2ASCII[105]="i"
            set Other___I2ASCII[106]="j"
            set Other___I2ASCII[107]="k"
            set Other___I2ASCII[108]="l"
            set Other___I2ASCII[109]="m"
            set Other___I2ASCII[110]="n"
            set Other___I2ASCII[111]="o"
            set Other___I2ASCII[112]="p"
            set Other___I2ASCII[113]="q"
            set Other___I2ASCII[114]="r"
            set Other___I2ASCII[115]="s"
            set Other___I2ASCII[116]="t"
            set Other___I2ASCII[117]="u"
            set Other___I2ASCII[118]="v"
            set Other___I2ASCII[119]="w"
            set Other___I2ASCII[120]="x"
            set Other___I2ASCII[121]="y"
            set Other___I2ASCII[122]="z"
            set Other___I2ASCII[123]="{"
            set Other___I2ASCII[124]="|"
            set Other___I2ASCII[125]="}"
            set Other___I2ASCII[126]="~"
            set i=( 126 ) + 1
            loop
            exitwhen ( i >= 255 )
                set Other___I2ASCII[i]=" "
            set i=i + 1
            endloop
            set i=( 0 ) + 1
            loop
            exitwhen ( i >= 255 )
                call SaveInteger(Other___ht, StringHash("ASCII"), StringHash(Other___I2ASCII[i]), i)
            set i=i + 1
            endloop
            set Other___suffixes[1]=""
            set Other___suffixes[2]="万"
            set Other___suffixes[3]="亿"
            set Other___suffixes[4]="兆"
            set Other___suffixes[5]="京"
            set Other___suffixes[6]="垓"
            set Other___suffixes[7]="秭"
            set Other___suffixes[8]="穰"
            set Other___suffixes[9]="沟"
            set Other___suffixes[10]="涧"
            set Other___suffixes[11]="正"
            set Other___suffixes[12]="载"
            set Other___suffixes[13]="极"
            set Other___suffixes[14]="恒河沙"
            set Other___pFind=Rect(0., 0., 128., 128.)
            set Other___pItem=CreateItem('wolg', 0, 0)
            call SetItemVisible(Other___pItem, false)
            set Other___Majia=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'e000', 0, 0, 0)
        endfunction  //  获取通魔技能的数据--目标类型
        function Other___DataB takes integer jn returns integer
            return S2I(EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S(jn) + ", 'DataB1')"))
        endfunction  //  获取通魔技能的数据--基础命令ID
        function Other___DataF takes integer jn returns string
            return ( EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S(jn) + ", 'DataF1')") )
        endfunction  //  获取常规技能的数据--命令串
        function Other___Order takes integer jn returns string
            return ( EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S(jn) + ", 'Order')") )
        endfunction  //  单位组直线选取
        function Other___PO_SelectInLineUnitsCondition takes unit u,real x,real y,real angle,real width returns boolean
            local real x1=GetUnitX(u) - x
            local real y1=GetUnitY(u) - y
            return ( TanBJ(angle) * x1 - y1 ) * ( TanBJ(angle) * x1 - y1 ) - width / CosBJ(angle) * 0.5 * width / CosBJ(angle) * 0.5 <= 0
        endfunction
    //public:
        function Cast_Spell_C takes unit u returns integer
            set Other___Speel_U=u
            return 3
        endfunction  //  坐标目标类型
        function Cast_Spell_B takes real x,real y returns integer
            set Other___Speel_X=x
            set Other___Speel_Y=y
            return 2
        endfunction  //  无目标类型
        function Cast_Spell_A takes nothing returns integer
            return 1
        endfunction  //  命令单位施放技能
        function Cast_Spell takes unit u,integer jn,integer z returns nothing
            local string str=(( EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S((jn)) + ", 'Order')") )) // INLINED!!
            if ( str == "channel" ) then
                set str=(( EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S((jn)) + ", 'DataF1')") )) // INLINED!!
            endif
            if ( z == 1 ) then
                call IssueImmediateOrder(u, str)
            elseif ( z == 2 ) then
                call IssuePointOrder(u, str, Other___Speel_X, Other___Speel_Y)
            else
                call IssueTargetOrder(u, str, Other___Speel_U)
            endif
        endfunction  //  判断通魔技能的目标类型
        function Judge_Spell takes integer jn,integer i returns boolean
            if ( (S2I(EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S((jn)) + ", 'DataB1')"))) == i and (( EXExecuteScript("(require'YDWEXweiObjectSlk').ability(" + I2S((jn)) + ", 'Order')") )) == "channel" ) then // INLINED!!
                return true
            else
                return false
            endif
        endfunction  //  实数 - 坐标X位移
        function PO_MobileX takes real X,real Dist,real Angle returns real
            return X + Dist * Cos(Angle * bj_DEGTORAD)
        endfunction  //  实数 - 坐标Y位移
        function PO_MobileY takes real Y,real Dist,real Angle returns real
            return Y + Dist * Sin(Angle * bj_DEGTORAD)
        endfunction  //  角度 - 坐标到坐标的角度
        function PO_DegXY takes real x,real y,real x1,real y1 returns real
            return Atan2(y1 - y, x1 - x) * bj_RADTODEG
        endfunction  //  实数 - 坐标到坐标的距离
        function PO_DisXY takes real x,real y,real x1,real y1 returns real
            return SquareRoot(Pow(x - x1, 2.00) + Pow(y - y1, 2.00))
        endfunction  //  实数 - 获取坐标高度
        function PO_PosH takes real x,real y returns real
            call MoveLocation(Other___Loc, x, y)
            return GetLocationZ(Other___Loc)
        endfunction  //  实数转字符串(去小数点)
        function PO_R2S takes real s returns string
            return I2S(R2I(s))
        endfunction  //  玩家单位的ID
        function PO_PlayUnitId takes unit u returns integer
            return GetConvertedPlayerId(GetOwningPlayer(u))
        endfunction  //  实数取整转整数
        function PO_miR2I takes real r returns integer
            return R2I(r + 0.501)
        endfunction
        function PO_miR2S takes real r returns string
            return I2S((R2I(((r)*1.0) + 0.501))) // INLINED!!
        endfunction
        function PO_miR2R takes real r returns real
            return I2R((R2I(((r)*1.0) + 0.501))) // INLINED!!
        endfunction
        function PO_miR2SP takes real r returns string
            return I2S(R2I(r * 100 + 0.501))
        endfunction
        function PO_miR2SP1 takes real r returns string
            return R2SW(r * 100, 1, 1)
        endfunction
        function PO_gsub takes string str,string pattern,string value,integer count returns string
            local string Code=""
            if ( count < 1 ) then
                set Code=EXExecuteScript("string.gsub('" + str + "', '" + pattern + "', '" + value + "')")
            else
                set Code=EXExecuteScript("string.gsub('" + str + "', '" + pattern + "', '" + value + "', " + I2S(count) + ")")
            endif
            return Code
        endfunction  //  设置单位X、Y坐标
        function PO_SetUnitXY takes unit whichUnit,real newX,real newY returns nothing
            call SetUnitX(whichUnit, (RMinBJ(RMaxBJ(((newX)*1.0), yd_MapMinX), yd_MapMaxX))) // INLINED!!
            call SetUnitY(whichUnit, (RMinBJ(RMaxBJ(((newY)*1.0), yd_MapMinY), yd_MapMaxY))) // INLINED!!
        endfunction  //  清空并删除单位组
        function PO_DestroyGroupClear takes group whichGroup returns nothing
            call GroupClear(whichGroup)
            call DestroyGroup(whichGroup)
        endfunction  //  添加删除技能
        function PO_AddDelAbility takes unit u,integer i,integer jn,boolean bl returns nothing
            if ( i == 1 ) then
                call UnitAddAbility(u, jn)
                call UnitMakeAbilityPermanent(u, bl, jn)
            else
                call UnitRemoveAbility(u, jn)
            endif
        endfunction  //  设置单位属性
        function PO_SetUnitState takes unit whichUnit,unitstate whichUnitState,integer modifyMethod,real newVal returns nothing
            if ( modifyMethod == bj_MODIFYMETHOD_ADD ) then
                call SetUnitState(whichUnit, whichUnitState, GetUnitState(whichUnit, whichUnitState) + newVal)
            elseif ( modifyMethod == bj_MODIFYMETHOD_SUB ) then
                call SetUnitState(whichUnit, whichUnitState, GetUnitState(whichUnit, whichUnitState) - newVal)
            else
                call SetUnitState(whichUnit, whichUnitState, newVal)
            endif
        endfunction  //  镜头 - 平移镜头(指定玩家)(限时)(坐标) [P]
        function PO_PanCameraToTimed1 takes player whichPlayer,real x,real y,real duration returns nothing
            if ( GetLocalPlayer() == whichPlayer ) then
                call PanCameraToTimed(x, y, duration)
            endif
        endfunction  //  镜头 - 平移镜头(指定玩家)(限时)(单位) [P]
        function PO_PanCameraToTimed2 takes player whichPlayer,unit u,real duration returns nothing
            if ( GetLocalPlayer() == whichPlayer ) then
                call PanCameraToTimed(GetUnitX(u), GetUnitY(u), duration)
            endif
        endfunction  //  单位传送并转移镜头
        function PO_SetUnitMobile takes unit u,real x,real y returns nothing
            local integer c=(GetConvertedPlayerId(GetOwningPlayer((u)))) // INLINED!!
            call SetUnitPosition(u, x, y)
            if ( Player(c - 1) == GetLocalPlayer() ) then
                call PanCameraToTimed(x, y, 0.)
            endif
        endfunction  //  单位组 - 坐标范围内的指定单位
        function PO_CreateGroupEnumUnits takes real x,real y,real s,boolexpr filter returns group
            local group g=CreateGroup()
            call GroupEnumUnitsInRange(g, x, y, s, filter)
            call DestroyBoolExpr(filter)
            return g
        endfunction  //  单位组 - 方形范围内的指定单位
        function PO_SelectInLineUnits takes real x,real y,real angle,real length,real width,boolexpr filter returns group
            local group selectGroup=CreateGroup()
            local group g=CreateGroup()
            local unit a=null
            local real selectAngle=angle
            local real x1=0
            local real y1=0
            if ( selectAngle < 0 ) then
                set selectAngle=selectAngle + 360
            endif
            set x1=x + length * CosBJ(selectAngle) / 2
            set y1=y + length * SinBJ(selectAngle) / 2
            call GroupEnumUnitsInRange(selectGroup, x1, y1, length / 2, filter)
            call GroupAddGroup(selectGroup, g)
            set a=FirstOfGroup(g)
            loop
            exitwhen ( a == null )
                if ( Other___PO_SelectInLineUnitsCondition(a , x , y , angle , width) == false ) then
                    call GroupRemoveUnit(selectGroup, a)
                endif
                call GroupRemoveUnit(g, a)
                set a=FirstOfGroup(g)
            endloop
            call DestroyGroup(g)
            call DestroyBoolExpr(filter)
            set a=null
            set g=null
            return selectGroup
        endfunction  //  单位组 - 扇形范围内的指定单位
        function PO_SelectSectorUnits takes real x,real y,real s,real jd,real degrees,boolexpr filter returns group
            local group selectGroup=CreateGroup()
            local group g=CreateGroup()
            local unit a=null
            call GroupEnumUnitsInRange(selectGroup, x, y, s, filter)
            call GroupAddGroup(selectGroup, g)
            set a=FirstOfGroup(g)
            loop
            exitwhen ( a == null )
                if ( CosBJ(Atan2BJ(GetUnitY(a) - y, GetUnitX(a) - x) - jd) < CosBJ(degrees * 0.5) ) then
                    call GroupRemoveUnit(selectGroup, a)
                endif
                call GroupRemoveUnit(g, a)
                set a=FirstOfGroup(g)
            endloop
            call DestroyGroup(g)
            call DestroyBoolExpr(filter)
            set a=null
            set g=null
            return selectGroup
        endfunction  //  单位组 - 坐标范围内的指定单位
        function PO_CreateGroupEnumUnits2 takes real x,real y,real s returns group
            local group g=CreateGroup()
            call GroupEnumUnitsInRange(g, x, y, s, null)
            return g
        endfunction  //  单位组 - 方形范围内的指定单位
        function PO_SelectInLineUnits2 takes real x,real y,real angle,real length,real width returns group
            local group selectGroup=CreateGroup()
            local group g=CreateGroup()
            local unit a=null
            local real selectAngle=angle
            local real x1=0
            local real y1=0
            if ( selectAngle < 0 ) then
                set selectAngle=selectAngle + 360
            endif
            set x1=x + length * CosBJ(selectAngle) / 2
            set y1=y + length * SinBJ(selectAngle) / 2
            call GroupEnumUnitsInRange(selectGroup, x1, y1, length / 2, null)
            call GroupAddGroup(selectGroup, g)
            set a=FirstOfGroup(g)
            loop
            exitwhen ( a == null )
                if ( Other___PO_SelectInLineUnitsCondition(a , x , y , angle , width) == false ) then
                    call GroupRemoveUnit(selectGroup, a)
                endif
                call GroupRemoveUnit(g, a)
                set a=FirstOfGroup(g)
            endloop
            call DestroyGroup(g)
            set a=null
            set g=null
            return selectGroup
        endfunction  //  单位组 - 扇形范围内的指定单位
        function PO_SelectSectorUnits2 takes real x,real y,real s,real jd,real degrees returns group
            local group selectGroup=CreateGroup()
            local group g=CreateGroup()
            local unit a=null
            call GroupEnumUnitsInRange(selectGroup, x, y, s, null)
            call GroupAddGroup(selectGroup, g)
            set a=FirstOfGroup(g)
            loop
            exitwhen ( a == null )
                if ( CosBJ(Atan2BJ(GetUnitY(a) - y, GetUnitX(a) - x) - jd) < CosBJ(degrees * 0.5) ) then
                    call GroupRemoveUnit(selectGroup, a)
                endif
                call GroupRemoveUnit(g, a)
                set a=FirstOfGroup(g)
            endloop
            call DestroyGroup(g)
            set a=null
            set g=null
            return selectGroup
        endfunction  //  36进制转10进制整数
        function PO_Inverse36System takes string s returns integer
            local integer i
            local integer a
            local integer b
            local integer c=0
            local integer i1=StringLength(s)
            if ( s == "" ) then
                return 0
            endif
            set i=( 0 ) + 1
            loop
            exitwhen ( i > i1 )
                set a=LoadInteger(Other___ht, 0x3AAA3F70, StringHash(SubStringBJ(s, i, i)))
                set b=a * R2I(Pow(36, I2R(i1 - i)))
                set c=c + b
            set i=i + 1
            endloop
            return c
        endfunction
        function PO_36System takes integer i,integer len returns string
            local integer a
            local integer index
            local string s=""
            loop
            exitwhen ( i <= 0 )
                set a=ModuloInteger(i, 36)
                set i=i / 36
                set s=Other___HexMap[a] + s
            endloop
            if ( len == 0 ) then
                return s
            endif
            if ( StringLength(s) > len ) then
                set s=""
                set index=1
                loop
                exitwhen ( index > len )
                    set s=s + Other___HexMap[35]
                set index=index + 1
                endloop
            elseif ( StringLength(s) < len ) then
                set len=len - StringLength(s)
                set index=1
                loop
                exitwhen ( index > len )
                    set s=Other___HexMap[0] + s
                set index=index + 1
                endloop
            endif
            return s
        endfunction  //  62进制转10进制整数
        function PO_Inverse62System takes string s returns integer
            local integer i
            local integer a
            local integer b
            local integer c=0
            local integer i1=StringLength(s)
            if ( s == "" ) then
                return 0
            endif
            set i=( 0 ) + 1
            loop
            exitwhen ( i > i1 )
                set a=LoadInteger(Other___ht, 0x0C938413, StringHash(SubStringBJ(s, i, i)))
                set b=a * R2I(Pow(62, I2R(i1 - i)))
                set c=c + b
            set i=i + 1
            endloop
            return c
        endfunction  //  10进制转62进制字符串
        function PO_62System takes integer i,integer len returns string
            local integer a
            local integer index
            local string s=""
            loop
            exitwhen ( i <= 0 )
                set a=ModuloInteger(i, 62)
                set i=i / 62
                set s=Other___HexMap[a] + s
            endloop
            if ( len == 0 ) then
                return s
            endif
            if ( StringLength(s) > len ) then
                set s=""
                set index=1
                loop
                exitwhen ( index > len )
                    set s=s + Other___HexMap[61]
                set index=index + 1
                endloop
            elseif ( StringLength(s) < len ) then
                set len=len - StringLength(s)
                set index=1
                loop
                exitwhen ( index > len )
                    set s=Other___HexMap[0] + s
                set index=index + 1
                endloop
            endif
            return s
        endfunction  //  92进制转10进制整数
        function PO_Inverse92System takes string s returns integer
            call GetTriggerPlayer()
            return 0
        endfunction  //  10进制转92进制字符串
        function PO_92System takes integer i,integer len returns string
            call GetTriggerPlayer()
            return ""
        endfunction  //  整数转ASCII编码
        function PO_GetI2ASCII takes integer i returns string
            local integer a
            local string s=""
            loop
            exitwhen ( i <= 0 )
                set a=ModuloInteger(i, 256)
                set i=i / 256
                set s=Other___I2ASCII[a] + s
            endloop
            return s
        endfunction  //  实数转字符串 万 亿 兆 京自动替换
        function PO_R2SWY takes real num,integer l,integer i returns string
            local string num_str=I2S(R2I(num))
            local integer len=StringLength(num_str)
            local integer mod=1
            loop
            exitwhen ( len <= 4 + l )
                set len=len - 4
                set mod=mod + 1
                set num=num / 10000
            endloop
            if ( i > 0 ) then
                return R2SW(num, 1, i) + Other___suffixes[mod]
            else
                return I2S(R2I(num)) + Other___suffixes[mod]
            endif
        endfunction  //  创建漂浮文字在单位 [C]
        function PO_CreateTextTagUnit_C takes string s,unit whichUnit,real zOffset,real size,integer red,integer green,integer blue,integer transparency returns texttag
            set bj_lastCreatedTextTag=CreateTextTag()
            call SetTextTagText(bj_lastCreatedTextTag, s, size)
            call SetTextTagPosUnit(bj_lastCreatedTextTag, whichUnit, zOffset)
            call SetTextTagColor(bj_lastCreatedTextTag, red, green, blue, transparency)
            return bj_lastCreatedTextTag
        endfunction  //  坐标漂浮文字
        function PO_CreateTextTagMark takes string s,real x,real y,real zOffset,real size,real red,real green,real blue,real transparency returns texttag
            set bj_lastCreatedTextTag=CreateTextTag()
            call SetTextTagTextBJ(bj_lastCreatedTextTag, s, size)
            call SetTextTagPos(bj_lastCreatedTextTag, x, y, zOffset)
            call SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency)
            return bj_lastCreatedTextTag
        endfunction  //  坐标漂浮文字 [C]
        function PO_CreateTextTagMark_C takes string s,real x,real y,real zOffset,real size,integer red,integer green,integer blue,integer transparency returns texttag
            set bj_lastCreatedTextTag=CreateTextTag()
            call SetTextTagText(bj_lastCreatedTextTag, s, size)
            call SetTextTagPos(bj_lastCreatedTextTag, x, y, zOffset)
            call SetTextTagColor(bj_lastCreatedTextTag, red, green, blue, transparency)
            return bj_lastCreatedTextTag
        endfunction  // 单位进入区域
        function PO_TriggerRegisterEnterRectSimple takes trigger trig,rect r returns event
            local region rectRegion=CreateRegion()
            call RegionAddRect(rectRegion, r)
            call SaveRectHandle(Other___ht, GetHandleId(rectRegion), 0x069A3BE2, r)
            return TriggerRegisterEnterRegion(trig, rectRegion, null)
        endfunction  // 单位离开区域
        function PO_TriggerRegisterLeaveRectSimple takes trigger trig,rect r returns event
            local region rectRegion=CreateRegion()
            call RegionAddRect(rectRegion, r)
            call SaveRectHandle(Other___ht, GetHandleId(rectRegion), 0x069A3BE2, r)
            return TriggerRegisterLeaveRegion(trig, rectRegion, null)
        endfunction
        function PO_GetTriggeringRect takes nothing returns rect
            return LoadRectHandle(Other___ht, GetHandleId(GetTriggeringRegion()), 0x069A3BE2)
        endfunction  //  判断坐标是否可通过
            function Other___anon__0 takes nothing returns nothing
                if ( IsItemVisible(GetEnumItem()) ) then
                    set Other___pHid[Other___HidMax]=GetEnumItem()
                    call SetItemVisible(Other___pHid[Other___HidMax], false)
                    set Other___HidMax=Other___HidMax + 1
                endif
            endfunction  // 尝试移动测试项并获取其坐标
        function PO_IsWalkable takes real x,real y returns boolean
            call MoveRectTo(Other___pFind, x, y)
            call EnumItemsInRect(Other___pFind, null, function Other___anon__0)
            call SetItemPosition(Other___pItem, x, y)
            set Other___pX=GetItemX(Other___pItem)
            set Other___pY=GetItemY(Other___pItem) // 再藏起来
            call SetItemVisible(Other___pItem, false) // 取消隐藏开始时隐藏的任何项目
            loop
            exitwhen ( Other___HidMax <= 0 )
                set Other___HidMax=Other___HidMax - 1
                call SetItemVisible(Other___pHid[Other___HidMax], true)
                set Other___pHid[Other___HidMax]=null
            endloop // 返回可行走性
            return PO_DisXY(Other___pX , Other___pY , x , y) <= 10 and not ( IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) )
        endfunction  //  目标是否死亡
        function PO_IsDead takes unit u returns boolean
            return ( IsUnitType(u, UNIT_TYPE_DEAD) == true ) or ( R2I(GetUnitState(u, UNIT_STATE_LIFE)) < 1 )
        endfunction  //  获取万能马甲
        function PO_majia takes nothing returns unit
            return Other___Majia
        endfunction
        function PO_Vertigo takes unit u,real s returns nothing
            local integer jn='A000'
            if ( PO_IsDead(u) ) then
            else
                call s__japi_SetAbilityDataReal(Other___Majia , jn , 1 , 2 , s)
                call s__japi_SetAbilityDataReal(Other___Majia , jn , 1 , 3 , s)
                call IssueTargetOrder(Other___Majia, "thunderbolt", u)
            endif
        endfunction  //  击退目标
            function Other___anon__1 takes nothing returns nothing
                local timer t=GetExpiredTimer()
                local integer hand=GetHandleId(t)
                local unit u=LoadUnitHandle(Other___ht, hand, 0xC303079D)
                local real deg=LoadReal(Other___ht, hand, 0x6CB62264)
                local real spd=LoadReal(Other___ht, hand, 0x4E29FEFA)
                local real dis=LoadReal(Other___ht, hand, 0x5FCC4134)
                local real jl=LoadReal(Other___ht, hand, 0x38AB9941)
                local boolean condition=LoadBoolean(POHT, GetHandleId(u), 0x3F25EB58)
                local real x=GetUnitX(u)
                local real y=GetUnitY(u)
                set jl=jl + spd
                call SaveReal(Other___ht, hand, 0x38AB9941, jl)
                set x=(((x )*1.0) + (( spd )*1.0) * Cos((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                set y=(((y )*1.0) + (( spd )*1.0) * Sin((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                if ( PO_IsWalkable(x , y) ) then
                    call SetUnitPosition(u, x, y)
                endif
                if ( jl >= dis or not condition ) then
                    call SaveBoolean(POHT, GetHandleId(u), 0x3F25EB58, false)
                    call RemoveSavedHandle(Other___ht, GetHandleId(u), 0x125703BC)
                    call FlushChildHashtable(Other___ht, hand)
                    call DestroyTimer(t)
                endif
                set t=null
                set u=null
            endfunction
        function PO_Repel takes unit u,real deg,real spd,real dis,real s returns nothing
            local timer t
            local integer hand
            local boolean switch=false
            if ( HaveSavedHandle(Other___ht, GetHandleId(u), 0x125703BC) ) then
                set t=LoadTimerHandle(Other___ht, GetHandleId(u), 0x125703BC)
            else
                set t=CreateTimer()
                call SaveTimerHandle(Other___ht, GetHandleId(u), 0x125703BC, t)
                set switch=true
            endif
            set hand=GetHandleId(t)
            call SaveUnitHandle(Other___ht, hand, 0xC303079D, u)
            call SaveReal(Other___ht, hand, 0x6CB62264, deg)
            call SaveReal(Other___ht, hand, 0x4E29FEFA, spd)
            call SaveReal(Other___ht, hand, 0x5FCC4134, dis)
            call SaveReal(Other___ht, hand, 0x38AB9941, 0)
            call SaveBoolean(POHT, GetHandleId(u), 0x3F25EB58, true)
            if ( switch ) then
                call TimerStart(t, s, true, function Other___anon__1)
            endif
            set t=null
        endfunction  //  击飞目标
            function Other___anon__2 takes nothing returns nothing
                local timer t=GetExpiredTimer()
                local integer hand=GetHandleId(t)
                local unit u=LoadUnitHandle(Other___ht, hand, 0xC303079D)
                local real dheig=LoadReal(Other___ht, hand, 0x0DCC25D2)
                local real heighMax=LoadReal(Other___ht, hand, 0xE71D3D31)
                local real height1=LoadReal(Other___ht, hand, 0x26078A4C)
                local real steeps=LoadReal(Other___ht, hand, 0x8F2C6A98) + 1.0
                local real height=( 0.0 - ( 2.0 * steeps * dheig - 1.0 ) * ( 2.0 * steeps * dheig - 1.0 ) + 1.0 ) * heighMax
                local real height2=height - height1
                set height1=height1 + height2
                call SaveReal(Other___ht, hand, 0x8F2C6A98, steeps)
                call SaveReal(Other___ht, hand, 0x26078A4C, height1)
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + height2, 0.0)
                if ( R2I(GetUnitFlyHeight(u)) <= 0 ) then
                    call SetUnitFlyHeight(u, 0.0, 0.0)
                    call RemoveSavedHandle(Other___ht, GetHandleId(u), 0x337B4AD6)
                    call FlushChildHashtable(Other___ht, hand)
                    call DestroyTimer(t)
                endif
                set t=null
                set u=null
            endfunction
        function PO_Jump takes unit u,real heighMax,real s returns nothing
            local timer t
            local integer hand
            local real steepsMax=s / 0.01
            local real dheig=1.0 / steepsMax
            local boolean switch=false
            if ( HaveSavedHandle(Other___ht, GetHandleId(u), 0x337B4AD6) ) then
                set t=LoadTimerHandle(Other___ht, GetHandleId(u), 0x337B4AD6)
            else
                set t=CreateTimer()
                call SaveTimerHandle(Other___ht, GetHandleId(u), 0x337B4AD6, t)
                set switch=true
            endif
            set hand=GetHandleId(t)
            call SaveUnitHandle(Other___ht, hand, 0xC303079D, u)
            call SaveReal(Other___ht, hand, 0x8F2C6A98, 0.0)
            call SaveReal(Other___ht, hand, 0x0DCC25D2, dheig)
            call SaveReal(Other___ht, hand, 0xE71D3D31, heighMax)
            call SaveReal(Other___ht, hand, 0x26078A4C, 0.0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call BJDebugMsg("当前飞行高度：" + R2S(GetUnitFlyHeight(u)))
            if ( switch ) then
                call TimerStart(t, 0.01, true, function Other___anon__2)
            endif
            set t=null
        endfunction
            function Other___anon__3 takes nothing returns nothing
                local timer t=GetExpiredTimer()
                local integer hand=GetHandleId(t)
                local unit u=LoadUnitHandle(Other___ht, hand, 0xC303079D)
                local real deg=LoadReal(Other___ht, hand, 0x6CB62264)
                local real dis=LoadReal(Other___ht, hand, 0x5FCC4134)
                local real high=LoadReal(Other___ht, hand, 0xC914A483)
                local real time=LoadReal(Other___ht, hand, 0x6B54C545)
                local real s=LoadReal(Other___ht, hand, 0x2D1E4992) + 0.01
                local real p=1.0 / time
                local real h=SinBJ(180.00 * s * p) * high
                local real x=GetUnitX(u)
                local real y=GetUnitY(u)
                local real spd=dis / ( time * 100 )
                call SaveReal(Other___ht, hand, 0x2D1E4992, s)
                call SetUnitFlyHeight(u, h, 0.0)
                set x=(((x )*1.0) + (( spd )*1.0) * Cos((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                set y=(((y )*1.0) + (( spd )*1.0) * Sin((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                if ( PO_IsWalkable(x , y) ) then
                    call SetUnitPosition(u, x, y)
                endif
                if ( s >= time ) then
                    call SetUnitFlyHeight(u, 0.0, 0.0)
                    call RemoveSavedHandle(Other___ht, GetHandleId(u), 0x21265C4A)
                    call FlushChildHashtable(Other___ht, hand)
                    call DestroyTimer(t)
                endif
                set t=null
                set u=null
            endfunction
        function PO_JumpMove takes unit u,real deg,real dis,real high,real time returns nothing
            local timer t
            local integer hand
            local boolean switch=false
            if ( HaveSavedHandle(Other___ht, GetHandleId(u), 0x21265C4A) ) then
                set t=LoadTimerHandle(Other___ht, GetHandleId(u), 0x21265C4A)
            else
                set t=CreateTimer()
                call SaveTimerHandle(Other___ht, GetHandleId(u), 0x21265C4A, t)
                set switch=true
            endif
            set hand=GetHandleId(t)
            call SaveUnitHandle(Other___ht, hand, 0xC303079D, u)
            call SaveReal(Other___ht, hand, 0x6CB62264, deg)
            call SaveReal(Other___ht, hand, 0x5FCC4134, dis)
            call SaveReal(Other___ht, hand, 0xC914A483, high)
            call SaveReal(Other___ht, hand, 0x6B54C545, time)
            call SaveReal(Other___ht, hand, 0x2D1E4992, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 0.0, 0.0)
            if ( switch ) then
                call TimerStart(t, 0.01, true, function Other___anon__3)
            endif
            set t=null
        endfunction  //  设置特效颜色
        function PO_Color takes effect e,real red,real green,real blue,real transparency returns nothing
            call EXSetEffectColor(e , 0x1000000 * PercentTo255(100.0 - transparency) + 0x10000 * PercentTo255(red) + 0x100 * PercentTo255(green) + PercentTo255(blue))
        endfunction  //  D闪
            function Other___anon__4 takes nothing returns nothing
                local timer t=GetExpiredTimer()
                local integer hand=GetHandleId(t)
                local unit u=LoadUnitHandle(Other___ht, hand, 0xC303079D)
                local real deg=LoadReal(Other___ht, hand, 0x6CB62264)
                local real spd=LoadReal(Other___ht, hand, 0x4E29FEFA)
                local real dis=LoadReal(Other___ht, hand, 0x5FCC4134)
                local real jl=LoadReal(Other___ht, hand, 0x38AB9941)
                local real x=GetUnitX(u)
                local real y=GetUnitY(u)
                set jl=jl + spd
                call SaveReal(Other___ht, hand, 0x38AB9941, jl)
                set x=(((x )*1.0) + (( spd )*1.0) * Cos((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                set y=(((y )*1.0) + (( spd )*1.0) * Sin((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                if ( PO_IsWalkable(x , y) ) then
                    call SetUnitPosition(u, x, y)
                endif
                if ( jl >= dis ) then
                    call SetUnitPathing(u, true)
                    call RemoveSavedHandle(Other___ht, GetHandleId(u), 0x525FD1A1)
                    call FlushChildHashtable(Other___ht, hand)
                    call DestroyTimer(t)
                endif
                set t=null
                set u=null
            endfunction
                function Other___anon__6 takes nothing returns nothing
                    local timer t=GetExpiredTimer()
                    local integer hand=GetHandleId(t)
                    local effect e=LoadEffectHandle(Other___ht, hand, 0x239F3A6E)
                    local real deg=LoadReal(Other___ht, hand, 0x6CB62264)
                    local real spd=LoadReal(Other___ht, hand, 0x4E29FEFA)
                    local real dis=LoadReal(Other___ht, hand, 0x5FCC4134)
                    local real x=EXGetEffectX(e)
                    local real y=EXGetEffectY(e)
                    local real jl=LoadReal(Other___ht, hand, 0x38AB9941)
                    set jl=jl + spd
                    call SaveReal(Other___ht, hand, 0x38AB9941, jl)
                    set x=(((x )*1.0) + (( spd )*1.0) * Cos((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                    set y=(((y )*1.0) + (( spd )*1.0) * Sin((( deg)*1.0) * bj_DEGTORAD)) // INLINED!!
                    if ( PO_IsWalkable(x , y) ) then
                        call EXSetEffectXY(e , x , y)
                    endif
                    if ( jl >= dis ) then
                        call EXSetEffectSize(e , 0)
                        call EXSetEffectZ(e , - 500.0)
                        call DestroyEffect(e)
                        call FlushChildHashtable(Other___ht, hand)
                        call DestroyTimer(t)
                    endif
                    set t=null
                    set e=null
                endfunction
            function Other___anon__5 takes nothing returns nothing
                local timer t=GetExpiredTimer()
                local integer hand=GetHandleId(t)
                local real deg=LoadReal(Other___ht, hand, 0x6CB62264)
                local real spd=LoadReal(Other___ht, hand, 0x4E29FEFA)
                local real dis=LoadReal(Other___ht, hand, 0x5FCC4134)
                local real x=LoadReal(Other___ht, hand, 0xA99320FA)
                local real y=LoadReal(Other___ht, hand, 0xFDF65382)
                local string model=LoadStr(Other___ht, hand, 0x4D9039EC)
                local effect e=AddSpecialEffect(model, x, y)
                local real s=LoadReal(Other___ht, hand, 0x2D1E4992)
                local real i=LoadReal(Other___ht, hand, 0x25DAB820) + 1.0
                local timer m=CreateTimer()
                local integer hand2
                call PO_Color(e , 0 , 0 , 0 , i * 20)
                call EXEffectMatRotateZ(e , deg)
                call SaveReal(Other___ht, hand, 0x25DAB820, i)
                set hand2=GetHandleId(m)
                call SaveEffectHandle(Other___ht, hand2, 0x239F3A6E, e)
                call SaveReal(Other___ht, hand2, 0x6CB62264, deg)
                call SaveReal(Other___ht, hand2, 0x4E29FEFA, spd)
                call SaveReal(Other___ht, hand2, 0x5FCC4134, dis)
                call TimerStart(m, s, true, function Other___anon__6)
                if ( i >= 4 ) then
                    call FlushChildHashtable(Other___ht, hand)
                    call DestroyTimer(t)
                endif
                set t=null
                set e=null
                set m=null
            endfunction
        function PO_MoveD takes unit u,real x,real y,real spd,real dis,real s,boolean Swh,string model returns nothing
            local timer t
            local integer hand
            local integer index
            local boolean switch=false
            if ( HaveSavedHandle(Other___ht, GetHandleId(u), 0x525FD1A1) ) then
                set t=LoadTimerHandle(Other___ht, GetHandleId(u), 0x525FD1A1)
            else
                set t=CreateTimer()
                call SaveTimerHandle(Other___ht, GetHandleId(u), 0x525FD1A1, t)
                set switch=true
            endif
            call SetUnitPathing(u, false)
            call SetUnitFacing(u, PO_DegXY(GetUnitX(u) , GetUnitY(u) , x , y))
            set hand=GetHandleId(t)
            call SaveUnitHandle(Other___ht, hand, 0xC303079D, u)
            call SaveReal(Other___ht, hand, 0x6CB62264, PO_DegXY(GetUnitX(u) , GetUnitY(u) , x , y))
            call SaveReal(Other___ht, hand, 0x4E29FEFA, spd)
            call SaveReal(Other___ht, hand, 0x5FCC4134, RMinBJ(PO_DisXY(GetUnitX(u) , GetUnitY(u) , x , y), dis))
            call SaveReal(Other___ht, hand, 0x38AB9941, 0)
            if ( switch ) then
                call TimerStart(t, s, true, function Other___anon__4)
                if ( Swh ) then
                    set t=CreateTimer()
                    set hand=GetHandleId(t)
                    call SaveReal(Other___ht, hand, 0x6CB62264, PO_DegXY(GetUnitX(u) , GetUnitY(u) , x , y))
                    call SaveReal(Other___ht, hand, 0x4E29FEFA, spd)
                    call SaveReal(Other___ht, hand, 0x5FCC4134, RMinBJ(PO_DisXY(GetUnitX(u) , GetUnitY(u) , x , y), dis))
                    call SaveReal(Other___ht, hand, 0xA99320FA, GetUnitX(u))
                    call SaveReal(Other___ht, hand, 0xFDF65382, GetUnitY(u))
                    call SaveReal(Other___ht, hand, 0x2D1E4992, s)
                    call SaveStr(Other___ht, hand, 0x4D9039EC, model)
                    call TimerStart(t, 0.05, true, function Other___anon__5)
                endif
            endif
            set t=null
        endfunction  // 获取鼠标指向的物品
        function PO_ItemMouse takes nothing returns item
            call FlushChildHashtable(Other___ht, 0x07852708)
            call SaveFogStateHandle(Other___ht, 0x07852708, 1, ConvertFogState(GetHandleId(DzGetUnitUnderMouse())))
            return LoadItemHandle(Other___ht, 0x07852708, 1)
        endfunction  // 获取矩形随机X坐标
        function PO_RandomRectX takes rect whichRect returns real
            return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect))
        endfunction  // 获取矩形随机Y坐标
        function PO_RandomRectY takes rect whichRect returns real
            return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect))
        endfunction  // 获取frame是否显示
        function DzFrameIsVisible takes integer frame returns boolean
            call GetTriggerPlayer()
            return false
        endfunction  // 发送控制台消息
        function PO_Print takes string message returns nothing
            call GetTriggerPlayer()
        endfunction  // 获取当前地图的总游戏市场（单位：分）
        function DzAPI_Map_MapsTotalPlayed takes player whichPlayer returns integer
            call GetTriggerPlayer()
            return 0
        endfunction  // 计算地图等级（单位：分）
        function GetMapWorkOutLevel takes integer gametime returns integer
            call GetTriggerPlayer()
            return 0
        endfunction  // 任意单位 新建事件
        function PO_CreateUnitEvent takes trigger t returns nothing
            call GetTriggerPlayer()
        endfunction  // 新建单位
        function PO_GetCreateUnit takes nothing returns unit
            call GetTriggerPlayer()
            return null
        endfunction  // 发送版本号信息
        function PO_SendVersion takes nothing returns nothing
            call BJDebugMsg("v1.25")
        endfunction

//library Other ends
//===========================================================================
//*
//*  Global variables
//*
//===========================================================================
//当被等待拦截后，会调用重置step为当前触发器的step
//YDHashGet(YDLOC, integer, 0, -1) ydl_triggerstep
//逆天运行触发器 参数挂接到目标触发器局部
//提前注册 triggerstep 再释放，即将运行的触发器会注册到相同索引，达到挂接参数的目的
//禁止在逆天触发器传参中使用等待！
    //由于运行的目标触发器会将 0, 0 更新为新索引
    //call YDHashSet(YDLOC, integer, 0, 0, ydl_localvar_step) YDNL 
// YDNL //    call YDHashSet(YDLOC, integer, 0, 0, ydl_triggerstep)

    //魔兽版本 用GetGameVersion 来获取当前版本 来对比以下具体版本做出相应操作
    //-----------模拟聊天------------------
    
    //---------技能数据类型---------------
    
    //冷却时间
    //目标允许
    //施放时间
    //持续时间
    //持续时间
    //魔法消耗
    //施放间隔
    //影响区域
    //施法距离
    //数据A
    //数据B
    //数据C
    //数据D
    //数据E
    //数据F
    //数据G
    //数据H
    //数据I
    //单位类型
    //热键
    //关闭热键
    //学习热键
    //名字
    //图标
    //目标效果
    //施法者效果
    //目标点效果
    //区域效果
    //投射物
    //特殊效果
    //闪电效果
    //buff提示
    //buff提示
    //学习提示
    //提示
    //关闭提示
    //学习提示
    //提示
    //关闭提示
    //关闭图标
    
    //----------物品数据类型----------------------
    //物品图标
    //物品提示
    //物品扩展提示
    //物品名字
    //物品说明
    //------------单位数据类型--------------
    //攻击1 伤害骰子数量
    //攻击1 伤害骰子面数
    //攻击1 基础伤害
    //攻击1 升级奖励
    //攻击1 最小伤害
    //攻击1 最大伤害
    //攻击1 全伤害范围
    //装甲
    // attack 1 attribute adds
    //攻击1 伤害衰减参数
    //攻击1 武器声音
    //攻击1 攻击类型
    //攻击1 最大目标数
    //攻击1 攻击间隔
    //攻击1 攻击延迟/summary>
    //攻击1 弹射弧度
    //攻击1 攻击范围缓冲
    //攻击1 目标允许
    //攻击1 溅出区域
    //攻击1 溅出半径
    //攻击1 武器类型
    // attack 2 attributes (sorted in a sequencial order based on memory address)
    //攻击2 伤害骰子数量
    //攻击2 伤害骰子面数
    //攻击2 基础伤害
    //攻击2 升级奖励
    //攻击2 伤害衰减参数
    //攻击2 武器声音
    //攻击2 攻击类型
    //攻击2 最大目标数
    //攻击2 攻击间隔
    //攻击2 攻击延迟
    //攻击2 攻击范围
    //攻击2 攻击缓冲
    //攻击2 最小伤害
    //攻击2 最大伤害
    //攻击2 弹射弧度
    //攻击2 目标允许类型
    //攻击2 溅出区域
    //攻击2 溅出半径
    //攻击2 武器类型
    //装甲类型
    
//  单位面板主框架(simple)
//  单位名字
//  经验条(simple)
//  经验条中的文本
//  攻击主体(simple)
//  攻击一图标
//  攻击一图标右下角科技等级文本
//  攻击一文本
//  攻击一数值
//  攻击二图标
//  攻击二图标右下角科技等级文本
//  攻击二文本
//  攻击二数值
//  护甲主体(simple)  可以用来当父节点
//  护甲图标
//  护甲图标右下角科技等级文本
//  护甲文本
//  护甲数值
//  三围连带图标整体(simple)
//  三围整体(simple)
//  三围图标
//  力量文本
//  力量数值
//  敏捷文本
//  敏捷数值
//  智力文本
//  智力数值
//  建筑物面板人口贴图
//  建筑物面板人口文本
//  建筑物面板人口数值
//  同盟面板中玩家N的文本
//  金币图标
//  金币数值
//  木头图标
//  木头数值
//  人口图标
//  人口数值
//  无维修费用的文本
//  资源栏整体(simple)
//  金币数值（图标没有）
//  木头数值（图标没有）
//  人口数值（图标没有）
//  人口右边的维修文本
//  物品在面板中显示的文本整体(simple)
//  物品在面板中显示的名字文本
//  物品在面板中显示的提示文本
//  造兵界面整体(simple)
//  造兵界面名字
//  进度条
//  训练中文本
//  可训练单位图标框整体
//  吞噬整体(simple)
//  吞噬文本
//  可以移动控制台的UI
//  Frame
//  隐藏按钮只需要设置Buttonpos=0,-11即可
//  移动
//  [CmdMove]
//  Buttonpos=0,0
//  攻击
//  [CmdAttack]
//  Buttonpos=3,0
//  攻击地面
//  [CmdAttackGround]
//  Buttonpos=3,1
//  保持原位
//  [CmdHoldPos]
//  Buttonpos=2,0
//  巡逻
//  [CmdPatrol]
//  Buttonpos=0,1
//  设集结点
//  [CmdRally]
//  Buttonpos=3,1
//  英雄技能
//  [CmdSelectSkill]
//  Buttonpos=3,1
//  停止
//  [CmdStop]
//  Buttonpos=1,0
//将resource  跟 plugin 导入到地图中

//导入内置的jass载入脚本
 // 是否开启导入 地图目录下的 import  文件

// 导入文件

//  编辑器版本
//  其他功能
function InitGlobals takes nothing returns nothing
 local integer i= 0
endfunction
function InitRandomGroups takes nothing returns nothing
 local integer curset
endfunction
function InitSounds takes nothing returns nothing
endfunction
function CreateDestructables takes nothing returns nothing
 local destructable d
 local trigger t
 local real life
endfunction
function CreateItems takes nothing returns nothing
 local integer itemID
endfunction
function CreateUnits takes nothing returns nothing
 local unit u
 local integer unitID
 local trigger t
 local real life
endfunction
function CreateRegions takes nothing returns nothing
 local weathereffect we
endfunction
function CreateCameras takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: 简介
//自定义jass生成器 作者：007 
//有bug到魔兽地图编辑器吧 @w4454962 
//bug反馈群：724829943   lua 技术交流3群：710331384
//===========================================================================
function Trig_______uActions takes nothing returns nothing
	//欢迎使用世界编辑器，开始你的地图创造之旅。
	//你可以从dz.163.com获取最新编辑器咨询。
	//当你的地图意外损坏时，你可以在backups目录找到你最近26次保存的地图。
	//任何疑问请加官方作者群：QQ35063417。
endfunction
//===========================================================================
function InitTrig_______u takes nothing returns nothing
	set gg_trg_______u=CreateTrigger()
	call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
	call InitTrig_______u()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
endfunction
function InitCustomPlayerSlots takes nothing returns nothing
	call SetPlayerStartLocation(Player(0), 0)
	call SetPlayerColor(Player(0), ConvertPlayerColor(0))
	call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(0), false)
	call SetPlayerController(Player(0), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
	// Force: TRIGSTR_002
	call SetPlayerTeam(Player(0), 0)
endfunction
function InitAllyPriorities takes nothing returns nothing
endfunction
//===========================================================================
//*
//*  Main Initialization
//*
//===========================================================================
function main takes nothing returns nothing
	call initializePlugin()
 call SetCameraBounds(- 3840.000000 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3840.000000 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3840.000000 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3328.000000 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3840.000000 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3328.000000 - GetCameraMargin(CAMERA_MARGIN_TOP), 3840.000000 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3840.000000 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	call NewSoundEnvironment("Default")
	call SetAmbientDaySound("LordaeronSummerDay")
	call SetAmbientNightSound("LordaeronSummerNight")
	call SetMapMusic("Music", true, 0)
	call InitSounds()
	call InitRandomGroups()
	call CreateRegions()
	call CreateCameras()
	call CreateDestructables()
	call CreateItems()
	call CreateUnits()
	call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs171049203")
call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("nzjapi___onInit")
call ExecuteFunc("Other___onInit")

	call InitGlobals()
	call InitTrig_______u() // INLINED!!
	call RunInitializationTriggers()
endfunction
//===========================================================================
//*
//*  Map Configuration
//*
//===========================================================================
function config takes nothing returns nothing
	call SetMapName("只是另外一张魔兽争霸的地图")
	call SetMapDescription("没有说明")
	call SetPlayers(1)
	call SetTeams(1)
	call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
	call DefineStartLocation(0, 0.000000, 0.000000)
	call InitCustomPlayerSlots()
	call SetPlayerTeam(Player(0), 0) // INLINED!!
	call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

function jasshelper__initstructs171049203 takes nothing returns nothing


    call ExecuteFunc("s__japi_onInit")
endfunction

