#ifndef EctGroupIncluded
#define EctGroupIncluded

#define SaveEctGroup(self, index, value)   SaveInteger(ht, self, index, value)
#define LoadEctGroup(self, index)          LoadInteger(ht, self, index)
#define FlushEctGroup(self)                FlushChildHashtable(ht, self)

//  特效实例组
//! zinc
library EctGroup requires Effect
{
    public struct EctGroup
    {
        private {
            static hashtable ht = InitHashtable();
            integer min,max;
        }

        public {
            // 特效实例组新建
            // 返回值 EctGroup
            static method create() -> thistype {
                thistype this = thistype.allocate();
                this.min      = 1;
                this.max      = 0;
                return this;
            }

            // 特效实例组删除
            // 参数 EctGroup this
            method Destroy() {
                this.min      = 0;
                this.max      = 0;
                FlushEctGroup(this);
                this.deallocate();
            }

            // 特效实例组清空
            // 参数 EctGroup this
            method Clear() {
                this.min      = 1;
                this.max      = 0;
                FlushEctGroup(this);
            }

            // 特效实例组总数
            // 参数 EctGroup this
            // 返回值 integer
            method Quantity() -> integer {
                return this.max;
            }

            //  特效实例在特效实例组中的排序
            method IsEctInGroupSorting (Effect value)  -> integer {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadEctGroup(this, index) == value) {
                            return index;
                        }
                    }
                } else {
                    debug BJDebugMsg("特效实例组为空");
                }
                return 0;
            }

            // 特效实例组中是否存在某个特效实例
            // 参数 EctGroup this, integer value
            // 返回值 boolean
            method IsEctInGroup(Effect value) -> boolean {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadEctGroup(this, index) == value) {
                            return true;
                        }
                    }
                } else {
                    debug BJDebugMsg("特效实例组为空");
                }
                return false;
            }

            // 添加特效实例
            // 参数 EctGroup this, Effect index
            method Addect(Effect index) {
                this.max     += 1;
                SaveEctGroup(this, this.max, index);
            }

            // 移除特效实例
            // 参数 EctGroup this, integer value
            method DestroyEct(Effect value) {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadEctGroup(this, index) == value) {
                            SaveEctGroup(this, index, LoadEctGroup(this, this.max));
                            SaveEctGroup(this, this.max, 0);
                            this.max -= 1;
                            return;
                        }
                    }
                } else {
                    debug BJDebugMsg("特效实例组为空");
                }
                debug BJDebugMsg("不存在的特效实例");
            }

            // 将特效实例组中所有特效实例添加进特效实例组
            // 参数 EctGroup this, EctGroup self
            method Engraved(EctGroup self) {
                integer index;
                for (this.min <= index <= this.max) {
                    self.Addect(LoadEctGroup(this, index));
                }
            }

            // 特效实例组中第一个特效实例
            // 参数 EctGroup this
            method FirstOfEctGroup() -> Effect {
                if (this.max > 0) {
                    return LoadEctGroup(this, 1);
                } else {
                    debug BJDebugMsg("特效实例组为空");
                    return 0;
                }
                debug BJDebugMsg("不存在的特效实例");
                return 0;
            }

            // 特效实例组中随机特效实例
            // 参数 EctGroup this
            method RandomOfEctGroup() -> Effect {
                if (this.max > 0) {
                    return LoadEctGroup(this, GetRandomInt(this.min, this.max));
                } else {
                    debug BJDebugMsg("特效实例组为空");
                    return 0;
                }
                debug BJDebugMsg("不存在的特效实例");
                return 0;
            }

            // 特效实例组删除并返回一个特效实例
            // 参数 EctGroup this
            // 返回值 integer
            method DestroyFinallyEct() -> Effect {
                Effect value;
                if (this.max > 0) {
                    value = LoadEctGroup(this, this.max);
                    SaveEctGroup(this, this.max, 0);
                    this.max -= 1;
                    return value;
                } else {
                    return 0;
                }
            }
        }
    }

    public {
        integer PO_lastCreatedEctGroup = 0;

        // 特效实例组新建
        function PO_EctGroup_create() -> EctGroup {
            EctGroup this = EctGroup.create();
            PO_lastCreatedEctGroup = this;
            return PO_lastCreatedEctGroup;
        }

        // 特效实例组删除
        function PO_EctGroup_Destroy(EctGroup this) { this.Destroy(); }

        // 特效实例组清空
        function PO_EctGroup_Clear(EctGroup this) { this.Clear(); }

        // 特效实例组总数
        function PO_EctGroup_Quantity(EctGroup this) -> integer { return this.Quantity(); }

        // 特效实例在特效实例组中的排序
        function PO_EctGroup_IsEctInGroupSorting(EctGroup this, Effect value) -> integer { return this.IsEctInGroupSorting(value); }

        // 特效实例组中是否存在某个特效实例
        function PO_EctGroup_IsEctInGroup(EctGroup this, Effect value) -> boolean { return this.IsEctInGroup(value); }

        // 添加特效实例
        function PO_EctGroup_Addect(EctGroup this, Effect value) { this.Addect(value); }

        // 移除特效实例
        function PO_EctGroup_DestroyEct(EctGroup this, Effect value) { this.DestroyEct(value); }

        // 将特效实例组中所有特效实例添加进特效实例组
        function PO_EctGroup_Engraved(EctGroup this, EctGroup self) { this.Engraved(self); }

        // 特效实例组中第一个特效实例
        function PO_EctGroup_FirstOfEctGroup(EctGroup this) -> Effect { return this.FirstOfEctGroup(); }

        // 特效实例组中随机特效实例
        function PO_EctGroup_RandomOfEctGroup(EctGroup this) -> Effect { return this.RandomOfEctGroup(); }

        // 特效实例组删除并返回一个特效实例
        function DestroyFinallyEct(EctGroup this) -> Effect { return this.DestroyFinallyEct(); }
    }
}
//! endzinc
#endif
