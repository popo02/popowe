#ifndef AIIncluded
#define AIIncluded
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif


//  AI
//! zinc
library AI requires Other
{
    public struct AuMagic {
        private {
            unit        u;              // 自动施法单位
            integer    jn;              // 自动施法通魔技能
            real      ran;              // 自动施法范围
            boolean  Switch = true;     // 自动施法暂停/恢复
            integer    Size = 0;        // 
            static timer t;
            static hashtable ht = InitHashtable();
            static group      g = CreateGroup();
            static unit  Condition_unit;
            static integer thisSize = 0;
            
            static method judge() -> boolean {
                if (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(thistype.Condition_unit)) == true && /*
                    */ R2I(GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE)) > 0) {
                     return true;
                 }
                 return false;
            }

            static method onInit() {
                thistype.t = CreateTimer();
                TimerStart(thistype.t, 1.0, true, function(){
                    integer index;
                    thistype this;
                    unit u;
                    for (1 <= index <= thisSize) {
                        this = LoadInteger(ht, strHash("自动施法"), index);
                        if (this.Switch) {
                            if (japi.GetAbilityState(this.u, this.jn) == 0.0) {

                                thistype.Condition_unit = this.u;
                                GroupEnumUnitsInRange(thistype.g, GetUnitX(this.u), GetUnitY(this.u), this.ran, Condition(function thistype.judge));
                                u = FirstOfGroup(thistype.g);
                                GroupClear(thistype.g);

                                if (u != null) {
                                    //  无目标技能
                                    if (Judge_Spell(this.jn, 0) == true) {
                                        Cast_Spell(this.u, this.jn, 1);
                                    }
                                    //  单位目标技能
                                    if (Judge_Spell(this.jn, 1) == true) {
                                        Cast_Spell(this.u, this.jn, Cast_Spell_C(u));
                                    }
                                    //  点目标技能
                                    if (Judge_Spell(this.jn, 2) == true) {
                                        Cast_Spell(this.u, this.jn, Cast_Spell_B(GetUnitX(u), GetUnitY(u)));
                                    }
                                }
                            }
                        }
                    }
                    u = null;
                });
            }
        }

        public {
            //  新建单位自动施法
            static method create(unit u, integer jn, real p) ->thistype {
                thistype this = thistype.allocate();
                this.u     = u;
                this.jn    = jn;
                this.ran   = p;
                thistype.thisSize += 1;
                this.Size  = thistype.thisSize;
                SaveInteger(ht, strHash("自动施法"), thistype.thisSize, this);
                return this;
            }

            //  暂停/恢复自动施法
            method Pause(boolean flag) {
                if (this > 0) {
                    this.Switch = flag;
                } else {
                    debug BJDebugMsg("自动施法实例为空");
                }
            }

            //  删除自动施法
            method Destroy() {
                if (this > 0) {
                    this.u      = null;
                    this.jn     = 0;
                    this.ran    = 0;
                    this.Switch = true;
                    SaveInteger(ht, strHash("自动施法"), this.Size, LoadInteger(ht, strHash("自动施法"), thistype.thisSize));
                    thistype.thisSize -= 1;
                    this.Size   = 0;
                    this.deallocate();
                } else {
                    debug BJDebugMsg("自动施法实例为空");
                }
            }
        }
    }

    public {
        integer PO_lastCreatedAuMagic = 0;

        //  新建单位自动施法
        function PO_AuMagic_create(unit u, integer jn, real p) -> AuMagic{
            AuMagic this = AuMagic.create(u, jn, p);
            PO_lastCreatedAuMagic = this;
            return PO_lastCreatedAuMagic;
        }

        //  暂停/恢复自动施法
        function PO_AuMagic_Pause(AuMagic this, boolean flag) {
            this.Pause(flag);
        }

        //  删除自动施法
        function PO_AuMagic_Destroy(AuMagic this) {
            this.Destroy();
        }
    }
}
//! endzinc
#endif
