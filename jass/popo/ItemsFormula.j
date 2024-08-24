#ifndef ItemsFormulaIncluded
#define ItemsFormulaIncluded

#define SetMaterial(wp)     SaveBoolean(ht, <?= StringHash('材料') ?>, GetItemTypeId(wp), true)
#define ClearMaterial(wp)   RemoveSavedBoolean(ht, <?= StringHash('材料') ?>, GetItemTypeId(wp))
#define IsMaterial(wp)      LoadBoolean(ht, <?= StringHash('材料') ?>, GetItemTypeId(wp))
//#define print(s)            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, s)

//  物品合成
//! zinc
library ItemsFormula
{
    public struct ItemsFormula
    {
        private {
            static hashtable ht = InitHashtable();
            static integer thisSize = 0;
            integer it[7];
            integer n[7];
            integer Items;
        }

        public {


            // 物品合成
            static method create(integer it1, integer n1, integer it2, integer n2, integer it3, integer n3, integer it4, integer n4, integer it5, integer n5, integer it6, integer n6, integer wp) -> thistype {
                thistype this = thistype.allocate();
                this.it[1]    = it1;
                this.it[2]    = it2;
                this.it[3]    = it3;
                this.it[4]    = it4;
                this.it[5]    = it5;
                this.it[6]    = it6;

                this.n[1]     = n1;
                this.n[2]     = n2;
                this.n[3]     = n3;
                this.n[4]     = n4;
                this.n[5]     = n5;
                this.n[6]     = n6;

                this.Items    = wp;

                thisSize += 1;
                return this;
            }

            // 检视单位背包合成物品
            static method CraftItem(unit u) ->item {
                integer index, index_1, index_2;
                thistype this;
                item wp[], e = null, p = null;
                integer in[];
                boolean bl[];
                for (1 <= index <= thisSize) {
                    this = index;
                    wp[1] = null;
                    wp[2] = null;
                    wp[3] = null;
                    wp[4] = null;
                    wp[5] = null;
                    wp[6] = null;
                    bl[1] = false;
                    bl[2] = false;
                    bl[3] = false;
                    bl[4] = false;
                    bl[5] = false;
                    bl[6] = false;
                    in[1] = 0;
                    in[2] = 0;
                    in[3] = 0;
                    in[4] = 0;
                    in[5] = 0;
                    in[6] = 0;
                    for (1 <= index_1 <= 6) {
                        for (1 <= index_2 <= 6) {
                            p = UnitItemInSlot(u, index_2 - 1);
                            if (this.n[index_1] > 0) {
                                if (GetItemTypeId(UnitItemInSlot(u, index_2 - 1)) == this.it[index_1]) {
                                    if (GetItemCharges(UnitItemInSlot(u, index_2 - 1)) >= this.n[index_1] || this.n[index_1] == 1) {
                                        if (wp[index_1] == null) {
                                            if (!IsMaterial(UnitItemInSlot(u, index_2 - 1))) {
                                                wp[index_1] = UnitItemInSlot(u, index_2 - 1);
                                                in[index_1] = this.n[index_1];
                                                bl[index_1] = true;
                                                SetMaterial(wp[index_1]);
                                                break;
                                            }
                                        }
                                    }
                                }
                            } else {
                                bl[index_1] = true;
                                break;
                            }
                        }
                    }
                    if (bl[1] && bl[2] && bl[3] && bl[4] && bl[5] && bl[6]) {
                        for (1 <= index_2 <= 6) {
                            if (wp[index_2] != null) {
                                ClearMaterial(wp[index_2]);
                                if (GetItemCharges(wp[index_2]) > in[index_2]) {
                                    SetItemCharges(wp[index_2], GetItemCharges(wp[index_2]) - in[index_2]);
                                } else {
                                    RemoveItem(wp[index_2]);
                                }
                            }
                        }
                        e =  CreateItem(this.Items, GetUnitX(u), GetUnitY(u));
                        UnitAddItem(u, e);
                        break;
                    } else {
                        for (1 <= index_2 <= 6) {
                            if (wp[index_2] != null) {
                                ClearMaterial(wp[index_2]);
                            }
                        }
                    }
                }
                wp[1] = null;
                wp[2] = null;
                wp[3] = null;
                wp[4] = null;
                wp[5] = null;
                wp[6] = null;
                return e;
            }
        }
    }

    public {
        // 物品合成
        function PO_ItemsFormula_create(integer it1, integer n1, integer it2, integer n2, integer it3, integer n3, integer it4, integer n4, integer it5, integer n5, integer it6, integer n6, integer wp) {
            ItemsFormula.create(it1, n1, it2, n2, it3, n3, it4, n4, it5, n5, it6, n6, wp);
        }

        // 检视单位背包合成物品
        function PO_ItemsFormula_CraftItem(unit u) ->item {
            return ItemsFormula.CraftItem(u);
        }
    }
}
//! endzinc
#endif
