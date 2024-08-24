#ifndef IntGroupIncluded
#define IntGroupIncluded

#define SaveIntGroup(self, index, value)   SaveInteger(ht, self, index, value)
#define LoadIntGroup(self, index)          LoadInteger(ht, self, index)
#define FlushIntGroup(self)                FlushChildHashtable(ht, self)

#define SaveWhtGroup(self, index, value)   SaveReal(ht, self, index + <?=StringHash("权重")?>, value)
#define LoadWhtGroup(self, index)          LoadReal(ht, self, index + <?=StringHash("权重")?>)

//  整数组
//! zinc
library IntGroup
{
    // strict 私有结构体
    // public strict 公共结构体
    public struct IntGroup
    {
        private {
            static hashtable ht = InitHashtable();
            integer min,max;
            real weight;
        }

        public {
            // 整数组新建
            // 返回值 IntGroup
            static method create() -> thistype {
                thistype this = thistype.allocate();
                this.min      = 1;
                this.max      = 0;
                this.weight   = 0.0;
                return this;
            }

            // 整数组删除
            // 参数 IntGroup this
            method Destroy() {
                this.min      = 0;
                this.max      = 0;
                this.weight   = 0.0;
                FlushIntGroup(this);
                this.deallocate();
            }

            // 整数组清空
            // 参数 IntGroup this
            method Clear() {
                this.min      = 1;
                this.max      = 0;
                this.weight   = 0.0;
                FlushIntGroup(this);
            }

            // 添加整数
            // 参数 IntGroup this, integer index
            method Addint(integer index) {
                this.max     += 1;
                this.weight  += 1.0;
                SaveWhtGroup(this, this.max, 1.0);
                SaveIntGroup(this, this.max, index);
            }

            // 添加整数(权重)
            // 参数 IntGroup this, integer index, real wgt
            method AddintWeight(integer index, real wgt) {
                this.max     += 1;
                this.weight  += wgt;
                SaveWhtGroup(this, this.max, wgt);
                SaveIntGroup(this, this.max, index);
            }

            // 抽取整数并返回该整数
            // 参数 IntGroup this, boolean flag
            // flag  [true:保留整数   false:不保留整数]
            // 返回值 integer  [整数组为空返回整数0]
            method Getint(boolean flag) -> integer {
                integer value = 0, index;
                real r1 = this.weight * GetRandomReal(0.0, 1.0), r2;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        r2 = LoadWhtGroup(this, index);
                        if (r2 >= r1) {
                            value = LoadIntGroup(this, index);
                            if (!flag) {
                                SaveWhtGroup(this, index, LoadWhtGroup(this, this.max));
                                SaveIntGroup(this, index, LoadIntGroup(this, this.max));
                                SaveWhtGroup(this, this.max, 0.0);
                                SaveIntGroup(this, this.max, 0);
                                this.max -= 1;
                                this.weight -= r2;
                                debug BJDebugMsg("[整数组] - 不保留整数");
                            }
                            return value;
                        } else {
                            r1 -= r2;
                        }
                    }
                } else {
                    debug BJDebugMsg("[整数组] - 整数组为空");
                    return 0;
                }
                return 0;
            }

            // 整数组总数
            // 参数 IntGroup this
            // 返回值 integer
            method Quantity() -> integer {
                return this.max;
            }

            // 复刻整数组
            // 参数 IntGroup this
            // 返回值 IntGroup
            method Engraved() -> IntGroup {
                integer index;
                thistype self = thistype.allocate();
                self.min      = this.min;
                self.max      = this.max;
                self.weight   = this.weight;
                for (self.min <= index <= self.max) {
                    SaveWhtGroup(self, index, LoadWhtGroup(this, index));
                    SaveIntGroup(self, index, LoadIntGroup(this, index));
                }
                return self;
            }

            // 整数组中是否存在某个整数
            // 参数 IntGroup this, integer value
            // 返回值 boolean
            method IsIntInGroup(integer value) -> boolean {
                integer index;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadIntGroup(this, index) == value) {
                            return true;
                        }
                    }
                } else {
                    debug BJDebugMsg("[整数组] - 整数组为空");
                }
                return false;
            }

            // 整数组删除整数
            // 参数 IntGroup this, integer value
            method DestroyInt(integer value) {
                integer index, z = 0;
                real r2 = 0.0;
                if (this.max > 0) {
                    for (this.min <= index <= this.max) {
                        if (LoadIntGroup(this, index) == value) {
                            z = index;
                            r2 = LoadWhtGroup(this, this.max);
                            break;
                        }
                    }
                    if (z > 0) {
                        SaveWhtGroup(this, z, LoadWhtGroup(this, this.max));
                        SaveIntGroup(this, z, LoadIntGroup(this, this.max));
                        SaveWhtGroup(this, this.max, 0.0);
                        SaveIntGroup(this, this.max, 0);
                        this.max -= 1;
                        this.weight -= r2;
                    } else {
                        debug BJDebugMsg("[整数组] - 不存在的整数");
                    }
                } else {
                    debug BJDebugMsg("[整数组] - 整数组为空");
                }
            }

            // 整数组删除并返回一个整数
            // 参数 IntGroup this
            // 返回值 integer
            method DestroyFinallyInt() -> integer {
                integer value;
                if (this.max > 0) {
                    value = LoadIntGroup(this, this.max);
                    SaveWhtGroup(this, this.max, 0);
                    SaveIntGroup(this, this.max, 0);
                    this.max -= 1;
                    return value;
                }
                return 0;
            }
        }
    }

    public {
        integer PO_lastCreatedIntGroup = 0;

        // 整数组新建
        function pp_IntGroup_create() -> IntGroup {
            IntGroup this = IntGroup.create();
            PO_lastCreatedIntGroup = this;
            return PO_lastCreatedIntGroup;
        }

        // 整数组删除
        function pp_IntGroup_Destroy(IntGroup this) { this.Destroy(); }

        // 整数组清空
        function pp_IntGroup_Clear(IntGroup this) { this.Clear(); }

        // 添加整数
        function pp_IntGroup_Addint(IntGroup this, integer index) { this.Addint(index); }

        // 添加整数(权重)
        function pp_IntGroup_AddintWeight(IntGroup this, integer index, real wgt) { this.AddintWeight(index, wgt); }

        // 抽取整数并返回该整数
        function pp_IntGroup_Remove(IntGroup this, boolean flag) -> integer { return this.Getint(flag); }

        // 整数组总数
        function pp_IntGroup_Quantity(IntGroup this) -> integer { return this.Quantity(); }

        // 复刻整数组
        function pp_IntGroup_Engraved(IntGroup this) -> IntGroup { return this.Engraved(); }

        // 整数组中是否存在某个整数
        function pp_IntGroup_IsIntInGroup(IntGroup this, integer index) -> boolean { return this.IsIntInGroup(index); }

        // 整数组删除整数
        function pp_IntGroup_DestroyInt(IntGroup this, integer index) { this.DestroyInt(index); }

        // 整数组删除并返回一个整数
        function DestroyFinallyInt(IntGroup this) -> integer { return this.DestroyFinallyInt(); }
    }
}
//! endzinc
#endif
