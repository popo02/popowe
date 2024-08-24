#ifndef SortGroupIncluded
#define SortGroupIncluded

//  物品组
//! zinc
library SortGroup
{
    public struct SortGroup
    {
        public {
            //  新建排序组
            static method Create()  -> thistype {
                thistype this = thistype.allocate();
                Sort0(this);
                return this;
            }

            //  添加索引和数据
            method AddSorting(integer index, real value) {
                Sort1(this, index, value);
            }

            //  排序
            method Sorting(boolean bool) {
                Sort2(this, bool);
            }

            //  提取索引
            method GetIndex(integer index) -> integer {
                return Sort3(this, index);
            }

            //  提取数据
            method GetValue(integer index) -> real {
                return Sort4(this, index);
            }

            //  清空排序组
            method Clear() {
                Sort5(this);
            }

            // 删除排序组
            method Destroy() {
                Sort6(this);
                this.deallocate();
            }
        }
    }
    public {
        integer PO_lastCreatedSortGroup = 0;
        
        // 新建排序组
        function PO_Sort_create() -> SortGroup {
            SortGroup this = SortGroup.create();
            PO_lastCreatedSortGroup = this;
            return PO_lastCreatedSortGroup;
        }

        // 添加索引和数据
        function PO_Sort_AddSorting(SortGroup this, integer index, real value) { this.AddSorting(index, value); }

        // 排序
        function PO_Sort_Sorting(SortGroup this, boolean bool) { this.Sorting(bool); }

        // 提取索引
        function PO_Sort_GetIndex(SortGroup this, integer index) -> integer { return this.GetIndex(index); }

        // 提取数据
        function PO_Sort_GetValue(SortGroup this, integer index) -> real { return this.GetValue(index); }

        // 清空排序组
        function PO_Sort_Clear(SortGroup this) { this.Clear(); }

        // 删除排序组
        function PO_Sort_Destroy(SortGroup this) { this.Destroy(); }
    }
}
//! endzinc
#endif
