#ifndef EffectIncluded
#define EffectIncluded

#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

//! zinc
library Effect requires japi
{
    public struct Effect
    {
        private
        {
            // 成员属性
            effect e;
            real x, y, z;
            integer handleId;
            static boolean display = false;        // 纯净模式开关
            static hashtable ht = InitHashtable();
            static integer   ID = strHash("Effect实例");
        }

        public
        {
            //  玩家特效异步显示开关
            static method EctSwitch(player p, boolean Switch) {
                SaveBoolean(ht, GetHandleId(p), strHash("特效显示"), Switch);
            }

            //  玩家伤害特效异步显示开关
            static method EctSwitchA(player p, boolean Switch) {
                SaveBoolean(ht, GetHandleId(p), strHash("伤害显示"), Switch);
            }

            //  纯净模式
            static method EctPure(boolean Switch) {
                display = Switch;
            }

            //  创建特效到坐标
            static method create(string name, real x, real y) ->thistype {
                thistype this = thistype.allocate();
                boolean switch = LoadBoolean(ht, GetHandleId(GetLocalPlayer()), strHash("特效显示"));
                if (switch) name = "";
                if (!display) {
                    this.e        = AddSpecialEffect(name, x, y);
                    this.handleId = GetHandleId(this.e);
                } else {
                    this.e        = null;
                    this.handleId = this + 0x1111;
                }
                this.x        = x;
                this.y        = y;
                this.z        = 0;
                PO_lastCreatedEffectId = this;
                SaveInteger(this.ht, this.ID, this.handleId, integer(this));
                return this;
            }

            //  创建特效到单位
            static method createUnit(string name, unit u, string attachPointName) ->thistype {
                thistype this = thistype.allocate();
                boolean switch = LoadBoolean(ht, GetHandleId(GetLocalPlayer()), strHash("特效显示"));
                if (switch) name = "";
                if (!display) {
                    this.e        = AddSpecialEffectTarget(name, u, attachPointName);
                    this.handleId = GetHandleId(this.e);
                } else {
                    this.e        = null;
                    this.handleId = this + 0x1111;
                }
                this.x        = 0;
                this.y        = 0;
                this.z        = 0;
                PO_lastCreatedEffectId = this;
                SaveInteger(this.ht, this.ID, this.handleId, integer(this));
                return this;
            }

            //  创建特效到坐标(伤害漂浮特效)
            static method createA(player p, string name, real x, real y, real z) ->thistype {
                thistype this = thistype.allocate();
                boolean switch = LoadBoolean(ht, GetHandleId(p), strHash("伤害显示"));
                string  model  = "";
                if (!switch) {
                    if (p == GetLocalPlayer()) model = name;
                }
                if (!display) {
                    this.e        = AddSpecialEffect(model, x, y);
                    this.handleId = GetHandleId(this.e);
                    EXSetEffectZ(this.e, z);
                } else {
                    this.e        = null;
                    this.handleId = this + 0x1111;
                }
                this.x        = x;
                this.y        = y;
                this.z        = z;
                PO_lastCreatedEffectId = this;
                SaveInteger(this.ht, this.ID, this.handleId, integer(this));
                return this;
            }

            //  特效转特效实例
            static method byHandle(effect e) ->thistype {
                thistype this = 0;
                if (LoadInteger(this.ht, this.ID, GetHandleId(e)) > 0) {
                    return LoadInteger(this.ht, this.ID, GetHandleId(e));
                }
                this          = thistype.allocate();
                this.e        = e;
                this.handleId = GetHandleId(this.e);
                this.x        = EXGetEffectX(this.e);
                this.y        = EXGetEffectY(this.e);
                this.z        = EXGetEffectZ(this.e);
                return this;
            }

            // 析构函数
            method destroy() {
                if (integer(this) < 1) return;
                RemoveSavedInteger(this.ht, this.ID, this.handleId);
                this.e        = null;
                this.handleId = 0;
                this.x        = 0;
                this.y        = 0;
                this.z        = 0;
                this.deallocate();
            }

            //  删除特效实例
            method delete() {
                if (!display) {
                    DestroyEffect(this.e);
                }
                this.destroy();
            }

            //  立即删除特效实例
            method clear() {
                if (!display) {
                    EXSetEffectSize(this.e, 0);
                    EXSetEffectZ(this.e, -500.0);
                    DestroyEffect(this.e);
                }
                this.destroy();
            }

            //  计时器系统 - 删除特效实例
            method timed(real dur, boolean Switch) {
                timer t;
                if (dur > 0) {
                    t = CreateTimer();
                    SaveInteger(ht, GetHandleId(t), strHash("特效实例"), this);
                    SaveBoolean(ht, GetHandleId(t), strHash("立即删除"), Switch);
                    TimerStart(t, dur, false, function() {
                        timer t = GetExpiredTimer();
                        thistype this = LoadInteger(ht, GetHandleId(t), strHash("特效实例"));
                        boolean Switch = LoadBoolean(ht, GetHandleId(t), strHash("立即删除"));
                        if (Switch) {
                            this.clear();
                        } else {
                            this.delete();
                        }
                        FlushChildHashtable(ht, GetHandleId(t));
                        DestroyTimer(t);
                    });
                } else {
                    if (Switch) {
                        this.clear();
                    } else {
                        this.delete();
                    }
                }
                t = null;
            }

        // Get

            // 获取特效
            method Handle()         ->effect { return this.e; }

            // 获取句柄
            method HandleId()       ->integer { return this.handleId; }
            
            // 获取X坐标
            method X()              ->real { return this.x; }

            // 获取Y坐标
            method Y()              ->real { return this.y; }

            // 获取Z高度
            method Z()              ->real { return this.z; }

            // 获取Size大小
            method size()           ->real { return EXGetEffectSize(this.e); }

        // Set

            // 移动特效到XY坐标
            method move(real x, real y) {
                if (!display) EXSetEffectXY(this.e, x, y);
                this.x = x;
                this.y = y;
            }

            // 设置特效Z高度
            method setZ(real z) {
                if (!display) EXSetEffectZ(this.e, z);
                this.z = z;
            }

            // 设置Size大小
            method setSize(real size) { if (!display) EXSetEffectSize(this.e, size); }

            // 设置特效缩放
            method setScale(real x, real y, real z) { if (!display) EXEffectMatScale(this.e, x, y, z); }

            // 设置特效动画播放速度
            method setSpeed(real speed) { if (!display) EXSetEffectSpeed(this.e, speed); }

        // 其他

            // 绕X轴旋转
            method rotateX(real angle) { if (!display) EXEffectMatRotateX(this.e, angle); }

            // 绕Y轴旋转
            method rotateY(real angle) { if (!display) EXEffectMatRotateY(this.e, angle); }
            
            // 绕Z轴旋转
            method rotateZ(real angle) { if (!display) EXEffectMatRotateZ(this.e, angle); }

            // 特效重置变换
            method reset() { if (!display) EXEffectMatReset(this.e); }

        //  部分实用内置功能

            //  播放特效动画
            method Animation(integer p1) { if (!display) EXSetEffectAnimation(this.e, p1); }

            //  缩放特效粒子
            method Pariticle(real scale) { if (!display) SetPariticle2Size(this.e, scale); }

            //  设置特效颜色
            method Color(real red, real green, real blue, real transparency) { if (!display) EXSetEffectColor(this.e, 0x1000000 * PercentTo255(100.0-transparency) + 0x10000 * PercentTo255(red) + 0x100 * PercentTo255(green) + PercentTo255(blue)); }
        
        
        }
    }

    public integer PO_lastCreatedEffectId = 0;
    private {
        hashtable ht = InitHashtable();

        //  实数转字符串 万 亿 兆 京自动替换
        function R2SWYZJ(real s, integer id) -> string {
            if (s >= Pow(10.00, 34.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("h"))) {
                s /= Pow(10.00, 32.00);
                return I2S(R2I(s)) + "h";
            } else if (s >= Pow(10.00, 30.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("g"))) {
                s /= Pow(10.00, 28.00);
                return I2S(R2I(s)) + "g";
            } else if (s >= Pow(10.00, 26.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("f"))) {
                s /= Pow(10.00, 24.00);
                return I2S(R2I(s)) + "f";
            } else if (s >= Pow(10.00, 22.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("e"))) {
                s /= Pow(10.00, 20.00);
                return I2S(R2I(s)) + "e";
            } else if (s >= Pow(10.00, 18.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("d"))) {
                s /= Pow(10.00, 16.00);
                return I2S(R2I(s)) + "d";
            } else if (s >= Pow(10.00, 14.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("c"))) {
                s /= Pow(10.00, 12.00);
                return I2S(R2I(s)) + "c";
            } else if (s >= Pow(10.00, 10.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("b"))) {
                s /= Pow(10.00, 8.00);
                return I2S(R2I(s)) + "b";
            } else if (s >= Pow(10.00, 6.00) && HaveSavedString(ht, strHash("伤害漂浮") + id, StringHash("a"))) {
                s /= Pow(10.00, 4.00);
                return I2S(R2I(s)) + "a";
            } else {
                return I2S(R2I(s));
            }
        }

        
        //  实数 - 坐标X位移
        function MobileX (real X, real Dist, real Angle)  -> real {
            return X + Dist * Cos(Angle * bj_DEGTORAD);
        }

        //  实数 - 坐标Y位移
        function MobileY (real Y, real Dist, real Angle)  -> real {
            return Y + Dist * Sin(Angle * bj_DEGTORAD);
        }
    }


    public {
        constant integer PO_ATTACK_TYPE_NORMAL              = 0;
        constant integer PO_ATTACK_TYPE_MELEE               = 1;
        constant integer PO_ATTACK_TYPE_PIERCE              = 2;
        constant integer PO_ATTACK_TYPE_SIEGE               = 3;
        constant integer PO_ATTACK_TYPE_MAGIC               = 4;
        constant integer PO_ATTACK_TYPE_CHAOS               = 5;
        constant integer PO_ATTACK_TYPE_HERO                = 6;
        
        constant integer PO_DAMAGE_TYPE_UNKNOWN             = 0;
        constant integer PO_DAMAGE_TYPE_NORMAL              = 4;
        constant integer PO_DAMAGE_TYPE_ENHANCED            = 5;
        constant integer PO_DAMAGE_TYPE_FIRE                = 8;
        constant integer PO_DAMAGE_TYPE_COLD                = 9;
        constant integer PO_DAMAGE_TYPE_LIGHTNING           = 10;
        constant integer PO_DAMAGE_TYPE_POISON              = 11;
        constant integer PO_DAMAGE_TYPE_DISEASE             = 12;
        constant integer PO_DAMAGE_TYPE_DIVINE              = 13;
        constant integer PO_DAMAGE_TYPE_MAGIC               = 14;
        constant integer PO_DAMAGE_TYPE_SONIC               = 15;
        constant integer PO_DAMAGE_TYPE_ACID                = 16;
        constant integer PO_DAMAGE_TYPE_FORCE               = 17;
        constant integer PO_DAMAGE_TYPE_DEATH               = 18;
        constant integer PO_DAMAGE_TYPE_MIND                = 19;
        constant integer PO_DAMAGE_TYPE_PLANT               = 20;
        constant integer PO_DAMAGE_TYPE_DEFENSIVE           = 21;
        constant integer PO_DAMAGE_TYPE_DEMOLITION          = 22;
        constant integer PO_DAMAGE_TYPE_SLOW_POISON         = 23;
        constant integer PO_DAMAGE_TYPE_SPIRIT_LINK         = 24;
        constant integer PO_DAMAGE_TYPE_SHADOW_STRIKE       = 25;
        constant integer PO_DAMAGE_TYPE_UNIVERSAL           = 26;
        
        constant integer PO_WEAPON_TYPE_WHOKNOWS            = 0;
        constant integer PO_WEAPON_TYPE_METAL_LIGHT_CHOP    = 1;
        constant integer PO_WEAPON_TYPE_METAL_MEDIUM_CHOP   = 2;
        constant integer PO_WEAPON_TYPE_METAL_HEAVY_CHOP    = 3;
        constant integer PO_WEAPON_TYPE_METAL_LIGHT_SLICE   = 4;
        constant integer PO_WEAPON_TYPE_METAL_MEDIUM_SLICE  = 5;
        constant integer PO_WEAPON_TYPE_METAL_HEAVY_SLICE   = 6;
        constant integer PO_WEAPON_TYPE_METAL_MEDIUM_BASH   = 7;
        constant integer PO_WEAPON_TYPE_METAL_HEAVY_BASH    = 8;
        constant integer PO_WEAPON_TYPE_METAL_MEDIUM_STAB   = 9;
        constant integer PO_WEAPON_TYPE_METAL_HEAVY_STAB    = 10;
        constant integer PO_WEAPON_TYPE_WOOD_LIGHT_SLICE    = 11;
        constant integer PO_WEAPON_TYPE_WOOD_MEDIUM_SLICE   = 12;
        constant integer PO_WEAPON_TYPE_WOOD_HEAVY_SLICE    = 13;
        constant integer PO_WEAPON_TYPE_WOOD_LIGHT_BASH     = 14;
        constant integer PO_WEAPON_TYPE_WOOD_MEDIUM_BASH    = 15;
        constant integer PO_WEAPON_TYPE_WOOD_HEAVY_BASH     = 16;
        constant integer PO_WEAPON_TYPE_WOOD_LIGHT_STAB     = 17;
        constant integer PO_WEAPON_TYPE_WOOD_MEDIUM_STAB    = 18;
        constant integer PO_WEAPON_TYPE_CLAW_LIGHT_SLICE    = 19;
        constant integer PO_WEAPON_TYPE_CLAW_MEDIUM_SLICE   = 20;
        constant integer PO_WEAPON_TYPE_CLAW_HEAVY_SLICE    = 21;
        constant integer PO_WEAPON_TYPE_AXE_MEDIUM_CHOP     = 22;
        constant integer PO_WEAPON_TYPE_ROCK_HEAVY_BASH     = 23;

        function PO_EctSwitch(player p, boolean Switch) { Effect.EctSwitch(p, Switch); }

        function PO_EctSwitchA(player p, boolean Switch) { Effect.EctSwitchA(p, Switch); }

        function PO_EctPure(boolean Switch) { Effect.EctPure(Switch); }

        function PO_EctCreate(string name, real x, real y) ->Effect { return Effect.create(name, x, y); }

        function PO_EctCreateUnit(string name, unit u, string attachPointName) ->Effect { return Effect.createUnit(name, u, attachPointName); }
            
        function PO_EctCreateA(player p, string name, real x, real y, real z) ->Effect { return Effect.createA(p, name, x, y, z); }

        function PO_EctbyHandle(effect e) ->Effect { return Effect.byHandle(e); }

        function PO_Ectdelete(Effect this) { this.delete(); }

        function PO_Ectclear(Effect this) { this.clear(); }

        function PO_Ecttimed(real dur, Effect this, boolean Switch) { this.timed(dur, Switch); }

        function PO_GetEctHandle(Effect this) ->effect { return this.Handle(); }

        function PO_GetEctHandleId(Effect this) ->integer { return this.HandleId(); }

        function PO_GetEctX(Effect this) ->real { return this.X(); }

        function PO_GetEctY(Effect this) ->real { return this.Y(); }

        function PO_GetEctZ(Effect this) ->real { return this.Z(); }

        function PO_GetEctSize(Effect this) ->real { return this.size(); }

        function PO_SetEctMove(Effect this, real x, real y) { this.move(x, y); }
            
        function PO_SetEctZ(Effect this, real z) { this.setZ(z); } 

        function PO_SetEctSize(Effect this, real size) { this.setSize(size); }

        function PO_SetEctScale(Effect this, real x, real y, real z) { this.setScale(x, y, z); }

        function PO_SetEctSpeed(Effect this, real speed) { this.setSpeed(speed); }

        function PO_SetEctRotateX(Effect this, real angle) { this.rotateX(angle); }

        function PO_SetEctRotateY(Effect this, real angle) { this.rotateY(angle); }

        function PO_SetEctRotateZ(Effect this, real angle) { this.rotateZ(angle); }

        function PO_SetEctReset(Effect this) { this.reset(); }

        function PO_SetEctAnimation(Effect this, integer p1) { this.Animation(p1); }

        function PO_SetEctPariticle(Effect this, real scale) { this.Pariticle(scale); }

        function PO_SetEctColor(Effect this, real red, real green, real blue, real transparency) { this.Color(red, green, blue, transparency); }

        // 保存特效实例 [C]
        function PO_SaveEffect(hashtable table, integer parentKey, integer childKey, Effect value) {
            SaveInteger(table, parentKey, childKey, value);
        }

        // 从哈希表提取特效实例 [C]
        function PO_LoadEffect(hashtable table, integer parentKey, integer childKey) ->Effect {
            return LoadInteger(table, parentKey, childKey);
        }

        //  最后创建的特效实例
        function PO_GetLastCreatedEffect() ->Effect {
            return PO_lastCreatedEffectId;
        }

        //  设置漂浮伤害特效
        function PO_Setdamageeffect(integer id, string str, string model) {
            SaveStr(ht, strHash("伤害漂浮") + id, StringHash(str), model);
        }

        //  伤害漂浮文字
        function PO_Damageeffect(player p, real s, integer id, boolean BJ, real x, real y, real high, real spa) {
            string  v = R2SWYZJ(s, id);
            integer z = StringLength(v);
            integer index;
            string  model;
            Effect  l;
            if (BJ) {
                model = LoadStr(ht, strHash("伤害漂浮") + id, strHash("BJ"));
                l = Effect.createA(p, model, MobileX(x, spa, 180), MobileY(y, spa, 180), high);
                l.delete();
            }
            for (1 <= index <= z) {
                model = LoadStr(ht, strHash("伤害漂浮") + id, StringHash(SubStringBJ(v, index, index)));
                l = Effect.createA(p, model, MobileX(x, spa * (I2R(index - 1)), 0), MobileY(y, spa * (I2R(index - 1)), 0), high);
                l.delete();
            }
        }
        
        //  特效冲锋
        //  参数 特效, 方向, 射程, 时间, 周期, 伤害单位, 伤害半径, 伤害数值, 攻击伤害, 远程攻击, 攻击类型, 伤害类型, 武器类型
        //  参数 Effect this, real deg, real dis, real ti, real cycle, unit u, real ran, real hurt, boolean attack, boolean ranged, integer attackType, integer damageType, integer weaponType
        function PO_ChargeEffect(Effect this, real deg, real dis, real ti, real cycle, unit u, real ran, real hurt, boolean attack, boolean ranged, integer attackType, integer damageType, integer weaponType) {
            timer t = CreateTimer();
            integer hand = GetHandleId(t);
            SaveInteger(ht, hand, strHash("Effect"), this);
            SaveReal(ht, hand, strHash("方向"), deg);
            SaveReal(ht, hand, strHash("射程"), dis);
            SaveReal(ht, hand, strHash("时间"), ti);
            SaveReal(ht, hand, strHash("周期"), cycle);
            SaveUnitHandle(ht, hand, strHash("伤害单位"), u);
            SaveReal(ht, hand, strHash("伤害半径"), ran);
            SaveReal(ht, hand, strHash("伤害数值"), hurt);
            SaveBoolean(ht, hand, strHash("攻击伤害"), attack);
            SaveBoolean(ht, hand, strHash("远程攻击"), ranged);
            SaveInteger(ht, hand, strHash("攻击类型"), attackType);
            SaveInteger(ht, hand, strHash("伤害类型"), damageType);
            SaveInteger(ht, hand, strHash("武器类型"), weaponType);
            SaveGroupHandle(ht, hand, strHash("单位组"), CreateGroup());
            SaveGroupHandle(ht, hand, strHash("伤害组"), CreateGroup());

            TimerStart(t, cycle, true, function(){
                timer t = GetExpiredTimer();
                integer hand = GetHandleId(t);
                Effect  this = LoadInteger(ht, hand, strHash("Effect"));
                real     deg = LoadReal(ht, hand, strHash("方向"));
                real     dis = LoadReal(ht, hand, strHash("射程"));
                real      ti = LoadReal(ht, hand, strHash("时间"));
                real   cycle = LoadReal(ht, hand, strHash("周期"));
                unit       u = LoadUnitHandle(ht, hand, strHash("伤害单位"));
                real     ran = LoadReal(ht, hand, strHash("伤害半径"));
                real    hurt = LoadReal(ht, hand, strHash("伤害数值"));
                boolean attack = LoadBoolean(ht, hand, strHash("攻击伤害"));
                boolean ranged = LoadBoolean(ht, hand, strHash("远程攻击"));
                integer attackType = LoadInteger(ht, hand, strHash("攻击类型"));
                integer damageType = LoadInteger(ht, hand, strHash("伤害类型"));
                integer weaponType = LoadInteger(ht, hand, strHash("武器类型"));
                group      judge_g = LoadGroupHandle(ht, hand, strHash("单位组"));
                real       x = MobileX(this.X(), dis / (ti / cycle), deg);
                real       y = MobileY(this.Y(), dis / (ti / cycle), deg);
                real       s = LoadReal(ht, hand, strHash("计时")) + cycle;
                group      g = LoadGroupHandle(ht, hand, strHash("伤害组"));
                unit       e = null;
                SaveReal(ht, hand, strHash("计时"), s);

                this.move(x, y);
                GroupEnumUnitsInRange(g, x, y, ran, null);
                while (true) {
                    e = FirstOfGroup(g);
                    if (e == null) {
                        break;
                    }
                    GroupRemoveUnit(g, e);
                    if (IsUnitEnemy(e, GetOwningPlayer(u)) && !IsUnitInGroup(e, judge_g) && R2I(GetUnitState(e, UNIT_STATE_LIFE)) > 0) {
                        UnitDamageTarget(u, e, hurt, attack, ranged, ConvertAttackType(attackType), ConvertDamageType(damageType), ConvertWeaponType(weaponType));
                        GroupAddUnit(judge_g, e);
                    }
                }
                e = null;
                u = null;
                if (s >= ti) {
                    GroupClear(judge_g);
                    DestroyGroup(judge_g);
                    DestroyGroup(g);
                    this.delete();
                    FlushChildHashtable(ht, hand);
                    DestroyTimer(t);
                }

                judge_g = null;
                g = null;
                t = null;
            });
            t = null;
        }

        //  特效直线运动
        //  参数 特效, 方向, 射程, 时间, 周期
        //  参数 Effect this, real deg, real dis, real ti, real cycle
        function PO_EffectLinearMotion(Effect this, real deg, real dis, real ti, real cycle) {
            timer t = CreateTimer();
            integer hand = GetHandleId(t);
            SaveInteger(ht, hand, strHash("Effect"), this);
            SaveReal(ht, hand, strHash("方向"), deg);
            SaveReal(ht, hand, strHash("射程"), dis);
            SaveReal(ht, hand, strHash("时间"), ti);
            SaveReal(ht, hand, strHash("周期"), cycle);

            TimerStart(t, cycle, true, function(){
                timer t = GetExpiredTimer();
                integer hand = GetHandleId(t);
                Effect  this = LoadInteger(ht, hand, strHash("Effect"));
                real     deg = LoadReal(ht, hand, strHash("方向"));
                real     dis = LoadReal(ht, hand, strHash("射程"));
                real      ti = LoadReal(ht, hand, strHash("时间"));
                real   cycle = LoadReal(ht, hand, strHash("周期"));
                real       x = MobileX(this.X(), dis / (ti / cycle), deg);
                real       y = MobileY(this.Y(), dis / (ti / cycle), deg);
                real       s = LoadReal(ht, hand, strHash("计时")) + cycle;
                SaveReal(ht, hand, strHash("计时"), s);
                this.move(x, y);
                if (s >= ti) {
                    this.delete();
                    FlushChildHashtable(ht, hand);
                    DestroyTimer(t);
                }
                t = null;
            });
            t = null;
        }
    }
}
//! endzinc
#endif
