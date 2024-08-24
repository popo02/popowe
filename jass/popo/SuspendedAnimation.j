#ifndef SuspendedAnimationIncluded
#define SuspendedAnimationIncluded
#include "YDWETriggerEvent.j"
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

//  假死
//! zinc
library SuspendedAnimation requires japi, YDWETriggerEvent
{
    private {
        hashtable ht = InitHashtable();
        integer thisSize = 0;
        trigger trg[];
        // 假死单位
        unit Unit = null;
        // 凶手单位
        unit Unit_A = null;

        // 设置假死单位数量
        function SaveQuantity(integer UnitType, integer index)  -> nothing {
            SaveInteger(ht, strHash("数量"), UnitType, index);
        }

        // 获取假死单位数量
        function LoadQuantity(integer UnitType)  -> integer {
            return LoadInteger(ht, strHash("数量"), UnitType);
        }

        // 设置单位是否为假死单位
        function SetUnitFakeDead(unit u, boolean bool)  -> nothing {
            SaveBoolean(ht, strHash("假死单位"), GetHandleId(u), bool);
        }

        // 判断单位为假死单位
        function IsUnitFakeDead(unit u)  -> boolean {
            return LoadBoolean(ht, strHash("假死单位"), GetHandleId(u));
        }

        // 设置假死单位是否死亡
        function SetDyingUnit(unit u, boolean bool)  -> nothing {
            SaveBoolean(ht, strHash("假死单位死亡"), GetHandleId(u), bool);
        }

        // 判断假死单位是否死亡
        function IsDyingUnit(unit u)  -> boolean {
            return LoadBoolean(ht, strHash("假死单位死亡"), GetHandleId(u));
        }

        // 增加假死单位数量
        function addDyingUnit(unit u) {
            integer UnitType = GetUnitTypeId(u);
            integer index    = LoadQuantity(UnitType) + 1;
            SaveQuantity(UnitType, index);
            SaveUnitHandle(ht, UnitType, index, u);
            SetUnitFakeDead(u, true);
        }

        // 减少假死单位数量
        function subDyingUnit(integer UnitType) -> unit {
            unit    u = null;
            integer index = LoadQuantity(UnitType);
            if (index > 0) {
                u = LoadUnitHandle(ht, UnitType, index);
                SaveQuantity(UnitType, index-1);
                RemoveSavedHandle(ht, UnitType, index);
            }
            return u;
        }

        // 无敌 无敌为true
        function invulnerable(unit u, boolean flag) {
            if (flag) {
                UnitAddAbility(u, 'Avul');
            } else {
                UnitRemoveAbility(u, 'Avul');
            }
        }

        // 重置假死单位
        function ResetUnit(unit u) {
            if (IsDyingUnit(u)) {
                SaveBoolean(POHT, GetHandleId(u), strHash("击飞状态"), false);
                SaveBoolean(POHT, GetHandleId(u), strHash("击退状态"), false);
                UnitRemoveAbility(u, Giddiness_Buff_ID);
                PauseUnit(u, false);
                invulnerable(u, false);
                ShowUnit(u, true);
                SetDyingUnit(u, false);
            }
        }

        function Skin() {
            trigger t = CreateTrigger();
            YDWESyStemAnyUnitDamagedRegistTrigger(t);
            TriggerAddAction(t, function(){
                unit a = GetEventDamageSource();
                unit u = GetTriggerUnit();
                real s = GetEventDamage();
                integer index;
                if (IsUnitFakeDead(u)) {
                    if (!IsDyingUnit(u)) {
                        if (s >= GetUnitState(u, UNIT_STATE_LIFE) - 1.0) {
                            SetDyingUnit(u, true);
                            EXSetEventDamage(0.0);
                            SetUnitState(u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE));
                            SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA));
                            PauseUnit(u, true);
                            invulnerable(u, true);
                            ShowUnit(u, false);
                            addDyingUnit(u);
                            Unit_A = a;
                            Unit   = u;
                            for (1 <= index <= thisSize) {
                                if (IsTriggerEnabled(trg[index]) && TriggerEvaluate(trg[index]) && trg[index] != null) {
                                    TriggerExecute(trg[index]);
                                }
                            }
                            Unit_A = null;
                            Unit   = null;
                        }
                    }
                }
            });
            t = null;
            DestroyTimer(GetExpiredTimer());
        }

        function onInit() {
            timer t = CreateTimer();
            TimerStart(t, 0.1, false, function Skin);
            t = null;
        }
    }

    public {
        unit    PO_lastCreatedUnitFakeDead;
        // 新建假死单位(假死单位不足则新建单位)
        function PO_SuspendedAnimation_Create(player id, integer unitid, real x, real y, real face) -> unit {
            unit u = subDyingUnit(unitid);
            if (u == null) {
                u = CreateUnit(id, unitid, x, y, face);
                SetUnitFakeDead(u, true);
            } else {
                if (GetOwningPlayer(u) != id) {
                    SetUnitOwner(u, id, true);
                }
                SetUnitPosition(u, x, y);
                SetUnitFacing(u, face);
                ResetUnit(u);
            }
            PO_lastCreatedUnitFakeDead = u;
            return PO_lastCreatedUnitFakeDead;
        }

        // 清除单位假死状态并杀死单位
        function PO_SuspendedAnimation_KillUnit(unit u) {
            integer index, uty, Quantity;
            if (IsUnitFakeDead(u)) {
                uty = GetUnitTypeId(u);
                Quantity = LoadQuantity(uty);
                SetUnitFakeDead(u, false);
                SetDyingUnit(u,false);
                for (1 <= index <= Quantity) {
                    if (u == LoadUnitHandle(ht, uty, index)) {
                        SaveQuantity(uty, Quantity-1);
                        SaveUnitHandle(ht, uty, index, LoadUnitHandle(ht, uty, Quantity));
                        break;
                    }
                }
            }
            KillUnit(u);
        }

        // 假死单位
        function PO_SuspendedAnimation_Unit() ->unit {
            return Unit;
        }

        // 凶手单位
        function PO_SuspendedAnimation_GetKillingUnit() ->unit {
            return Unit_A;
        }

        // 假死事件
        function PO_SuspendedAnimation_Event(trigger t) {
            if (t != null) {
                thisSize += 1;
                trg[thisSize] = t;
            }
        }
    }
}
//! endzinc
#endif
