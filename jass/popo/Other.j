#ifndef OtherIncluded
#define OtherIncluded

#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

#include "japi/YDWEXweiObjectSlk.j"
#include "YDWEBase.j"
#include "DzAPI.j"
#include "nzjapi/nzjapi.j"

//  编辑器版本
#define PO_Version "v1.25"


//  其他功能
//! zinc
library Other requires japi, BzAPI, nzjapi
{
    public struct japi
    {
        private
        {
            static integer AbilityDataInteger [];
            static integer AbilityDataReal [];
            static integer AbilityDataString [];
            static integer ItemDataString [];
            static damagetype GetDamageType [];
            static weapontype GetWeaponType [];
            static attacktype GetAttackType [];
            static integer CollisionType [];
            static integer MoveType [];

            static method onInit() {
                //  单位技能整数数据类型
                AbilityDataInteger[1] = 104;    //  魔法消耗
                AbilityDataInteger[2] = 117;    //  单位类型
                AbilityDataInteger[3] = 200;    //  热键
                AbilityDataInteger[4] = 201;    //  关闭热键
                AbilityDataInteger[5] = 202;    //  学习热键

                //  单位技能实数数据类型
                AbilityDataReal[1]  = 101;      //  施放时间
                AbilityDataReal[2]  = 102;      //  持续时间(普通)
                AbilityDataReal[3]  = 103;      //  持续时间(英雄)
                AbilityDataReal[4]  = 105;      //  施放间隔
                AbilityDataReal[5]  = 106;      //  影响区域
                AbilityDataReal[6]  = 107;      //  施法距离
                AbilityDataReal[7]  = 108;      //  数据A
                AbilityDataReal[8]  = 109;      //  数据B
                AbilityDataReal[9]  = 110;      //  数据C
                AbilityDataReal[10]  = 111;      //  数据D
                AbilityDataReal[11]  = 112;      //  数据E
                AbilityDataReal[12]  = 113;      //  数据F
                AbilityDataReal[13]  = 114;     //  数据G
                AbilityDataReal[14]  = 115;     //  数据H
                AbilityDataReal[15]  = 116;     //  数据I

                //  单位技能字符串数据类型
                AbilityDataString[1]    = 203;  //  名字
                AbilityDataString[2]    = 204;  //  图标
                AbilityDataString[3]    = 205;  //  目标效果
                AbilityDataString[4]    = 206;  //  施法者效果
                AbilityDataString[5]    = 207;  //  目标点效果
                AbilityDataString[6]    = 208;  //  区域效果
                AbilityDataString[7]    = 209;  //  投射物
                AbilityDataString[8]    = 210;  //  特殊效果
                AbilityDataString[9]    = 211;  //  闪电效果
                AbilityDataString[10]    = 212; //  buff提示
                AbilityDataString[11]    = 213; //  buff提示(扩展)
                AbilityDataString[12]    = 214; //  学习提示
                AbilityDataString[13]    = 215; //  提示
                AbilityDataString[14]    = 216; //  关闭提示
                AbilityDataString[15]    = 217; //  学习提示(扩展)
                AbilityDataString[16]    = 218; //  提示(扩展)
                AbilityDataString[17]    = 219; //  关闭提示(扩展)

                //  物品字符串数据类型
                ItemDataString[1]   = 1;    // 图标
                ItemDataString[4]   = 2;    // 提示(基础)
                ItemDataString[5]   = 3;    // 提示(扩展)
                ItemDataString[2]   = 4;    // 名字
                ItemDataString[3]   = 5;    // 说明

                //  伤害类型
                GetDamageType[1]    = DAMAGE_TYPE_UNKNOWN;          // 未知
                GetDamageType[2]    = DAMAGE_TYPE_NORMAL;           // 普通
                GetDamageType[3]    = DAMAGE_TYPE_ENHANCED;         // 强化
                GetDamageType[4]    = DAMAGE_TYPE_FIRE;             // 火焰
                GetDamageType[5]    = DAMAGE_TYPE_COLD;             // 冰冻
                GetDamageType[6]    = DAMAGE_TYPE_LIGHTNING;        // 闪电
                GetDamageType[7]    = DAMAGE_TYPE_POISON;           // 毒药
                GetDamageType[8]    = DAMAGE_TYPE_DISEASE;          // 疾病
                GetDamageType[9]    = DAMAGE_TYPE_DIVINE;           // 神圣
                GetDamageType[10]    = DAMAGE_TYPE_MAGIC;           // 魔法
                GetDamageType[11]    = DAMAGE_TYPE_SONIC;           // 音速
                GetDamageType[12]    = DAMAGE_TYPE_ACID;            // 酸性
                GetDamageType[13]    = DAMAGE_TYPE_FORCE;           // 力量
                GetDamageType[14]    = DAMAGE_TYPE_DEATH;           // 死亡
                GetDamageType[15]    = DAMAGE_TYPE_MIND;            // 精神
                GetDamageType[16]    = DAMAGE_TYPE_PLANT;           // 植物
                GetDamageType[17]    = DAMAGE_TYPE_DEFENSIVE;       // 防御
                GetDamageType[18]    = DAMAGE_TYPE_DEMOLITION;      // 破坏
                GetDamageType[19]    = DAMAGE_TYPE_SLOW_POISON;     // 慢性毒药
                GetDamageType[20]    = DAMAGE_TYPE_SPIRIT_LINK;     // 灵魂锁链
                GetDamageType[21]    = DAMAGE_TYPE_SHADOW_STRIKE;   // 暗影突袭
                GetDamageType[22]    = DAMAGE_TYPE_UNIVERSAL;       // 通用

                //  武器类型
                GetWeaponType[1]    = WEAPON_TYPE_WHOKNOWS;             // 无
                GetWeaponType[2]    = WEAPON_TYPE_METAL_LIGHT_CHOP;     // 金属轻砍
                GetWeaponType[3]    = WEAPON_TYPE_METAL_MEDIUM_CHOP;    // 金属中砍
                GetWeaponType[4]    = WEAPON_TYPE_METAL_HEAVY_CHOP;     // 金属重砍
                GetWeaponType[5]    = WEAPON_TYPE_METAL_LIGHT_SLICE;    // 金属轻切
                GetWeaponType[6]    = WEAPON_TYPE_METAL_MEDIUM_SLICE;   // 金属中切
                GetWeaponType[7]    = WEAPON_TYPE_METAL_HEAVY_SLICE;    // 金属重切
                GetWeaponType[8]    = WEAPON_TYPE_METAL_MEDIUM_BASH;    // 金属中击
                GetWeaponType[9]    = WEAPON_TYPE_METAL_HEAVY_BASH;     // 金属重击
                GetWeaponType[10]    = WEAPON_TYPE_WOOD_LIGHT_BASH;     // 木头轻击
                GetWeaponType[11]    = WEAPON_TYPE_WOOD_MEDIUM_BASH;    // 木头中击
                GetWeaponType[12]    = WEAPON_TYPE_WOOD_HEAVY_BASH;     // 木头重击
                GetWeaponType[13]    = WEAPON_TYPE_AXE_MEDIUM_CHOP;     // 斧头中砍
                GetWeaponType[14]    = WEAPON_TYPE_ROCK_HEAVY_BASH;     // 岩石重击

                //  攻击类型
                GetAttackType[1]    = ATTACK_TYPE_NORMAL;   // 法术
                GetAttackType[2]    = ATTACK_TYPE_MELEE;    // 普通
                GetAttackType[3]    = ATTACK_TYPE_PIERCE;   // 穿刺
                GetAttackType[4]    = ATTACK_TYPE_SIEGE;    // 攻城
                GetAttackType[5]    = ATTACK_TYPE_MAGIC;    // 魔法
                GetAttackType[6]    = ATTACK_TYPE_CHAOS;    // 混乱
                GetAttackType[7]    = ATTACK_TYPE_HERO;     // 英雄

                //  碰撞类型
                CollisionType[1]    = 1;    //  单位
                CollisionType[2]    = 3;    //  建筑

                //  移动类型
                MoveType[1]     = 0x00;     // 没有
                MoveType[2]     = 0x01;     // 无法移动
                MoveType[3]     = 0x02;     // 步行
                MoveType[4]     = 0x04;     // 飞行
                MoveType[5]     = 0x08;     // 地雷
                MoveType[6]     = 0x10;     // 疾风步
                MoveType[7]     = 0x20;     // 未知
                MoveType[8]     = 0x40;     // 漂浮(水)
                MoveType[9]     = 0x80;     // 两栖
            }
        }

        public
        {
            //  获取单位技能冷却时间(u:单位  abilcode:技能)
            static method GetAbilityState (unit u, integer abilcode) -> real {
                return EXGetAbilityState(EXGetUnitAbility(u, abilcode), 1);
            }

            //  获取单位技能数据(整数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型)
            //  数据类型    [1.魔法消耗  2.单位类型  3.热键  4.关闭热键  5.学习热键]
            static method GetAbilityDataInteger (unit u, integer abilcode, integer level, integer data_type) -> integer {
                return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, AbilityDataInteger[data_type]);
            }

            //  获取单位技能数据(实数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型)
            //  数据类型    [1.施放时间  2.持续时间(普通)  3.持续时间(英雄)  4.施放间隔  5.影响区域  6.施法距离  7.数据A  8.数据B  9.数据C  10.数据D  11.数据E  12.数据F  13.数据G  14.数据H  15.数据I]
            static method GetAbilityDataReal (unit u, integer abilcode, integer level, integer data_type) -> real {
                return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, AbilityDataReal[data_type]);
            }
            
            //  获取单位技能数据(字符串)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型)
            //  数据类型    [1.名字  2.图标  3.目标效果  4.施法者效果  5.目标点效果  6.区域效果  7.投射物  8.特殊效果  9.闪电效果  10.buff提示  11.buff提示(扩展)  12.学习提示  13.提示  14.关闭提示  15.学习提示(扩展) 16.提示(扩展) 17.关闭提示(扩展)]
            static method GetAbilityDataString (unit u, integer abilcode, integer level, integer data_type) -> string {
                return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, AbilityDataString[data_type]);
            }

            //  设置单位技能冷却时间(u:单位  abilcode:技能  value:数值)
            static method SetAbilityState (unit u, integer abilcode, real value) -> boolean {
                return EXSetAbilityState(EXGetUnitAbility(u, abilcode), 1, value);
            }

            //  设置单位技能数据(整数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型  value:数值)
            //  数据类型    [1.魔法消耗  2.单位类型  3.热键  4.关闭热键  5.学习热键]
            static method SetAbilityDataInteger (unit u, integer abilcode, integer level, integer data_type, integer value) -> boolean {
                return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, AbilityDataInteger[data_type], value);
            }

            //  设置单位技能数据(实数)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型  value:数值)
            //  数据类型    [1.施放时间  2.持续时间(普通)  3.持续时间(英雄)  4.施放间隔  5.影响区域  6.施法距离  7.数据A  8.数据B  9.数据C  10.数据D  11.数据E  12.数据F  13.数据G  14.数据H  15.数据I]
            static method SetAbilityDataReal (unit u, integer abilcode, integer level, integer data_type, real value) -> boolean {
                return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, AbilityDataReal[data_type], value);
            }
            
            //  设置单位技能数据(字符串)(u:单位  abilcode:技能  level:技能等级  data_type:数据类型  value:数值)
            //  数据类型    [1.名字  2.图标  3.目标效果  4.施法者效果  5.目标点效果  6.区域效果  7.投射物  8.特殊效果  9.闪电效果  10.buff提示  11.buff提示(扩展)  12.学习提示  13.提示  14.关闭提示  15.学习提示(扩展) 16.提示(扩展) 17.关闭提示(扩展)]
            static method SetAbilityDataString (unit u, integer abilcode, integer level, integer data_type, string value) -> boolean {
                return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, AbilityDataString[data_type], value);
            }

            //  获取物品或单位数据(字符串)(itemcode:物品类型或单位类型  data_type:数据类型)
            //  数据类型    [1.图标  2.名字  3.说明  4.基础  5.扩展]
            static method GetItemDataString (integer itemcode, integer data_type) -> string {
                return EXGetItemDataString(itemcode, ItemDataString[data_type]);
            }
        
            //  设置物品或单位数据(字符串)(itemcode:物品类型或单位类型  data_type:数据类型  value:数值)
            //  数据类型    [1.图标  2.名字  3.说明  4.基础  5.扩展]
            static method SetItemDataString (integer itemcode, integer data_type, string value) -> boolean {
                return EXSetItemDataString(itemcode, ItemDataString[data_type], value);
            }

            //1.  单位受到的伤害类型(edd_type:数据类型)
            //2.  数据类型    [1.物理伤害  2.攻击伤害  3.远程伤害]
            static method GetEventDamageData (integer edd_type) -> boolean {
                return 0 != EXGetEventDamageData(edd_type);
            }

            //  单位所受伤害的伤害类型(damageType:伤害类型)
            //  伤害类型    [1.未知  2.普通  3.强化  4.火焰  5.冰冻  6.闪电  7.毒药  8.疾病  9.神圣  10.魔法  11.音速  12.酸性  13.力量  14.死亡  15.精神  16.植物  17.防御  18.破坏  19.慢性毒药  20.灵魂锁链  21.暗影突袭  22.通用]
            static method IsEventDamageType (integer damageType) -> boolean {
                return GetDamageType[damageType] == ConvertDamageType(EXGetEventDamageData(4));
            }

            //  伤害类型    [1.未知  2.普通  3.强化  4.火焰  5.冰冻  6.闪电  7.毒药  8.疾病  9.神圣  10.魔法  11.音速  12.酸性  13.力量  14.死亡  15.精神  16.植物  17.防御  18.破坏  19.慢性毒药  20.灵魂锁链  21.暗影突袭  22.通用]
            static method EventDamageType (integer damageType) -> damagetype {
                return GetDamageType[damageType];
            }

            //  单位所受伤害的武器类型(weaponType:武器类型)
            //  武器类型    [1.无  2.金属轻砍  3.金属中砍  4.金属重砍  5.金属轻切  6.金属中切  7.金属重切  8.金属中击  9.金属重击  10.木头轻击  11.木头中击  12.木头重击  13.斧头中砍  14.岩石重击]
            static method IsEventWeaponType (integer weaponType) -> boolean {
                return GetWeaponType[weaponType] == ConvertWeaponType(EXGetEventDamageData(5));
            }

            //  武器类型    [1.无  2.金属轻砍  3.金属中砍  4.金属重砍  5.金属轻切  6.金属中切  7.金属重切  8.金属中击  9.金属重击  10.木头轻击  11.木头中击  12.木头重击  13.斧头中砍  14.岩石重击]
            static method EventWeaponType (integer weaponType) -> weapontype {
                return GetWeaponType[weaponType];
            }

            //  单位所受伤害的攻击类型(attackType:攻击类型)
            //  攻击类型    [1.法术  2.普通  3.穿刺  4.攻城  5.魔法  6.混乱  7.英雄]
            static method IsEventAttackType (integer attackType) -> boolean {
                return GetAttackType[attackType] == ConvertAttackType(EXGetEventDamageData(6));
            }

            //  攻击类型    [1.法术  2.普通  3.穿刺  4.攻城  5.魔法  6.混乱  7.英雄]
            static method EventAttackType (integer attackType) -> attacktype {
                return GetAttackType[attackType];
            }

            //  获取伤害值
            static method getEventDamage () -> real {
                return GetEventDamage();
            }
            
            //  设置伤害值(amount:伤害值)
            static method SetEventDamage (real amount) {
                EXSetEventDamage(amount);
            }

            //  获取特效X坐标
            static method GetEffectX (effect e) -> real {
                return EXGetEffectX(e);
            }

            //  获取特效Y坐标
            static method GetEffectY (effect e) -> real {
                return EXGetEffectY(e);
            }

            //  获取特效高度
            static method GetEffectZ (effect e) -> real {
                return EXGetEffectZ(e);
            }

            //  移动特效到坐标
            static method SetEffectXY (effect e, real x, real y) {
                EXSetEffectXY(e, x, y);
            }

            //  移动特效到高度
            static method SetEffectZ (effect e, real z) {
                EXSetEffectZ(e, z);
            }

            //  获取特效大小
            static method GetEffectSiz (effect e) -> real {
                return EXGetEffectSize(e);
            }

            //  设置特效大小
            static method SetEffectSize (effect e, real size) {
                EXSetEffectSize(e, size);
            }

            //  设置特效绕X轴旋转
            static method EffectMatRotateX (effect e, real angle) {
                EXEffectMatRotateX(e, angle);
            }

            //  设置特效绕Y轴旋转
            static method EffectMatRotateY (effect e, real angle) {
                EXEffectMatRotateY(e, angle);
            }

            //  设置特效绕Z轴旋转
            static method EffectMatRotateZ (effect e, real angle) {
                EXEffectMatRotateZ(e, angle);
            }

            //  设置特效缩放
            static method EffectMatScale (effect e, real x, real y, real z) {
                EXEffectMatScale(e, x, y, z);
            }

            //  重置特效变换
            static method EffectMatReset (effect e) {
                EXEffectMatReset(e);
            }
            
            //  设置特效动画速度
            static method SetEffectSpeed (effect e, real speed) {
                EXSetEffectSpeed(e, speed);
            }

            //  设置单位面向角度
            static method SetUnitFacing (unit u, real angle) {
                EXSetUnitFacing(u, angle);
            }

            //  设置单位的碰撞类型(enable:开关  u:碰撞单位  t:碰撞类型)
            //  碰撞类型    [1.单位  2.建筑]
            static method SetUnitCollisionType (boolean enable, unit u, integer t) {
                EXSetUnitCollisionType(enable, u, CollisionType[t]);
            }

            //  设置单位的移动类型(u:单位  t:移动类型)
            //  移动类型    [1.没有  2.无法移动  3.步行  4.飞行  5.地雷  6.疾风步  7.未知  8.漂浮(水)  9.两栖]
            static method SetUnitMoveType (unit u, integer t) {
                EXSetUnitMoveType(u, MoveType[t]);
            }
        }
    }

    private {
        hashtable ht = InitHashtable();
        real Speel_X, Speel_Y, Screen_X, Screen_Y;
        unit Speel_U;
        location Loc = Location(0 ,0);
        string HexMap[];
        string I2ASCII[];
        string suffixes[];



        #define Point_MAX_RANGE 10
        #define Point_DUMMY_ITEM_ID 'wolg'
        item pItem = null;
        rect pFind = null;
        item pHid[];
        integer HidMax = 0;
        real pX = 0.0;
        real pY = 0.0;
        unit Majia;

        //  初始化
        function onInit () {
            integer i;
            HexMap[0] = "0";
            HexMap[1] = "1";
            HexMap[2] = "2";
            HexMap[3] = "3";
            HexMap[4] = "4";
            HexMap[5] = "5";
            HexMap[6] = "6";
            HexMap[7] = "7";
            HexMap[8] = "8";
            HexMap[9] = "9";
            HexMap[10] = "a";
            HexMap[11] = "b";
            HexMap[12] = "c";
            HexMap[13] = "d";
            HexMap[14] = "e";
            HexMap[15] = "f";
            HexMap[16] = "g";
            HexMap[17] = "h";
            HexMap[18] = "i";
            HexMap[19] = "j";
            HexMap[20] = "k";
            HexMap[21] = "l";
            HexMap[22] = "m";
            HexMap[23] = "n";
            HexMap[24] = "o";
            HexMap[25] = "p";
            HexMap[26] = "q";
            HexMap[27] = "r";
            HexMap[28] = "s";
            HexMap[29] = "t";
            HexMap[30] = "u";
            HexMap[31] = "v";
            HexMap[32] = "w";
            HexMap[33] = "x";
            HexMap[34] = "y";
            HexMap[35] = "z";
            HexMap[36] = "A";
            HexMap[37] = "B";
            HexMap[38] = "C";
            HexMap[39] = "D";
            HexMap[40] = "E";
            HexMap[41] = "F";
            HexMap[42] = "G";
            HexMap[43] = "H";
            HexMap[44] = "I";
            HexMap[45] = "J";
            HexMap[46] = "K";
            HexMap[47] = "L";
            HexMap[48] = "M";
            HexMap[49] = "N";
            HexMap[50] = "O";
            HexMap[51] = "P";
            HexMap[52] = "Q";
            HexMap[53] = "R";
            HexMap[54] = "S";
            HexMap[55] = "T";
            HexMap[56] = "U";
            HexMap[57] = "V";
            HexMap[58] = "W";
            HexMap[59] = "X";
            HexMap[60] = "Y";
            HexMap[61] = "Z";
            for (0 <= i < 36) {
                SaveInteger(ht, StringHash("36进制"), StringHash(HexMap[i]), i);
            }
            for (0 <= i < 62) {
                SaveInteger(ht, StringHash("62进制"), StringHash(HexMap[i]), i);
            }
            for (0 < i < 33) {
                I2ASCII[i] = " ";
            }
            I2ASCII[33] = "!";
            I2ASCII[34] = " ";
            I2ASCII[35] = "#";
            I2ASCII[36] = "$";
            I2ASCII[37] = "%";
            I2ASCII[38] = "&";
            I2ASCII[39] = "'";
            I2ASCII[40] = "(";
            I2ASCII[41] = ")";
            I2ASCII[42] = "*";
            I2ASCII[43] = "+";
            I2ASCII[44] = ",";
            I2ASCII[45] = "-";
            I2ASCII[46] = ".";
            I2ASCII[47] = "/";
            I2ASCII[48] = "0";
            I2ASCII[49] = "1";
            I2ASCII[50] = "2";
            I2ASCII[51] = "3";
            I2ASCII[52] = "4";
            I2ASCII[53] = "5";
            I2ASCII[54] = "6";
            I2ASCII[55] = "7";
            I2ASCII[56] = "8";
            I2ASCII[57] = "9";
            I2ASCII[58] = ":";
            I2ASCII[59] = ";";
            I2ASCII[60] = "<";
            I2ASCII[61] = "=";
            I2ASCII[62] = ">";
            I2ASCII[63] = "?";
            I2ASCII[64] = "@";
            I2ASCII[65] = "A";
            I2ASCII[66] = "B";
            I2ASCII[67] = "C";
            I2ASCII[68] = "D";
            I2ASCII[69] = "E";
            I2ASCII[70] = "F";
            I2ASCII[71] = "G";
            I2ASCII[72] = "H";
            I2ASCII[73] = "I";
            I2ASCII[74] = "J";
            I2ASCII[75] = "K";
            I2ASCII[76] = "L";
            I2ASCII[77] = "M";
            I2ASCII[78] = "N";
            I2ASCII[79] = "O";
            I2ASCII[80] = "P";
            I2ASCII[81] = "Q";
            I2ASCII[82] = "R";
            I2ASCII[83] = "S";
            I2ASCII[84] = "T";
            I2ASCII[85] = "U";
            I2ASCII[86] = "V";
            I2ASCII[87] = "W";
            I2ASCII[88] = "X";
            I2ASCII[89] = "Y";
            I2ASCII[90] = "Z";
            I2ASCII[91] = "[";
            I2ASCII[92] = " ";
            I2ASCII[93] = "]";
            I2ASCII[94] = "^";
            I2ASCII[95] = "_";
            I2ASCII[96] = "`";
            I2ASCII[97] = "a";
            I2ASCII[98] = "b";
            I2ASCII[99] = "c";
            I2ASCII[100] = "d";
            I2ASCII[101] = "e";
            I2ASCII[102] = "f";
            I2ASCII[103] = "g";
            I2ASCII[104] = "h";
            I2ASCII[105] = "i";
            I2ASCII[106] = "j";
            I2ASCII[107] = "k";
            I2ASCII[108] = "l";
            I2ASCII[109] = "m";
            I2ASCII[110] = "n";
            I2ASCII[111] = "o";
            I2ASCII[112] = "p";
            I2ASCII[113] = "q";
            I2ASCII[114] = "r";
            I2ASCII[115] = "s";
            I2ASCII[116] = "t";
            I2ASCII[117] = "u";
            I2ASCII[118] = "v";
            I2ASCII[119] = "w";
            I2ASCII[120] = "x";
            I2ASCII[121] = "y";
            I2ASCII[122] = "z";
            I2ASCII[123] = "{";
            I2ASCII[124] = "|";
            I2ASCII[125] = "}";
            I2ASCII[126] = "~";
            for (126 < i < 255) {
                I2ASCII[i] = " ";
            }
            for (0 < i < 255) {
                SaveInteger(ht, StringHash("ASCII"), StringHash(I2ASCII[i]), i);
            }

            suffixes[1] = "";
            suffixes[2] = "万";
            suffixes[3] = "亿";
            suffixes[4] = "兆";
            suffixes[5] = "京";
            suffixes[6] = "垓";
            suffixes[7] = "秭";
            suffixes[8] = "穰";
            suffixes[9] = "沟";
            suffixes[10] = "涧";
            suffixes[11] = "正";
            suffixes[12] = "载";
            suffixes[13] = "极";
            suffixes[14] = "恒河沙";

            pFind = Rect(0., 0., 128., 128.);
            pItem = CreateItem(Point_DUMMY_ITEM_ID, 0, 0);
            SetItemVisible(pItem, false);

            <?
            local obj
            local jn
            local mf
            local slk = require 'slk'
            -- 被击晕的
            obj=slk.buff.BPSE:new"被击晕的"
            mf=obj:get_id()
            -- 效果 - 目标
            obj.TargetArt = ""
            -- 效果 - 目标附加点
            obj.Targetattach = ""

            -- 眩晕技能
            obj=slk.ability.AHtb:new"眩晕技能"
            jn=obj:get_id()
            -- 名字
            obj.Name="眩晕技能"
            -- 伤害
            obj.DataA=0
            -- 施法动作
            obj.Animnames = ""
            -- 魔法施放时间间隔
            obj.Cool = 0.
            -- 投射物图像
            obj.Missileart = ""
            -- 射弹速度
            obj.Missilespeed = 0
            -- 施法距离
            obj.Rng = 1000000000.
            -- 英雄技能
            obj.hero = 0
            -- 等级
            obj.levels = 1
            -- 目标允许
            obj.targs = ""
            -- 种族
            obj.race = "other"
            -- 魔法效果
            obj.BuffID = mf
            -- 持续时间 - 普通
            obj.Dur = 0.
            -- 持续时间 - 英雄
            obj.HeroDur = 0.
            -- 魔法消耗
            obj.Cost = 0.

            -- 万能马甲
            obj = slk.unit.ewsp:new "万能马甲"
            -- 名字
            obj.Name = "万能马甲"
            -- 模型
            obj.file = ""
            -- 技能
            obj.abilList = "Avul,Aloc," .. jn
            -- 魔法释放回复
            obj.castbsw = 0
            -- 移送速度
            obj.spd = 0
            -- 占用人口
            obj.fused = 0
            -- 类别
            obj.type = "neutral"
            ?>
            Majia = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), '<?=obj:get_id()?>', 0, 0, 0);
            #define Giddiness_Buff_ID '<?=mf?>'
        }

        //  获取通魔技能的数据--目标类型
        function DataB (integer jn) -> integer {
            return YDWEGetObjectPropertyInteger(YDWE_OBJECT_TYPE_ABILITY, jn, "DataB1");
        }

        //  获取通魔技能的数据--基础命令ID
        function DataF (integer jn) -> string {
            return YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ABILITY, jn, "DataF1");
        }

        //  获取常规技能的数据--命令串
        function Order (integer jn) -> string {
            return YDWEGetObjectPropertyString(YDWE_OBJECT_TYPE_ABILITY, jn, "Order");
        }

        //  单位组直线选取
        function PO_SelectInLineUnitsCondition (unit u, real x, real y, real angle, real width) -> boolean {
            real x1 = GetUnitX(u) - x;
            real y1 = GetUnitY(u) - y;
            return ( TanBJ(angle) * x1 - y1 ) * ( TanBJ(angle) * x1 - y1 ) - width / CosBJ(angle) * 0.5 * width / CosBJ(angle) * 0.5 <= 0;
        }
    }

    public {
        string PO_font = "FZDBSJW.ttf";
        hashtable POHT = InitHashtable();

        //  单位目标类型
        function Cast_Spell_C (unit u) -> integer {
            Speel_U = u;
            return 3;
        }

        //  坐标目标类型
        function Cast_Spell_B (real x, real y) -> integer {
            Speel_X = x;
            Speel_Y = y;
            return 2;
        }

        //  无目标类型
        function Cast_Spell_A () -> integer {
            return 1;
        }

        //  命令单位施放技能
        function Cast_Spell (unit u, integer jn, integer z) {
            string str = Order(jn);
            if (str == "channel") str = DataF(jn);
            if (z == 1) IssueImmediateOrder(u, str);
            else if (z == 2) IssuePointOrder(u, str, Speel_X, Speel_Y);
            else IssueTargetOrder(u, str, Speel_U);
        }

        //  判断通魔技能的目标类型
        function Judge_Spell (integer jn, integer i) -> boolean {
            if (DataB(jn) == i && Order(jn) == "channel") return true;
            else return false;
        }

        //  实数 - 坐标X位移
        function PO_MobileX (real X, real Dist, real Angle)  -> real {
            return X + Dist * Cos(Angle * bj_DEGTORAD);
        }

        //  实数 - 坐标Y位移
        function PO_MobileY (real Y, real Dist, real Angle)  -> real {
            return Y + Dist * Sin(Angle * bj_DEGTORAD);
        }

        //  角度 - 坐标到坐标的角度
        function PO_DegXY (real x, real y, real x1, real y1)  -> real {
            return Atan2(y1 - y ,x1 - x) * bj_RADTODEG;
        }

        //  实数 - 坐标到坐标的距离
        function PO_DisXY (real x, real y, real x1, real y1)  -> real {
            return SquareRoot(Pow(x - x1, 2.00) + Pow(y - y1, 2.00));
        }

        //  实数 - 获取坐标高度
        function PO_PosH (real x, real y)  -> real {
            MoveLocation(Loc, x, y);
            return GetLocationZ(Loc);
        }

        //  实数转字符串(去小数点)
        function PO_R2S (real s)  -> string {
            return I2S(R2I(s));
        }

        //  玩家单位的ID
        function PO_PlayUnitId (unit u)  -> integer {
            return GetConvertedPlayerId(GetOwningPlayer(u));
        }

        //  实数取整转整数
        function PO_miR2I(real r)     ->integer { return R2I(r + 0.501); }

        //  实数取整转字符串
        function PO_miR2S(real r)     ->string { return I2S(PO_miR2I(r)); }

        //  实数取整
        function PO_miR2R(real r)     ->real { return I2R(PO_miR2I(r)); }

        //  实数取整转百分比字符串
        function PO_miR2SP(real r)    ->string { return I2S(R2I(r * 100 + 0.501)); }

        //  实数转百分比字符串
        function PO_miR2SP1(real r)    ->string { return R2SW(r * 100,1,1); }

        // 替换字符串，替换str里面的pattern内容为value，count为替换次数，少于1则是代表替换所有
        function PO_gsub(string str, string pattern, string value, integer count) ->string {
            string Code = "";
            if (count < 1) {
                Code = EXExecuteScript("string.gsub('" + str + "', '" + pattern + "', '" + value + "')");
            } else {
                Code = EXExecuteScript("string.gsub('" + str + "', '" + pattern + "', '" + value + "', " + I2S(count) + ")");
            }
            return Code;
        }

        //  设置单位X、Y坐标
        function PO_SetUnitXY (unit whichUnit, real newX, real newY) {
            SetUnitX(whichUnit, YDWECoordinateX(newX));
            SetUnitY(whichUnit, YDWECoordinateY(newY));
        }

        //  清空并删除单位组
        function PO_DestroyGroupClear (group whichGroup) {
            GroupClear(whichGroup);
            DestroyGroup(whichGroup);
        }

        //  添加删除技能
        function PO_AddDelAbility (unit u,integer i, integer jn, boolean bl) {
            if (i == 1) {
                UnitAddAbility(u, jn);
                UnitMakeAbilityPermanent(u, bl, jn);
            } else {
                UnitRemoveAbility(u, jn);
            }
        }

        //  设置单位属性
        function PO_SetUnitState (unit whichUnit, unitstate whichUnitState, integer modifyMethod, real newVal) {
            if (modifyMethod == bj_MODIFYMETHOD_ADD) {
                SetUnitState(whichUnit, whichUnitState, GetUnitState(whichUnit, whichUnitState) + newVal);
            } else if (modifyMethod == bj_MODIFYMETHOD_SUB) {
                SetUnitState(whichUnit, whichUnitState, GetUnitState(whichUnit, whichUnitState) - newVal);
            } else {
                SetUnitState(whichUnit, whichUnitState, newVal);
            }
        }

        //  镜头 - 平移镜头(指定玩家)(限时)(坐标) [P]
        function PO_PanCameraToTimed1 (player whichPlayer, real x, real y, real duration) {
            if (GetLocalPlayer() == whichPlayer) {
                PanCameraToTimed(x, y, duration);
            }
        }

        //  镜头 - 平移镜头(指定玩家)(限时)(单位) [P]
        function PO_PanCameraToTimed2 (player whichPlayer, unit u, real duration) {
            if (GetLocalPlayer() == whichPlayer) {
                PanCameraToTimed(GetUnitX(u), GetUnitY(u), duration);
            }
        }

        //  单位传送并转移镜头
        function PO_SetUnitMobile (unit u, real x,real y) {
            integer c = PO_PlayUnitId(u);
            SetUnitPosition(u, x, y);
            if (Player(c-1) == GetLocalPlayer()) {
                PanCameraToTimed(x, y, 0.);
            }
        }

        //  单位组 - 坐标范围内的指定单位
        function PO_CreateGroupEnumUnits (real x, real y, real s, boolexpr filter)  -> group {
            group g = CreateGroup();
            GroupEnumUnitsInRange(g, x, y, s, filter);
            DestroyBoolExpr(filter);
            return g;
        }

        //  单位组 - 方形范围内的指定单位
        function PO_SelectInLineUnits (real x, real y, real angle, real length, real width, boolexpr filter) -> group {
            group selectGroup = CreateGroup();
            group g = CreateGroup();
            unit a = null;
            real selectAngle = angle;
            real x1 = 0;
            real y1 = 0;
            if (selectAngle < 0) {
                selectAngle = selectAngle + 360;
            }
            x1 = x + length * CosBJ(selectAngle) / 2;
            y1 = y + length * SinBJ(selectAngle) / 2;
            GroupEnumUnitsInRange(selectGroup, x1, y1, length / 2, filter);
            GroupAddGroup(selectGroup, g);
            a = FirstOfGroup(g);
            while (a != null) {
                if (PO_SelectInLineUnitsCondition(a, x, y, angle, width) == false) {
                    GroupRemoveUnit( selectGroup, a );
                }
                GroupRemoveUnit(g, a);
                a = FirstOfGroup(g);
            }
            DestroyGroup(g);
            DestroyBoolExpr(filter);
            a = null;
            g = null;
            return selectGroup;
        }

        //  单位组 - 扇形范围内的指定单位
        function PO_SelectSectorUnits(real x, real y, real s, real jd, real degrees, boolexpr filter) -> group {
            group selectGroup = CreateGroup();
            group g = CreateGroup();
            unit a = null;
            GroupEnumUnitsInRange(selectGroup, x, y, s, filter);
            GroupAddGroup(selectGroup, g);
            a = FirstOfGroup(g);
            while (a != null) {
                if (CosBJ(Atan2BJ(GetUnitY(a) - y ,GetUnitX(a) - x) - jd) < CosBJ(degrees * 0.5)) {
                    GroupRemoveUnit( selectGroup, a );
                }
                GroupRemoveUnit(g, a);
                a = FirstOfGroup(g);
            }
            DestroyGroup(g);
            DestroyBoolExpr(filter);
            a = null;
            g = null;
            return selectGroup;
        }

        //  单位组 - 坐标范围内的指定单位
        function PO_CreateGroupEnumUnits2(real x, real y, real s)  -> group {
            group g = CreateGroup();
            GroupEnumUnitsInRange(g, x, y, s, null);
            return g;
        }

        //  单位组 - 方形范围内的指定单位
        function PO_SelectInLineUnits2(real x, real y, real angle, real length, real width) -> group {
            group selectGroup = CreateGroup();
            group g = CreateGroup();
            unit a = null;
            real selectAngle = angle;
            real x1 = 0;
            real y1 = 0;
            if (selectAngle < 0) {
                selectAngle = selectAngle + 360;
            }
            x1 = x + length * CosBJ(selectAngle) / 2;
            y1 = y + length * SinBJ(selectAngle) / 2;
            GroupEnumUnitsInRange(selectGroup, x1, y1, length / 2, null);
            GroupAddGroup(selectGroup, g);
            a = FirstOfGroup(g);
            while (a != null) {
                if (PO_SelectInLineUnitsCondition(a, x, y, angle, width) == false) {
                    GroupRemoveUnit( selectGroup, a );
                }
                GroupRemoveUnit(g, a);
                a = FirstOfGroup(g);
            }
            DestroyGroup(g);
            a = null;
            g = null;
            return selectGroup;
        }

        //  单位组 - 扇形范围内的指定单位
        function PO_SelectSectorUnits2(real x, real y, real s, real jd, real degrees) -> group {
            group selectGroup = CreateGroup();
            group g = CreateGroup();
            unit a = null;
            GroupEnumUnitsInRange(selectGroup, x, y, s, null);
            GroupAddGroup(selectGroup, g);
            a = FirstOfGroup(g);
            while (a != null) {
                if (CosBJ(Atan2BJ(GetUnitY(a) - y ,GetUnitX(a) - x) - jd) < CosBJ(degrees * 0.5)) {
                    GroupRemoveUnit( selectGroup, a );
                }
                GroupRemoveUnit(g, a);
                a = FirstOfGroup(g);
            }
            DestroyGroup(g);
            a = null;
            g = null;
            return selectGroup;
        }

        //  36进制转10进制整数
        function PO_Inverse36System (string s)  -> integer {
            integer i;
            integer a;
            integer b;
            integer c = 0;
            integer i1 = StringLength(s);
            if (s == "") {
                return 0;
            }
            for (0 < i <= i1) {
                a = LoadInteger(ht, strHash("36进制"), StringHash(SubStringBJ(s, i, i)));
                b = a * R2I(Pow(36, I2R(i1 - i)));
                c = c + b;
            }
            return c;
        }
        
        //  10进制转36进制字符串
        function PO_36System (integer i, integer len)  -> string {
            integer a, index;
            string s = "";
            while (i > 0) {
                a = ModuloInteger(i, 36);
                i = i / 36;
                s = HexMap[a] + s;
            }
            if (len == 0) {
                return s;
            }
            if (StringLength(s)>len) {
                s = "";
                for (1 <= index <= len) {
                    s = s + HexMap[35];
                }
            } else if (StringLength(s)<len) {
                len = len - StringLength(s);
                for (1 <= index <= len) {
                    s = HexMap[0] + s;
                }
            }
            return s;
        }

        //  62进制转10进制整数
        function PO_Inverse62System (string s)  -> integer {
            integer i;
            integer a;
            integer b;
            integer c = 0;
            integer i1 = StringLength(s);
            if (s == "") {
                return 0;
            }
            for (0 < i <= i1) {
                a = LoadInteger(ht, strHash("62进制"), StringHash(SubStringBJ(s, i, i)));
                b = a * R2I(Pow(62, I2R(i1 - i)));
                c = c + b;
            }
            return c;
        }

        //  10进制转62进制字符串
        function PO_62System (integer i, integer len)  -> string {
            integer a, index;
            string s = "";
            while (i > 0) {
                a = ModuloInteger(i, 62);
                i = i / 62;
                s = HexMap[a] + s;
            }
            if (len == 0) {
                return s;
            }
            if (StringLength(s)>len) {
                s = "";
                for (1 <= index <= len) {
                    s = s + HexMap[61];
                }
            } else if (StringLength(s)<len) {
                len = len - StringLength(s);
                for (1 <= index <= len) {
                    s = HexMap[0] + s;
                }
            }
            return s;
        }

        //  92进制转10进制整数
        function PO_Inverse92System (string s)  -> integer {
            GetTriggerPlayer();
            return 0;
        }

        //  10进制转92进制字符串
        function PO_92System (integer i, integer len)  -> string {
            GetTriggerPlayer();
            return "";
        }

        //  整数转ASCII编码
        function PO_GetI2ASCII (integer i) -> string {
            integer a;
            string s = "";
            while(i > 0){
                a = ModuloInteger(i, 256);
                i = i / 256;
                s = I2ASCII[a] + s;
            }
            return s;
        }

        //  实数转字符串 万 亿 兆 京自动替换
        function PO_R2SWY(real num, integer l, integer i) -> string {
            string num_str = I2S(R2I(num));
            integer len = StringLength(num_str);
            integer mod = 1;
            while (len>4+l) {
                len -= 4;
                mod += 1;
                num /= 10000;
            }
            if (i>0) {
                return R2SW(num,1,i) + suffixes[mod];
            } else {
                return I2S(R2I(num)) + suffixes[mod];
            }
        }

        //  创建漂浮文字在单位 [C]
        function PO_CreateTextTagUnit_C (string s, unit whichUnit, real zOffset, real size, integer red, integer green, integer blue, integer transparency)  -> texttag {
            bj_lastCreatedTextTag = CreateTextTag();
            SetTextTagText(bj_lastCreatedTextTag, s, size);
            SetTextTagPosUnit(bj_lastCreatedTextTag, whichUnit, zOffset);
            SetTextTagColor(bj_lastCreatedTextTag, red, green, blue, transparency);
            return bj_lastCreatedTextTag;
        }

        //  坐标漂浮文字
        function PO_CreateTextTagMark (string s, real x, real y, real zOffset, real size, real red, real green, real blue, real transparency)  -> texttag {
            bj_lastCreatedTextTag = CreateTextTag();
            SetTextTagTextBJ(bj_lastCreatedTextTag, s, size);
            SetTextTagPos(bj_lastCreatedTextTag, x, y, zOffset);
            SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency);
            return bj_lastCreatedTextTag;
        }

        //  坐标漂浮文字 [C]
        function PO_CreateTextTagMark_C (string s, real x, real y, real zOffset, real size, integer red, integer green, integer blue, integer transparency)  -> texttag {
            bj_lastCreatedTextTag = CreateTextTag();
            SetTextTagText(bj_lastCreatedTextTag, s, size);
            SetTextTagPos(bj_lastCreatedTextTag, x, y, zOffset);
            SetTextTagColor(bj_lastCreatedTextTag, red, green, blue, transparency);
            return bj_lastCreatedTextTag;
        }

        // 单位进入区域
        function PO_TriggerRegisterEnterRectSimple (trigger trig, rect r) -> event {
            region rectRegion = CreateRegion();
            RegionAddRect(rectRegion, r);
            SaveRectHandle(ht, GetHandleId(rectRegion), strHash("矩形区域"), r);
            return TriggerRegisterEnterRegion(trig, rectRegion, null);
        }

        // 单位离开区域
        function PO_TriggerRegisterLeaveRectSimple (trigger trig, rect r) -> event {
            region rectRegion = CreateRegion();
            RegionAddRect(rectRegion, r);
            SaveRectHandle(ht, GetHandleId(rectRegion), strHash("矩形区域"), r);
            return TriggerRegisterLeaveRegion(trig, rectRegion, null);
        }
        
        //  触发区域（矩形区域）
        function PO_GetTriggeringRect ()  -> rect {
            return LoadRectHandle(ht, GetHandleId(GetTriggeringRegion()), strHash("矩形区域"));
        }

        //  判断坐标是否可通过
        function PO_IsWalkable(real x, real y) ->boolean {
            // 隐藏该区域中的任何项目以避免与我们的项目冲突
            MoveRectTo(pFind, x, y);
            EnumItemsInRect(pFind, null, function() {
                if (IsItemVisible(GetEnumItem())) {
                    pHid[HidMax] = GetEnumItem();
                    SetItemVisible(pHid[HidMax], false);
                    HidMax +=1;
                }
            });
            // 尝试移动测试项并获取其坐标
            SetItemPosition(pItem, x, y);
            pX = GetItemX(pItem);
            pY = GetItemY(pItem);
            // 再藏起来
            SetItemVisible(pItem, false);
            // 取消隐藏开始时隐藏的任何项目
            while (HidMax > 0) {
                HidMax -=1;
                SetItemVisible(pHid[HidMax], true);
                pHid[HidMax] = null;
            }
            // 返回可行走性
            return PO_DisXY(pX, pY, x, y) <= Point_MAX_RANGE && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY);
        }

        //  目标是否死亡
        function PO_IsDead(unit u) -> boolean {
            return (IsUnitType(u, UNIT_TYPE_DEAD) == true) || (R2I(GetUnitState(u, UNIT_STATE_LIFE)) < 1);
        }

        //  获取万能马甲
        function PO_majia() -> unit { return Majia; }

        //  眩晕目标
        function PO_Vertigo(unit u, real s) {
            integer jn = '<?=jn?>';
            if (PO_IsDead(u)) {
            } else {
                japi.SetAbilityDataReal(Majia, jn, 1, 2, s);
                japi.SetAbilityDataReal(Majia, jn, 1, 3, s);
                IssueTargetOrder(Majia, "thunderbolt", u);
            }
        }

        //  击退目标
        function PO_Repel(unit u, real deg, real spd, real dis, real s)  -> nothing {
            timer t;
            integer hand;
            boolean switch = false;
            if (HaveSavedHandle(ht, GetHandleId(u), strHash("击退计时器"))) {
                t = LoadTimerHandle(ht, GetHandleId(u), strHash("击退计时器"));
            } else {
                t = CreateTimer();
                SaveTimerHandle(ht, GetHandleId(u), strHash("击退计时器"), t);
                switch = true;
            }
            hand = GetHandleId(t);
            SaveUnitHandle(ht, hand, strHash("u"), u);
            SaveReal(ht, hand, strHash("deg"), deg);
            SaveReal(ht, hand, strHash("spd"), spd);
            SaveReal(ht, hand, strHash("dis"), dis);
            SaveReal(ht, hand, strHash("jl"), 0);
            SaveBoolean(POHT, GetHandleId(u), strHash("击退状态"), true);
            if (switch) {
                TimerStart(t, s, true, function(){
                    timer t = GetExpiredTimer();
                    integer hand = GetHandleId(t);
                    unit u = LoadUnitHandle(ht, hand, strHash("u"));
                    real deg = LoadReal(ht, hand, strHash("deg"));
                    real spd = LoadReal(ht, hand, strHash("spd"));
                    real dis = LoadReal(ht, hand, strHash("dis"));
                    real jl  = LoadReal(ht, hand, strHash("jl"));
                    boolean  condition = LoadBoolean(POHT, GetHandleId(u), strHash("击退状态"));
                    real   x = GetUnitX(u);
                    real   y = GetUnitY(u);
                    
                    jl += spd;
                    SaveReal(ht, hand, strHash("jl"), jl);
                    
                    x = PO_MobileX(x, spd, deg);
                    y = PO_MobileY(y, spd, deg);
                    if (PO_IsWalkable(x, y)) {
                        SetUnitPosition(u, x, y);
                    }

                    if (jl >= dis || !condition) {
                        SaveBoolean(POHT, GetHandleId(u), strHash("击退状态"), false);
                        RemoveSavedHandle(ht, GetHandleId(u), strHash("击退计时器"));
                        FlushChildHashtable(ht, hand);
                        DestroyTimer(t);
                    }
                    t = null;
                    u = null;
                });
            }
            t = null;
        }

        //  击飞目标
        function PO_Jump(unit u, real heighMax, real s) {
            timer t;
            integer hand;
            real steepsMax = s / 0.01;
            real dheig  = 1.0 / steepsMax;
            boolean switch = false;

            if (HaveSavedHandle(ht, GetHandleId(u), strHash("击飞计时器"))) {
                t = LoadTimerHandle(ht, GetHandleId(u), strHash("击飞计时器"));
                
            } else {
                t = CreateTimer();
                SaveTimerHandle(ht, GetHandleId(u), strHash("击飞计时器"), t);
                switch = true;
            }

            hand = GetHandleId(t);

            SaveUnitHandle(ht, hand, strHash("u"), u);
            SaveReal(ht, hand, strHash("steeps"), 0.0);
            SaveReal(ht, hand, strHash("dheig"), dheig);
            SaveReal(ht, hand, strHash("heighMax"), heighMax);
            SaveReal(ht, hand, strHash("height1"), 0.0);


            UnitAddAbility(u, 'Amrf');
            UnitRemoveAbility(u, 'Amrf');

            BJDebugMsg("当前飞行高度：" + R2S(GetUnitFlyHeight(u)));
            if (switch) {
                TimerStart(t, 0.01, true, function(){
                    timer       t = GetExpiredTimer();
                    integer  hand = GetHandleId(t);
                    unit        u = LoadUnitHandle(ht, hand, strHash("u"));
                    real    dheig = LoadReal(ht, hand, strHash("dheig"));
                    real heighMax = LoadReal(ht, hand, strHash("heighMax"));
                    real  height1 = LoadReal(ht, hand, strHash("height1"));

                    real   steeps = LoadReal(ht, hand, strHash("steeps")) + 1.0;
                    real   height = (0.0 - ( 2.0 * steeps * dheig - 1.0 ) * ( 2.0 * steeps * dheig - 1.0 ) + 1.0 ) * heighMax;
                    real  height2 = height - height1;
                    height1  += height2;

                    SaveReal(ht, hand, strHash("steeps"), steeps);
                    SaveReal(ht, hand, strHash("height1"), height1);
                    SetUnitFlyHeight(u, GetUnitFlyHeight(u) + height2, 0.0);


                    if (R2I(GetUnitFlyHeight(u)) <= 0) {
                        SetUnitFlyHeight(u, 0.0, 0.0);
                        RemoveSavedHandle(ht, GetHandleId(u), strHash("击飞计时器"));
                        FlushChildHashtable(ht, hand);
                        DestroyTimer(t);
                    }
                    t = null;
                    u = null;
                });
            }
            t = null;
        }

        
        //  抛物线
        function PO_JumpMove(unit u, real deg, real dis, real high, real time) {
            timer t;
            integer hand;
            boolean switch = false;
            if (HaveSavedHandle(ht, GetHandleId(u), strHash("抛物线计时器"))) {
                t = LoadTimerHandle(ht, GetHandleId(u), strHash("抛物线计时器"));
            } else {
                t = CreateTimer();
                SaveTimerHandle(ht, GetHandleId(u), strHash("抛物线计时器"), t);
                switch = true;
            }
            hand = GetHandleId(t);
            SaveUnitHandle(ht, hand, strHash("u"), u);
            SaveReal(ht, hand, strHash("deg"), deg);
            SaveReal(ht, hand, strHash("dis"), dis);
            SaveReal(ht, hand, strHash("high"), high);
            SaveReal(ht, hand, strHash("time"), time);
            SaveReal(ht, hand, strHash("s"), 0);
            UnitAddAbility(u, 'Amrf');
            UnitRemoveAbility(u, 'Amrf');
            SetUnitFlyHeight(u, 0.0, 0.0);
            if (switch) {
                TimerStart(t, 0.01, true, function(){
                    timer t = GetExpiredTimer();
                    integer hand = GetHandleId(t);
                    unit    u = LoadUnitHandle(ht, hand, strHash("u"));
                    real  deg = LoadReal(ht, hand, strHash("deg"));
                    real  dis = LoadReal(ht, hand, strHash("dis"));
                    real high = LoadReal(ht, hand, strHash("high"));
                    real time = LoadReal(ht, hand, strHash("time"));
                    real    s = LoadReal(ht, hand, strHash("s")) + 0.01;
                    real    p = 1.0 / time;
                    real    h = SinBJ(180.00 * s * p) * high;
                    real    x = GetUnitX(u);
                    real    y = GetUnitY(u);
                    real  spd = dis / (time * 100);
                    SaveReal(ht, hand, strHash("s"), s);
                    SetUnitFlyHeight(u, h, 0.0);

                    x = PO_MobileX(x, spd, deg);
                    y = PO_MobileY(y, spd, deg);
                    if (PO_IsWalkable(x, y)) {
                        SetUnitPosition(u, x, y);
                    }

                    if (s >= time) {
                        SetUnitFlyHeight(u, 0.0, 0.0);
                        RemoveSavedHandle(ht, GetHandleId(u), strHash("抛物线计时器"));
                        FlushChildHashtable(ht, hand);
                        DestroyTimer(t);
                    }
                    t = null;
                    u = null;
                });
            }
            t = null;
        }

        //  设置特效颜色
        function PO_Color(effect e, real red, real green, real blue, real transparency) {
            EXSetEffectColor(e, 0x1000000 * PercentTo255(100.0-transparency) + 0x10000 * PercentTo255(red) + 0x100 * PercentTo255(green) + PercentTo255(blue));
        }

        //  D闪
        function PO_MoveD(unit u, real x, real y, real spd, real dis, real s, boolean Swh, string model)  -> nothing {
            timer t;
            integer hand, index;
            boolean switch = false;
            if (HaveSavedHandle(ht, GetHandleId(u), strHash("D闪"))) {
                t = LoadTimerHandle(ht, GetHandleId(u), strHash("D闪"));
            } else {
                t = CreateTimer();
                SaveTimerHandle(ht, GetHandleId(u), strHash("D闪"), t);
                switch = true;
            }
            SetUnitPathing(u, false);
            SetUnitFacing(u, PO_DegXY(GetUnitX(u), GetUnitY(u), x, y));
            hand = GetHandleId(t);
            SaveUnitHandle(ht, hand, strHash("u"), u);
            SaveReal(ht, hand, strHash("deg"), PO_DegXY(GetUnitX(u), GetUnitY(u), x, y));
            SaveReal(ht, hand, strHash("spd"), spd);
            SaveReal(ht, hand, strHash("dis"), RMinBJ(PO_DisXY(GetUnitX(u), GetUnitY(u), x, y), dis));
            SaveReal(ht, hand, strHash("jl"), 0);
            if (switch) {
                TimerStart(t, s, true, function(){
                    timer t = GetExpiredTimer();
                    integer hand = GetHandleId(t);
                    unit u = LoadUnitHandle(ht, hand, strHash("u"));
                    real deg = LoadReal(ht, hand, strHash("deg"));
                    real spd = LoadReal(ht, hand, strHash("spd"));
                    real dis = LoadReal(ht, hand, strHash("dis"));
                    real  jl = LoadReal(ht, hand, strHash("jl"));
                    real   x = GetUnitX(u);
                    real   y = GetUnitY(u); 
                    jl += spd;
                    SaveReal(ht, hand, strHash("jl"), jl);
                    
                    x = PO_MobileX(x, spd, deg);
                    y = PO_MobileY(y, spd, deg);
                    if (PO_IsWalkable(x, y)) {
                        SetUnitPosition(u, x, y);
                    }

                    if (jl >= dis) {
                        SetUnitPathing(u, true);
                        RemoveSavedHandle(ht, GetHandleId(u), strHash("D闪"));
                        FlushChildHashtable(ht, hand);
                        DestroyTimer(t);
                    }
                    t = null;
                    u = null;
                });
                if (Swh) {
                    t = CreateTimer();
                    hand = GetHandleId(t);
                    SaveReal(ht, hand, strHash("deg"), PO_DegXY(GetUnitX(u), GetUnitY(u), x, y));
                    SaveReal(ht, hand, strHash("spd"), spd);
                    SaveReal(ht, hand, strHash("dis"), RMinBJ(PO_DisXY(GetUnitX(u), GetUnitY(u), x, y), dis));
                    SaveReal(ht, hand, strHash("x"), GetUnitX(u));
                    SaveReal(ht, hand, strHash("y"), GetUnitY(u));
                    SaveReal(ht, hand, strHash("s"), s);
                    SaveStr(ht, hand, strHash("model"), model);
                    TimerStart(t, 0.05, true, function(){
                        timer t = GetExpiredTimer();
                        integer hand = GetHandleId(t);
                        real deg = LoadReal(ht, hand, strHash("deg"));
                        real spd = LoadReal(ht, hand, strHash("spd"));
                        real dis = LoadReal(ht, hand, strHash("dis"));
                        real   x = LoadReal(ht, hand, strHash("x"));
                        real   y = LoadReal(ht, hand, strHash("y"));
                        string model = LoadStr(ht, hand, strHash("model"));
                        effect e = AddSpecialEffect(model, x, y);
                        real   s = LoadReal(ht, hand, strHash("s"));
                        real   i = LoadReal(ht, hand, strHash("i")) + 1.0;
                        timer  m = CreateTimer();
                        integer hand2;
                        PO_Color(e, 0, 0, 0, i * 20);
                        EXEffectMatRotateZ(e, deg);
                        SaveReal(ht, hand, strHash("i"), i);
                        
                        hand2 = GetHandleId(m);
                        SaveEffectHandle(ht, hand2, strHash("e"), e);
                        SaveReal(ht, hand2, strHash("deg"), deg);
                        SaveReal(ht, hand2, strHash("spd"), spd);
                        SaveReal(ht, hand2, strHash("dis"), dis);
                        TimerStart(m, s, true, function(){
                            timer t = GetExpiredTimer();
                            integer hand = GetHandleId(t);
                            effect e = LoadEffectHandle(ht, hand, strHash("e"));
                            real deg = LoadReal(ht, hand, strHash("deg"));
                            real spd = LoadReal(ht, hand, strHash("spd"));
                            real dis = LoadReal(ht, hand, strHash("dis"));
                            real   x = EXGetEffectX(e);
                            real   y = EXGetEffectY(e);
                            real  jl = LoadReal(ht, hand, strHash("jl"));
                            jl += spd;
                            SaveReal(ht, hand, strHash("jl"), jl);
                            
                            x = PO_MobileX(x, spd, deg);
                            y = PO_MobileY(y, spd, deg);
                            if (PO_IsWalkable(x, y)) {
                                EXSetEffectXY(e, x, y);
                            }
        
                            if (jl >= dis) {
                                EXSetEffectSize(e, 0);
                                EXSetEffectZ(e, -500.0);
                                DestroyEffect(e);
                                FlushChildHashtable(ht, hand);
                                DestroyTimer(t);
                            }
                            t = null;
                            e = null;
                        });
    
                        if (i >= 4) {
                            FlushChildHashtable(ht, hand);
                            DestroyTimer(t);
                        }
                        t = null;
                        e = null;
                        m = null;
                    });
                }
            }
            t = null;
        }

        // 获取鼠标指向的物品
        function PO_ItemMouse() ->item {
            FlushChildHashtable(ht, strHash("mouseitem"));
            SaveFogStateHandle(ht, strHash("mouseitem"), 1, ConvertFogState(GetHandleId(DzGetUnitUnderMouse())));
            return LoadItemHandle(ht, strHash("mouseitem"), 1);
        }

        // 获取矩形随机X坐标
        function PO_RandomRectX(rect whichRect) ->real {
            return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect));
        }

        // 获取矩形随机Y坐标
        function PO_RandomRectY(rect whichRect) ->real {
            return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect));
        }

        // 获取frame是否显示
        function DzFrameIsVisible(integer frame) -> boolean { 
            GetTriggerPlayer();
            return false;
        }

        // 发送控制台消息
        function PO_Print(string message) {
            GetTriggerPlayer();
        }

        // 获取当前地图的总游戏市场（单位：分）
        function DzAPI_Map_MapsTotalPlayed(player whichPlayer)  -> integer {
            GetTriggerPlayer();
            return 0;
        }

        // 计算地图等级（单位：分）
        function GetMapWorkOutLevel(integer gametime)  -> integer {
            GetTriggerPlayer();
            return 0;
        }

        // 任意单位 新建事件
        function PO_CreateUnitEvent(trigger t)  -> nothing {
            GetTriggerPlayer();
        }

        // 新建单位
        function PO_GetCreateUnit()  -> unit {
            GetTriggerPlayer();
            return null;
        }

        // 发送版本号信息
        function PO_SendVersion () {
            BJDebugMsg(PO_Version);
        }
    }
}
//! endzinc
#endif

