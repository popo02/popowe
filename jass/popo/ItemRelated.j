#ifndef ItemRelatedIncluded
#define ItemRelatedIncluded

#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

//  物品
//! zinc
library ItemRelated
{
    private {
        hashtable ht = InitHashtable();

        //  初始化
        function onInit () {
            trigger t = CreateTrigger();
            TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_PICKUP_ITEM);
            TriggerAddAction(t, function(){
                unit  u = GetManipulatingUnit();   //操作物品的单位
                item it = GetManipulatedItem();    //操作物品
                integer z = LoadInteger(ht, strHash("物品叠加"), GetItemTypeId(it));
                item wp;
                integer n1, n2, index;
                if (z >= 0) {
                    for (1 <= index <= 6) {
                        wp = UnitItemInSlot(u, index - 1);
                        if (it != wp && GetItemTypeId(wp) == GetItemTypeId(it)) {
                            n1 = IMaxBJ(GetItemCharges(it), 1);
                            n2 = IMaxBJ(GetItemCharges(wp), 1);
                            if (z != 0) {
                                if (GetItemCharges(wp) != z) {
                                    if (n1 + n2 <= z) {
                                        RemoveItem(it);
                                        SetItemCharges(wp, n1 + n2);
                                        break;
                                    } else {
                                        SetItemCharges(it, z - n2);
                                        SetItemCharges(wp, z);
                                        break;
                                    }
                                }
                            } else {
                                RemoveItem(it);
                                SetItemCharges(wp, n1 + n2);
                                break;
                            }
                        }
                    }
                }
                u = null;
                it = null;
                wp = null;
            });
        }
    }

    public {
        // 设置物品类型叠加
        function PO_SetItemSuperposition(integer it, integer index) {
            SaveInteger(ht, strHash("物品叠加"), it, index);
        }
    }
}
//! endzinc
#endif
