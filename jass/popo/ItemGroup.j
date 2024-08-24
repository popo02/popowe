#ifndef ItemGroupIncluded
#define ItemGroupIncluded

#define SaveItemGroup(self, index, value)   SaveItemHandle(ht, self, index, value)
#define LoadItemGroup(self, index)          LoadItemHandle(ht, self, index)
#define RemoveItemGroup(self, index)        RemoveSavedHandle(ht, self, index)
#define FlushItemGroup(self)                FlushChildHashtable(ht, self)

//  物品组
//! zinc
library ItemGroup
{
    public struct ItemGroup
    {
        private {
            static hashtable ht = InitHashtable();
            static ItemGroup g;
            static real Range;
            static rect Rect;
            integer min,max;

            static method onInit() {
                Rect = Rect(0, 0, 0, 0);
            }

            //  移动矩形区域至坐标并设置大小
            static method PO_SetRect (rect whichRect, real x,real y,real width) {
                MoveRectTo(whichRect, x, y);
                SetRect(whichRect, x - width*0.5, y - width*0.5, x + width*0.5, y + width*0.5);
            }

            //  实数 - 坐标到坐标的距离
            static method  DisXY (real x, real y, real x1, real y1)  -> real {
                return SquareRoot(Pow(x - x1, 2.00) + Pow(y - y1, 2.00));
            }
        }

        public {
            // 物品组新建
            // 返回值 ItemGroup
            static method create() -> thistype {
                thistype this = thistype.allocate();
                this.min      = 1;
                this.max      = 0;
                return this;
            }

            // 物品组删除
            // 参数 ItemGroup this
            method Destroy() {
                this.min      = 0;
                this.max      = 0;
                FlushItemGroup(this);
                this.deallocate();
            }

            // 物品组清空
            // 参数 ItemGroup this
            method Clear() {
                this.min      = 1;
                this.max      = 0;
                FlushItemGroup(this);
            }

            // 物品组总数
            // 参数 ItemGroup this
            // 返回值 integer
            method Quantity() -> integer {
                return this.max;
            }

            // 物品在物品组中的排序
            // 参数 ItemGroup this,item value
            // 返回值 integer
            method IsItemInGroupSorting (item value)  -> integer {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadItemGroup(this, index) == value) {
                            return index;
                        }
                    }
                } else {
                    debug BJDebugMsg("物品组为空");
                }
                return 0;
            }

            // 物品组中是否存在某个物品
            // 参数 ItemGroup this, integer value
            // 返回值 boolean
            method IsItemInGroup(item value) -> boolean {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadItemGroup(this, index) == value) {
                            return true;
                        }
                    }
                } else {
                    debug BJDebugMsg("物品组为空");
                }
                return false;
            }

            // 添加物品
            // 参数 ItemGroup this, item index
            method AddItem(item index) {
                this.max     += 1;
                SaveItemGroup(this, this.max, index);
            }

            // 移除物品
            // 参数 ItemGroup this, integer value
            method DestroyItem(item value) {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadItemGroup(this, index) == value) {
                            SaveItemGroup(this, index, LoadItemGroup(this, this.max));
                            RemoveItemGroup(this, this.max);
                            this.max -= 1;
                            return;
                        }
                    }
                } else {
                    debug BJDebugMsg("物品组为空");
                }
            }

            // 将物品组中所有物品添加进物品组
            // 参数 ItemGroup this, ItemGroup self
            method Engraved(ItemGroup self) {
                integer index;
                for (this.min <= index <= this.max) {
                    self.AddItem(LoadItemGroup(this, index));
                }
            }

            // 物品组中第一个物品
            // 参数 ItemGroup this
            // 返回值 item
            method FirstOfItemGroup() -> item {
                if (this.max > 0) {
                    return LoadItemGroup(this, 1);
                } else {
                    debug BJDebugMsg("物品组为空");
                    return null;
                }
                return null;
            }

            // 物品组中随机物品
            // 参数 ItemGroup this
            // 返回值 item
            method RandomOfItemGroup() -> item {
                if (this.max > 0) {
                    return LoadItemGroup(this, GetRandomInt(this.min, this.max));
                } else {
                    debug BJDebugMsg("物品组为空");
                    return null;
                }
                return null;
            }

            // 选取坐标圆形范围内物品添加到物品组(坐标)
            // 参数 ItemGroup this,real x, real y, real radius
            method GroupEnumItemsInRange (real x, real y, real radius) {
                if (this > 0) {
                    g = this;
                    Range = radius;
                    PO_SetRect(Rect, x, y, radius);
                    EnumItemsInRect(Rect, null, function (){
                        thistype this = g;
                        real x = GetRectCenterX(Rect);
                        real y = GetRectCenterY(Rect);
                        real x1= GetItemX(GetEnumItem());
                        real y1= GetItemY(GetEnumItem());
                        if (DisXY(x, y, x1, y1) <= Range) {this.AddItem(GetEnumItem());}
                    });
                } else {
                    debug BJDebugMsg("不存在的物品组");
                }
            }

            // 选取区域内物品添加到物品组
            // 参数 ItemGroup this,rect r
            method GroupEnumItemsInRange_A (rect r) {
                if (this > 0) {
                    g = this;
                    EnumItemsInRect(r, null, function (){
                        thistype this = g;
                        this.AddItem(GetEnumItem());
                    });
                } else {
                    debug BJDebugMsg("不存在的物品组");
                }
            }

            // 选取坐标圆形范围内物品添加到物品组(坐标)并创建物品组
            // 参数 real x, real y, real radius
            // 返回值 thistype
            static method GroupEnumItemsInRange_B (real x, real y, real radius) -> thistype {
                g = thistype.create();
                Range = radius;
                PO_SetRect(Rect, x, y, radius);
                EnumItemsInRect(Rect, null, function (){
                    thistype this = g;
                    real x = GetRectCenterX(Rect);
                    real y = GetRectCenterY(Rect);
                    real x1= GetItemX(GetEnumItem());
                    real y1= GetItemY(GetEnumItem());
                    if (DisXY(x, y, x1, y1) <= Range) {this.AddItem(GetEnumItem());}
                });
                return g;
            }

            // 选取区域内物品添加到物品组并创建物品组
            // 参数 rect r
            // 返回值 thistype
            static method GroupEnumItemsInRange_C (rect r) -> thistype {
                g = thistype.create();
                EnumItemsInRect(r, null, function (){
                    thistype this = g;
                    this.AddItem(GetEnumItem());
                });
                return g;
            }

            // 物品组删除并返回一个物品
            // 参数 ItemGroup this
            // 返回值 item
            method DestroyFinallyItem() -> item {
                item value;
                if (this.max > 0) {
                    value = LoadItemGroup(this, this.max);
                    RemoveItemGroup(this, this.max);
                    this.max -= 1;
                    return value;
                } else {
                    return null;
                }
            }
        }
    }

    public {
        integer PO_lastCreatedItemGroup = 0;

        // 物品组新建
        function PO_ItemGroup_create() -> ItemGroup {
            ItemGroup this = ItemGroup.create();
            PO_lastCreatedItemGroup = this;
            return PO_lastCreatedItemGroup;
        }

        // 物品组删除
        function PO_ItemGroup_Destroy(ItemGroup this) { this.Destroy(); }

        // 物品组清空
        function PO_ItemGroup_Clear(ItemGroup this) { this.Clear(); }

        // 物品组总数
        function PO_ItemGroup_Quantity(ItemGroup this) -> integer { return this.Quantity(); }

        // 物品在物品组中的排序
        function PO_ItemGroup_IsItemInGroupSorting(ItemGroup this, item value) -> integer { return this.IsItemInGroupSorting(value); }

        // 物品组中是否存在某个物品
        function PO_ItemGroup_IsItemInGroup(ItemGroup this, item value) -> boolean { return this.IsItemInGroup(value); }

        // 添加物品
        function PO_ItemGroup_AddItem(ItemGroup this, item value) { this.AddItem(value); }

        // 移除物品
        function PO_ItemGroup_DestroyItem(ItemGroup this, item value) { this.DestroyItem(value); }

        // 将物品组中所有物品添加进物品组
        function PO_ItemGroup_Engraved(ItemGroup this, ItemGroup self) { this.Engraved(self); }

        // 物品组中第一个物品
        function PO_ItemGroup_FirstOfItemGroup(ItemGroup this) -> item { return this.FirstOfItemGroup(); }

        // 物品组中随机物品
        function PO_ItemGroup_RandomOfItemGroup(ItemGroup this) -> item { return this.RandomOfItemGroup(); }

        // 选取坐标圆形范围内物品添加到物品组(坐标)
        function PO_ItemGroup_GroupEnumItemsInRange(ItemGroup this, real x, real y, real radius) { this.GroupEnumItemsInRange(x, y, radius); }

        // 选取区域内物品添加到物品组
        function PO_ItemGroup_GroupEnumItemsInRange_A(ItemGroup this, rect r) { this.GroupEnumItemsInRange_A(r); }

        // 选取坐标圆形范围内物品添加到物品组(坐标)并创建物品组
        function PO_ItemGroup_GroupEnumItemsInRange_B(real x, real y, real radius) ->ItemGroup { return ItemGroup.GroupEnumItemsInRange_B(x, y, radius); }

        // 选取区域内物品添加到物品组并创建物品组
        function PO_ItemGroup_GroupEnumItemsInRange_C(rect r) ->ItemGroup { return ItemGroup.GroupEnumItemsInRange_C(r); }

        // 物品组删除并返回一个物品
        function DestroyFinallyItem(ItemGroup this) -> item { return this.DestroyFinallyItem(); }
    }
}
//! endzinc
#endif
