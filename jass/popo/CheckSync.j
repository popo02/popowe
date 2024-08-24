#ifndef CheckSyncIncluded
#define CheckSyncIncluded

library CheckSync

    globals
        private integer Max_P = 4 //最大玩家数
        private hashtable HT = InitHashtable()
        private integer KEY_SYNC = StringHash("CheckSync")
    endglobals    
    
    private function Sync takes nothing returns nothing
        local integer i = GetPlayerId(DzGetTriggerSyncPlayer()) + 1
        call SaveInteger( HT, KEY_SYNC, i, S2I(DzGetTriggerSyncData()) )
    endfunction
    
    private function Check takes nothing returns nothing
        local integer n = 0 // 异次元的玩家数
        local integer m = 0 // 初始玩家总数
        local integer pn = 0 // 正在游戏的玩家数
        local integer i = 1
        local integer now = 0
        local player p = null
        local integer max = Max_P
        local timer t = GetExpiredTimer()
        local integer h = GetHandleId(t)
        local integer last = LoadInteger( HT, h, 0 )
        // 判断
        set i = 1
        loop
            exitwhen i > max
            set p = Player(i-1)
            set now = LoadInteger( HT, KEY_SYNC, i )
            if GetPlayerSlotState(p)!=PLAYER_SLOT_STATE_EMPTY and GetPlayerController(p)==MAP_CONTROL_USER then
                set m = m + 1
                if now != last then
                    set n = n + 1
                endif
                if GetPlayerSlotState(p)==PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p)==MAP_CONTROL_USER then
                    set pn = pn + 1
                endif
            endif
            set i = i + 1
        endloop
        set i = 1
        loop
            exitwhen i > max
            set p = Player(i-1)
            set now = LoadInteger( HT, KEY_SYNC, i )
            // 在线玩家数量>1时才检测
            if m > 1 and pn > 1 and GetPlayerSlotState(p)==PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p)==MAP_CONTROL_USER then
                if n >= m - 1 then
                    // 异次元玩家的视角
                    set n = n + 1
                    call DisplayTextToPlayer( GetLocalPlayer(), 0, 0, "你终于成功进入异次元了！！！" )
                else
                    // 其他玩家的视角
                    if now != last then
                        call DisplayTextToForce( GetPlayersAll(), GetPlayerName(p) + " 已成功进入异次元！！" )
                    endif
                endif
            else
            endif
            set i = i + 1
        endloop
        call DestroyTimer(t)
        call FlushChildHashtable(HT,h)
        set p = null
        set t = null
    endfunction
    
    private function Timed takes nothing returns nothing
        local integer i = 1
        local integer max = Max_P
        local timer t = CreateTimer()
        local integer h = GetHandleId(t)
        local integer last = GetRandomInt(1, 999999)
        //set last = last + h
        loop
            exitwhen i > max
            if Player(i-1) == GetLocalPlayer() then
                call DzSyncData( "CheckSync", I2S(last) )
            endif
            set i = i + 1
        endloop
        call SaveInteger( HT, h, 0, last )
        call TimerStart(t, 2.90, false, function Check)
        set t = null
    endfunction
    
    function CheckSync_Initialization takes nothing returns nothing
        local trigger t = CreateTrigger()
        call DisplayTextToPlayer( GetLocalPlayer(), 0, 0, "异次元检测" )
        call TriggerAddAction(t, function Sync)
        call DzTriggerRegisterSyncData( t, "CheckSync", false )
        call TimerStart(CreateTimer(), 3, true, function Timed)
        set t = null
    endfunction
    
endlibrary
#endif

    