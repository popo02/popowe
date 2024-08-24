# /*
#  *  局部变量、自定义值
#  *  
#  *  By actboy168
#  *
#  */
#
#ifndef INCLUDE_YDTRIGGER_HASH_H
#define INCLUDE_YDTRIGGER_HASH_H
#
# include "popo\pool.j"
#
#define YDUserDataClearTable(table_type, table) YDHashClearTable(YDHASH_HANDLE, YDHashAny2I(table_type, table))
#define YDUserDataClear(table_type, table, attribute, value_type) YDHashClear(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>)
#define YDUserDataSet(table_type, table, attribute, value_type, value) YDHashSet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>, value)
#define YDUserDataGet(table_type, table, attribute, value_type) YDHashGet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>)
#define YDUserDataHas(table_type, table, attribute, value_type) YDHashHas(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>)
#define YDUserDataSetop(table_type, table, attribute, value_type, op, value) YDHashSet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>, (YDHashGet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), <?=StringHash(attribute)?>))op(value))
#define YDUserDataSet2(table, attribute, value_type, value) YDHashSet(YDHASH_HANDLE, value_type, <?=StringHash(table)?>, <?=StringHash(attribute)?>, value)
#define YDUserDataGet2(table, attribute, value_type) YDHashGet(YDHASH_HANDLE, value_type, <?=StringHash(table)?>, <?=StringHash(attribute)?>)
#define YDUserDataClear3(table_type, table, attribute, value_type) YDHashClear(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute)
#define YDUserDataSet3(table_type, table, attribute, value_type, value) YDHashSet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute, value)
#define YDUserDataGet3(table_type, table, attribute, value_type) YDHashGet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute)
#define YDUserDataHas3(table_type, table, attribute, value_type) YDHashHas(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute)
#define YDUserDataSetop3(table_type, table, attribute, value_type, op, value) YDHashSet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute, (YDHashGet(YDHASH_HANDLE, value_type, YDHashAny2I(table_type, table), attribute))op(value))
#
#define YD_hTrig GetHandleId( GetTriggeringTrigger() )
#define stackIdx XG_YDTrigger_StackIdx
#   // 傻逼逆天。是真的逆天，处处偷懒、回调里就不能放个init宏。
#  //等待都知道加个重置step。运行逆天就不知道。写尼玛那么复杂handle乘算。handleid也不加个局部存，就尼玛每条都get一下。一点代码不优化
#
#  // GlobalsTriggerRunSteps & TriggerRunSteps
#  //双栈 
#  //函数的栈用来管理主要索引
#  //表的栈用来兼容套娃和 逆大天 的运行逆天触发器。

#  //不兼容 套娃+等待 两个毒瘤同时出现

#  // 雪月原话↑↑↑↑↑↑↑↑↑↑
#define YDLocalInitialize() \
    local integer ydl_localvar_step = XG_YDLocalIndex_Alloc() YDNL \
    call YDHashSet(YDLOC, integer, YD_hTrig, -1, YDHashGet( YDLOC, integer, YD_hTrig, -1 ) + 1 ) YDNL \
    call YDHashSet(YDLOC, integer, YD_hTrig, YDHashGet( YDLOC, integer, YD_hTrig, -1 ), ydl_localvar_step)


//当被等待拦截后，会调用重置step为当前触发器的step
#define YDLocalReset()                             YDHashSet(YDLOC, integer, YD_hTrig, YDHashGet( YDLOC, integer, YD_hTrig, -1 ), ydl_localvar_step)

# // 1. 第一层 原始触发器 局部
#define YDLOCAL_1                                  ydl_localvar_step
#define YDLocal1Set(type, name, value)             YDHashSet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?>, value)
#define YDLocal1ArraySet(type, name, index, value) YDHashSet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?> + (index), value)
#define YDLocal1Get(type, name)                    YDHashGet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?>)
#define YDLocal1ArrayGet(type, name, index)        YDHashGet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?> + (index))
#define YDLocal1Setop(type, name, op, value)       YDHashSet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?>))op(value))
#define YDLocal1ArraySetop(type, name, index, op, value) YDHashSet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal1Clear(type, name)                  YDHashClear(YDLOC, type, YDLOCAL_1, <?=StringHash(name)?>)
#define YDLocal1Release() YDHashClearTable(YDLOC, YDLOCAL_1) YDNL \
call XG_YDLocalIndex_Release( YDLOCAL_1 )  YDNL \
call YDHashSet(YDLOC, integer, YD_hTrig, -1, YDHashGet( YDLOC, integer, YD_hTrig, -1 ) - 1 ) 


//YDHashGet(YDLOC, integer, 0, -1) ydl_triggerstep
# // 2. 逆天运行触发器 传参[当触发器内没有使用局部时不使用 YDLOCAL_1 转而使用 YDLOCAL_2 ]
# // 条件/回调 内使用逆天局部也会用这个所以不能直接用 ydl_triggerstep
#define YDLOCAL_2                                  YDHashGet(YDLOC, integer, YD_hTrig, YDHashGet( YDLOC, integer, YD_hTrig, -1 ))
#define YDLocal2Set(type, name, value)             YDHashSet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?>, value)
#define YDLocal2ArraySet(type, name, index, value) YDHashSet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?> + (index), value)
#define YDLocal2Get(type, name)                    YDHashGet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?>)
#define YDLocal2ArrayGet(type, name, index)        YDHashGet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?> + (index))
#define YDLocal2Setop(type, name, op, value)       YDHashSet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?>))op(value))
#define YDLocal2ArraySetop(type, name, index, op, value) YDHashSet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal2Clear(type, name)                  YDHashClear(YDLOC, type, YDLOCAL_2, <?=StringHash(name)?>)
# // 3. 动态注册计时器
#define YDLOCAL_3                                  YDHashH2I(GetExpiredTimer())
#define YDLocal3Set(type, name, value)             YDHashSet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?>, value)
#define YDLocal3ArraySet(type, name, index, value) YDHashSet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?> + (index), value)
#define YDLocal3Get(type, name)                    YDHashGet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?>)
#define YDLocal3ArrayGet(type, name, index)        YDHashGet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?> + (index))
#define YDLocal3Release()                          YDHashClearTable(YDLOC, YDLOCAL_3)
#define POLocal3Release()                          YDHashClearTable(YDLOC, YDHashH2I(pp_stimer_Handle()))
#define YDLocal3Setop(type, name, op, value)       YDHashSet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?>))op(value))
#define YDLocal3ArraySetop(type, name, index, op, value) YDHashSet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal3Clear(type, name)                  YDHashClear(YDLOC, type, YDLOCAL_3, <?=StringHash(name)?>)
# // 4. 动态注册触发器
#define YDLOCAL_4                                  YDHashH2I(GetTriggeringTrigger())
#define YDLocal4Set(type, name, value)             YDHashSet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?>, value)
#define YDLocal4ArraySet(type, name, index, value) YDHashSet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?> + (index), value)
#define YDLocal4Get(type, name)                    YDHashGet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?>)
#define YDLocal4ArrayGet(type, name, index)        YDHashGet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?> + (index))
#define YDLocal4Release()                          YDHashClearTable(YDLOC, YDLOCAL_4)
#define YDLocal4Setop(type, name, op, value)       YDHashSet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?>))op(value))
#define YDLocal4ArraySetop(type, name, index, op, value) YDHashSet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal4Clear(type, name)                  YDHashClear(YDLOC, type, YDLOCAL_4, <?=StringHash(name)?>)
//逆天运行触发器 参数挂接到目标触发器局部
//提前注册 triggerstep 再释放，即将运行的触发器会注册到相同索引，达到挂接参数的目的
//禁止在逆天触发器传参中使用等待！
#define YDLocalExecuteTrigger(trg) \
    set ydl_triggerstep = XG_YDLocalIndex_Alloc() YDNL \
    call XG_YDLocalIndex_Release(ydl_triggerstep) YDNL \

    //由于运行的目标触发器会将 0, 0 更新为新索引
    //call YDHashSet(YDLOC, integer, 0, 0, ydl_localvar_step) YDNL \

// YDNL \
//    call YDHashSet(YDLOC, integer, 0, 0, ydl_triggerstep)

# // 5. callback内运行触发器
#define YDLOCAL_5                                  ydl_triggerstep
#define YDLocal5Set(type, name, value)             YDHashSet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?>, value)
#define YDLocal5ArraySet(type, name, index, value) YDHashSet(YDHASH_HYDLOCANDLE, type, YDLOCAL_5, <?=StringHash(name)?> + (index), value)
#define YDLocal5Get(type, name)                    YDHashGet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?>)
#define YDLocal5ArrayGet(type, name, index)        YDHashGet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?> + (index))
#define YDLocal5Setop(type, name, op, value)       YDHashSet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?>))op(value))
#define YDLocal5ArraySetop(type, name, index, op, value) YDHashSet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal5Clear(type, name)                  YDHashClear(YDLOC, type, YDLOCAL_5, <?=StringHash(name)?>)
# // 6.
#define YDLocal6Set(page, type, name, value)             YDHashSet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?>, value)
#define YDLocal6ArraySet(page, type, name, index, value) YDHashSet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?> + (index), value)
#define YDLocal6Get(page, type, name)                    YDHashGet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?>)
#define YDLocal6ArrayGet(page, type, name, index)        YDHashGet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?> + (index))
#define YDLocal6Release(page)                            YDHashClearTable(YDLOC, <?=StringHash(page)?>)
#define YDLocal6Setop(page, type, name, op, value)             YDHashSet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?>, (YDHashGet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?>))op(value))
#define YDLocal6ArraySetop(page, type, name, index, op, value) YDHashSet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal6Clear(page, type, name)                  YDHashClear(YDLOC, type, <?=StringHash(page)?>, <?=StringHash(name)?>)
# // 7.
#define YDLocal7Set(page, type, name, value)             YDHashSet(YDLOC, type, page, <?=StringHash(name)?>, value)
#define YDLocal7ArraySet(page, type, name, index, value) YDHashSet(YDLOC, type, page, <?=StringHash(name)?> + (index), value)
#define YDLocal7Get(page, type, name)                    YDHashGet(YDLOC, type, page, <?=StringHash(name)?>)
#define YDLocal7ArrayGet(page, type, name, index)        YDHashGet(YDLOC, type, page, <?=StringHash(name)?> + (index))
#define YDLocal7Release(page)                            YDHashClearTable(YDLOC, page)
#define YDLocal7Setop(page, type, name, op, value)             YDHashSet(YDLOC, type, page, <?=StringHash(name)?>, (YDHashGet(POLOC, type, page, <?=StringHash(name)?>))op(value))
#define YDLocal7ArraySetop(page, type, name, index, op, value) YDHashSet(YDLOC, type, page, <?=StringHash(name)?> + (index), (YDHashGet(POLOC, type, page, <?=StringHash(name)?> + (index)))op(value))
#define YDLocal7Clear(page, type, name)                  YDHashClear(YDLOC, type, page, <?=StringHash(name)?>)
#define YDLOCAL_7                                        0xF98CD626
#define YDLocal7Re(page, type, name)                     YDHashSet(YDLOC, type, YDLOCAL_7, <?=StringHash(name)?>, YDHashGet(YDLOC, type, page, <?=StringHash(name)?>))
#define YDLocal7GetRe(type, name)                        YDHashGet(YDLOC, type, YDLOCAL_7, <?=StringHash(name)?>)
#define YDLocal7ReleaseRe()                              YDHashClearTable(YDLOC, YDLOCAL_7)
#
#
#define YDLocalSet(page, type, name, value)             YDHashSet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?>, value)
#define YDLocalArraySet(page, type, name, index, value) YDHashSet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?> + (index), value)
#define YDLocalGet(page, type, name)                    YDHashGet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?>)
#define YDLocalArrayGet(page, type, name, index)        YDHashGet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?> + (index))
#define YDLocalRelease(page)                            YDHashClearTable(YDLOC, YDHashH2I(page))
#define YDLocalSetop(page, type, name, op, value)             YDHashSet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?>, (YDHashGet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?>))op(value))
#define YDLocalArraySetop(page, type, name, index, op, value) YDHashSet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?> + (index), (YDHashGet(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?> + (index)))op(value))
#define YDLocalClear(page, type, name)                  YDHashClear(YDLOC, type, YDHashH2I(page), <?=StringHash(name)?>)
#
#
#
#
#
#define pp_IntGroup_Addint_integer(self, index)                     pp_IntGroup_Addint(self, index)
#define pp_IntGroup_Addint_unitcode(self, index)                    pp_IntGroup_Addint(self, index)
#define pp_IntGroup_Addint_itemcode(self, index)                    pp_IntGroup_Addint(self, index)
#define pp_IntGroup_Addint_frame(self, index)                       pp_IntGroup_Addint(self, index)
#
#define pp_IntGroup_Addint_P(self, Type, index)                     pp_IntGroup_Addint_##Type(self, index)
#
#
#define pp_IntGroup_AddintWeight_integer(self, index, weight)       pp_IntGroup_AddintWeight(self, index, weight)
#define pp_IntGroup_AddintWeight_unitcode(self, index, weight)      pp_IntGroup_AddintWeight(self, index, weight)
#define pp_IntGroup_AddintWeight_itemcode(self, index, weight)      pp_IntGroup_AddintWeight(self, index, weight)
#define pp_IntGroup_AddintWeight_frame(self, index, weight)         pp_IntGroup_AddintWeight(self, index, weight)
#
#define pp_IntGroup_AddintWeight_P(self, Type, index, weight)       pp_IntGroup_AddintWeight_##Type(self, index, weight)
#
#
#define pp_IntGroup_IsIntInGroup_integer(self, index)               pp_IntGroup_IsIntInGroup(self, index)
#define pp_IntGroup_IsIntInGroup_unitcode(self, index)              pp_IntGroup_IsIntInGroup(self, index)
#define pp_IntGroup_IsIntInGroup_itemcode(self, index)              pp_IntGroup_IsIntInGroup(self, index)
#define pp_IntGroup_IsIntInGroup_frame(self, index)                 pp_IntGroup_IsIntInGroup(self, index)
#
#define pp_IntGroup_IsIntInGroup_P(self, Type, index)               pp_IntGroup_IsIntInGroup_##Type(self, index)
#
#
#define pp_IntGroup_DestroyInt_integer(self, index)                 pp_IntGroup_DestroyInt(self, index)
#define pp_IntGroup_DestroyInt_unitcode(self, index)                pp_IntGroup_DestroyInt(self, index)
#define pp_IntGroup_DestroyInt_itemcode(self, index)                pp_IntGroup_DestroyInt(self, index)
#define pp_IntGroup_DestroyInt_frame(self, index)                   pp_IntGroup_DestroyInt(self, index)
#
#define pp_IntGroup_DestroyInt_P(self, Type, index)                 pp_IntGroup_DestroyInt_##Type(self, index)
#
#
#
#define PO_OperatorCompareFrame(frame1, op, frame2)                 (frame1 op frame2)
#
#define PO_MusicPath(Path)                                          Path
#
#define PO_EndGame()                                          EndGame(true)
#
#define PO_OperatorDeg2(a1,op1,a2) ((a1)op1(a2))
#define PO_OperatorDeg3(a1,op1,a2,op2,a3) ((a1)op1(a2)op2(a3))
#
/*

japi引用的常量库 由于wave宏定义 只对以下的代码有效

请将常量库里所有内容复制到  自定义脚本代码区
*/

    //魔兽版本 用GetGameVersion 来获取当前版本 来对比以下具体版本做出相应操作
    #define version_124b   6374
    #define version_124e   6387
    #define version_126    6401  
    #define version_127a   7000
    #define version_127b   7085
    #define version_128a   7205

    //-----------模拟聊天------------------
    #define CHAT_RECIPIENT_ALL    0    // [所有人]
    #define CHAT_RECIPIENT_ALLIES      1    // [盟友]
    #define CHAT_RECIPIENT_OBSERVERS   2    // [观看者]
    #define CHAT_RECIPIENT_REFEREES    2    // [裁判]
    #define CHAT_RECIPIENT_PRIVATE     3    // [私人的]
    
    //---------技能数据类型---------------
    
    //冷却时间
    #define ABILITY_STATE_COOLDOWN 1

    //目标允许
    #define ABILITY_DATA_TARGS 100

    //施放时间
    #define ABILITY_DATA_CAST 101

    //持续时间
    #define ABILITY_DATA_DUR 102

    //持续时间
    #define ABILITY_DATA_HERODUR 103

    //魔法消耗
    #define ABILITY_DATA_COST 104

    //施放间隔
    #define ABILITY_DATA_COOL 105

    //影响区域
    #define ABILITY_DATA_AREA 106

    //施法距离
    #define ABILITY_DATA_RNG 107

    //数据A
    #define ABILITY_DATA_DATA_A 108

    //数据B
    #define ABILITY_DATA_DATA_B 109

    //数据C
    #define ABILITY_DATA_DATA_C 110

    //数据D
    #define ABILITY_DATA_DATA_D 111

    //数据E
    #define ABILITY_DATA_DATA_E 112

    //数据F
    #define ABILITY_DATA_DATA_F 113

    //数据G
    #define ABILITY_DATA_DATA_G 114

    //数据H
    #define ABILITY_DATA_DATA_H 115

    //数据I
    #define ABILITY_DATA_DATA_I 116

    //单位类型
    #define ABILITY_DATA_UNITID 117

    //热键
    #define ABILITY_DATA_HOTKET 200

    //关闭热键
    #define ABILITY_DATA_UNHOTKET 201

    //学习热键
    #define ABILITY_DATA_RESEARCH_HOTKEY 202

    //名字
    #define ABILITY_DATA_NAME 203

    //图标
    #define ABILITY_DATA_ART 204

    //目标效果
    #define ABILITY_DATA_TARGET_ART 205

    //施法者效果
    #define ABILITY_DATA_CASTER_ART 206

    //目标点效果
    #define ABILITY_DATA_EFFECT_ART 207

    //区域效果
    #define ABILITY_DATA_AREAEFFECT_ART 208

    //投射物
    #define ABILITY_DATA_MISSILE_ART 209

    //特殊效果
    #define ABILITY_DATA_SPECIAL_ART 210

    //闪电效果
    #define ABILITY_DATA_LIGHTNING_EFFECT 211

    //buff提示
    #define ABILITY_DATA_BUFF_TIP 212

    //buff提示
    #define ABILITY_DATA_BUFF_UBERTIP 213

    //学习提示
    #define ABILITY_DATA_RESEARCH_TIP 214

    //提示
    #define ABILITY_DATA_TIP 215

    //关闭提示
    #define ABILITY_DATA_UNTIP 216

    //学习提示
    #define ABILITY_DATA_RESEARCH_UBERTIP 217

    //提示
    #define ABILITY_DATA_UBERTIP 218

    //关闭提示
    #define ABILITY_DATA_UNUBERTIP 219

    #define ABILITY_DATA_UNART 220
    
    #define ABILITY_DATA_RESEARCH_ART 221

    //----------物品数据类型----------------------

    //物品图标
    #define ITEM_DATA_ART 1

    //物品提示
    #define ITEM_DATA_TIP 2

    //物品扩展提示
    #define ITEM_DATA_UBERTIP 3

    //物品名字
    #define ITEM_DATA_NAME 4

    //物品说明
    #define ITEM_DATA_DESCRIPTION 5


    //------------单位数据类型--------------
    //攻击1 伤害骰子数量
    #define UNIT_STATE_ATTACK1_DAMAGE_DICE 0x10

    //攻击1 伤害骰子面数
    #define UNIT_STATE_ATTACK1_DAMAGE_SIDE 0x11

    //攻击1 基础伤害
    #define UNIT_STATE_ATTACK1_DAMAGE_BASE 0x12

    //攻击1 升级奖励
    #define UNIT_STATE_ATTACK1_DAMAGE_BONUS 0x13

    //攻击1 最小伤害
    #define UNIT_STATE_ATTACK1_DAMAGE_MIN 0x14

    //攻击1 最大伤害
    #define UNIT_STATE_ATTACK1_DAMAGE_MAX 0x15

    //攻击1 全伤害范围
    #define UNIT_STATE_ATTACK1_RANGE 0x16

    //装甲
    #define UNIT_STATE_ARMOR 0x20

    // attack 1 attribute adds
    //攻击1 伤害衰减参数
    #define UNIT_STATE_ATTACK1_DAMAGE_LOSS_FACTOR 0x21

    //攻击1 武器声音
    #define UNIT_STATE_ATTACK1_WEAPON_SOUND 0x22

    //攻击1 攻击类型
    #define UNIT_STATE_ATTACK1_ATTACK_TYPE 0x23

    //攻击1 最大目标数
    #define UNIT_STATE_ATTACK1_MAX_TARGETS 0x24

    //攻击1 攻击间隔
    #define UNIT_STATE_ATTACK1_INTERVAL 0x25

    //攻击1 攻击延迟/summary>
    #define UNIT_STATE_ATTACK1_INITIAL_DELAY 0x26

    //攻击1 弹射弧度
    #define UNIT_STATE_ATTACK1_BACK_SWING 0x28

    //攻击1 攻击范围缓冲
    #define UNIT_STATE_ATTACK1_RANGE_BUFFER 0x27

    //攻击1 目标允许
    #define UNIT_STATE_ATTACK1_TARGET_TYPES 0x29

    //攻击1 溅出区域
    #define UNIT_STATE_ATTACK1_SPILL_DIST 0x56

    //攻击1 溅出半径
    #define UNIT_STATE_ATTACK1_SPILL_RADIUS 0x57

    //攻击1 武器类型
    #define UNIT_STATE_ATTACK1_WEAPON_TYPE 0x58

    // attack 2 attributes (sorted in a sequencial order based on memory address)
    //攻击2 伤害骰子数量
    #define UNIT_STATE_ATTACK2_DAMAGE_DICE 0x30

    //攻击2 伤害骰子面数
    #define UNIT_STATE_ATTACK2_DAMAGE_SIDE 0x31

    //攻击2 基础伤害
    #define UNIT_STATE_ATTACK2_DAMAGE_BASE 0x32

    //攻击2 升级奖励
    #define UNIT_STATE_ATTACK2_DAMAGE_BONUS 0x33

    //攻击2 伤害衰减参数
    #define UNIT_STATE_ATTACK2_DAMAGE_LOSS_FACTOR 0x34

    //攻击2 武器声音
    #define UNIT_STATE_ATTACK2_WEAPON_SOUND 0x35

    //攻击2 攻击类型
    #define UNIT_STATE_ATTACK2_ATTACK_TYPE 0x36

    //攻击2 最大目标数
    #define UNIT_STATE_ATTACK2_MAX_TARGETS 0x37

    //攻击2 攻击间隔
    #define UNIT_STATE_ATTACK2_INTERVAL 0x38

    //攻击2 攻击延迟
    #define UNIT_STATE_ATTACK2_INITIAL_DELAY 0x39

    //攻击2 攻击范围
    #define UNIT_STATE_ATTACK2_RANGE 0x40

    //攻击2 攻击缓冲
    #define UNIT_STATE_ATTACK2_RANGE_BUFFER 0x41

    //攻击2 最小伤害
    #define UNIT_STATE_ATTACK2_DAMAGE_MIN 0x42

    //攻击2 最大伤害
    #define UNIT_STATE_ATTACK2_DAMAGE_MAX 0x43

    //攻击2 弹射弧度
    #define UNIT_STATE_ATTACK2_BACK_SWING 0x44

    //攻击2 目标允许类型
    #define UNIT_STATE_ATTACK2_TARGET_TYPES 0x45

    //攻击2 溅出区域
    #define UNIT_STATE_ATTACK2_SPILL_DIST 0x46

    //攻击2 溅出半径
    #define UNIT_STATE_ATTACK2_SPILL_RADIUS 0x47

    //攻击2 武器类型
    #define UNIT_STATE_ATTACK2_WEAPON_TYPE 0x59

    //装甲类型
    #define UNIT_STATE_ARMOR_TYPE 0x50

    #define UNIT_STATE_RATE_OF_FIRE 0x51 // global attack rate of unit, work on both attacks
    #define UNIT_STATE_ACQUISITION_RANGE 0x52 // how far the unit will automatically look for targets
    #define UNIT_STATE_LIFE_REGEN 0x53
    #define UNIT_STATE_MANA_REGEN 0x54

    #define UNIT_STATE_MIN_RANGE 0x55
    #define UNIT_STATE_AS_TARGET_TYPE 0x60
    #define UNIT_STATE_TYPE 0x61

    #define  DEFENSE_TYPE_LIGHT 0
    #define  DEFENSE_TYPE_MEDIUM 1
    #define  DEFENSE_TYPE_LARGE 2
    #define  DEFENSE_TYPE_FORT 3
    #define  DEFENSE_TYPE_NORMAL 4
    #define  DEFENSE_TYPE_HERO 5
    #define  DEFENSE_TYPE_DIVINE 6
    #define  DEFENSE_TYPE_NONE 7
    

    #ifdef YDWEEffectIncluded
#else
    #define OPEN
    #define YDWEAbilityStateIncluded
    #define YDWEEffectIncluded
    #define YDWEJapiUnitIncluded
    #define YDWEEventDamageDataIncluded
    #define YDWEYDWEJapiScriptIncluded
    #define YDWEYDWEJapiOtherIncluded
#endif


#define SetCameraBounds(a,b,c,d,e,f,g,h) initializePlugin() YDNL call SetCameraBounds(a,b,c,d,e,f,g,h)

#ifdef OPEN
    #undef public 
#endif

#
#
#endif
