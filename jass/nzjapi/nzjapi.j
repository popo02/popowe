#ifndef nzjapi_LIBRARY
#define nzjapi_LIBRARY

#include "BlizzardAPI.j"


//! zinc
library nzjapi requires japi
{
    private
    {
        hashtable   ht              = InitHashtable();
        real        screen[];
        real        world[];
        location    loc             = Location(0., 0.);
        string      moveType[];

        function onInit() {
            DzLoadToc("Ui\\textareaPath.toc");
            moveType[0] = "";
            moveType[1] = "foot";
            moveType[2] = "horse";
            moveType[3] = "fly";
            moveType[4] = "hover";
            moveType[5] = "float";
            moveType[6] = "amph";
            <?import("Console.lua")[=[
            ]=]?>
            <?import("Maprecord.lua")[=[
                Maprecord = true
            ]=]?>
        }
    }

    public
    {
        //继承lua函数,进行同函数名字的强制封装
        //  单位世界坐标转换成ui坐标-lua函数调用
        function ConverUnitWorldPosition(unit u) { GetTriggeringTrigger(); } 

        function unit_overhead(unit u) -> real { GetTriggeringTrigger();return 0.0; } 
        
        //  x、y、z世界坐标转换成ui坐标-lua函数调用
        function ConverRealWorldPosition(real x , real y ,real z) { GetTriggeringTrigger(); }

        function ConverRealPositionWorld(real x , real y) { GetTriggeringTrigger(); }
            
        function GetScreenX() -> real { GetTriggeringTrigger();return 0.0; }
        
        function GetScreenY() -> real { GetTriggeringTrigger();return 0.0; } 

        function GetScreenScale() -> real { GetTriggeringTrigger();return 0.0; }

        //  获取当前技能面板的X,Y位置的技能id
        function GetAbilityXY(integer x, integer y) -> integer { GetTriggeringTrigger();return 0; }

        //  获取转换后的世界坐标X
        function GetWorldX() -> real { GetTriggeringTrigger();return 0.0; }
        
        //  获取转换后的世界坐标Y
        function GetWorldY() -> real { GetTriggeringTrigger();return 0.0; }

        //  主动绑定effect 到 handle 上面 可以单位绑 特效 可以特效绑 特效
        function BindEffect1(unit Handle, string socket, effect e) { GetTriggeringTrigger(); }

        //  主动绑定effect 到 handle 上面 可以单位绑 特效 可以特效绑 特效
        function BindEffect2(item Handle, string socket, effect e) { GetTriggeringTrigger(); }

        //  主动绑定effect 到 handle 上面 可以单位绑 特效 可以特效绑 特效
        function BindEffect3(effect Handle, string socket, effect e) { GetTriggeringTrigger(); }

    //函数
        //  读取内置版本信息[内置japi]
        function PO_HS_1600() -> string  { return GetPluginVersion(); }

        //  异步获取当前选择的单位[内置japi]
        function PO_HS_1601() -> unit    { return GetRealSelectUnit(); }

        //  异步获取当前鼠标指向的单位[内置japi]
        function PO_HS_1602() -> unit    { return GetTargetObject(); }

        //  获取当前模型内存个数
        function PO_HS_1603() -> integer { return GetCacheModelCount(); }

        //  当前war3是否为窗口模式
        function PO_HS_1604() -> boolean { return IsWindowMode(); }

        //  读取当前游戏fps
        function PO_HS_1605() -> real    { return GetFps(); }

        //  构建一个模型Frame
        function PO_HS_1606() -> integer { GetTriggeringTrigger();return 0; }

        //  获取转换后的世界坐标
        function PO_HS_1608(real x, real y, integer id) -> real
        {
            ConverRealPositionWorld(x, 0.6 - y);
            world[1] = GetWorldX();
            world[2] = GetWorldY();
            return world[id];
        }

        //  获取父控件  /** 获取指定frame的父控件 不能对simple类型的控件使用 可以获取 大头像模型 的父控件 然后为其新建子控件 用来放置在所有界面之下 */
        function PO_HS_1609(integer p1) -> integer { return FrameGetParent(p1); }

        //  获取子控件  /** 获取指定frame的子控件 不能对simple类型的控件使用 */
        function PO_HS_1610(integer p1, integer p2) -> integer { return FrameGetChilds(p1, p2); }

        //  获取商店目标  /** 获取指定商店 选择 指定玩家的哪个单位 返回值是同步的接口 可以安全使用 */
        function PO_HS_1611(unit p1, player p2) -> unit { return GetStoreTarget(p1, p2); }

        //  获取当前技能面板的X,Y位置的技能id
        function PO_HS_1612(integer x, integer y) -> integer { return GetAbilityXY(x, y); }

        //  获取转换后的屏幕坐标
        function PO_HS_1613(real x, real y, integer id) -> real
        {
            MoveLocation(loc, x, y);
            ConverRealWorldPosition(x, y, GetLocationZ(loc));
            screen[1] = GetScreenX();
            screen[2] = GetScreenY();
            return screen[id];
        }

        //  构建一个模型Frame
        function PO_HS_1614(integer frame) -> integer { return FrameAddModel(frame); }

        //  网易的uid 整数
        function PO_HS_1615() -> integer { return GetUserId(); }

        //  网易的uid 字符串
        function PO_HS_1616() -> string { return GetUserIdEx(); }

        //  获取物品技能handle
        function PO_HS_1617(item Item, integer slot) -> integer { return GetItemAbility(Item, slot); }

        // 获取 框选按钮 slot 从0 ~ 11
        function PO_HS_1618(integer slot) -> integer { return FrameGetInfoSelectButton(slot); }

        // 获取 下方buff按钮 slot 从0 ~ 7 
        function PO_HS_1619(integer slot) -> integer { return FrameGetBuffButton(slot); }

        // 获取 农民按钮 
        function PO_HS_1620() -> integer { return FrameGetUnitButton(); }

        // 获取 技能右下角数字文本控件 button = 技能按钮  返回值 = SimpleString 类型控件
        function PO_HS_1621(integer button1) -> integer { return FrameGetButtonSimpleString(button1); }

        // 获取 技能右下角控件  button = 技能按钮  返回值 = SimpleFrame 类型控件
        function PO_HS_1622(integer button1) -> integer { return FrameGetButtonSimpleFrame(button1); }

        // 判断控件是否显示
        function PO_HS_1623(integer frame) -> boolean { return FrameIsShow(frame); }

        // 获取原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
        function PO_HS_1624(integer button1) -> string { return FrameGetOriginButtonTexture(button1); }

        // 获取 simple类型控件的 父控件
        function PO_HS_1625(integer SimpleFrame) -> integer { return FrameGetSimpleParent(SimpleFrame); }

        // 为Simple绑定 frame类型的子控件
        // 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
        // 返回的是一个 SetupFrame值
        function PO_HS_1626(integer SimpleFrame, integer Frame) -> integer { return FrameSimpleBindFrame(SimpleFrame, Frame); }

        //  获取单位世界坐标转换后的屏幕坐标
        function PO_HS_1627(unit u, integer id) -> real
        {
            ConverUnitWorldPosition(u);
            screen[1] = GetScreenX();
            screen[2] = GetScreenY();
            return screen[id];
        }




    //动作
        //  设置某个单位的模型[内置japi]
        function PO_DZ_1600(unit cs_1 , string cs_2) { SetUnitModel(cs_1, cs_2); }

        //  设置某个单位的大头像模型[内置japi]
        function PO_DZ_1601(unit cs_1 , string cs_2) { SetUnitPortrait(cs_1, cs_2); }

        //  显示隐藏FPS[内置japi]
        function PO_DZ_1602(boolean cs_1) { ShowFpsText(cs_1); }

        //  锁定解除FPS上限
        function PO_DZ_1603(boolean cs_1) { UnlockFps(cs_1); }

        //  清除模型内存
        function PO_DZ_1604() { ReleaseAllModel(); }

        //  显示隐藏指定单位血条
        function PO_DZ_1605(unit cs_1 , boolean cs_2) { SetUnitPressUIVisible(cs_1, cs_2); }

        //  设置特效显示隐藏
        function PO_DZ_1606(effect cs_1 , boolean cs_2) { EXSetEffectVisible(cs_1, cs_2); }

        //  设置特效在迷雾中是否显示
        function PO_DZ_1607(effect cs_1 , boolean cs_2) { EXSetEffectFogVisible(cs_1, cs_2); }

        //  设置特效在阴影中是否显示
        function PO_DZ_1608(effect cs_1 , boolean cs_2) { EXSetEffectMaskVisible(cs_1, cs_2); }

        //  立即清除字符串泄露
        function PO_DZ_1609() { ReleaseAllString(); }

        //  设置魔兽窗口的宽度高度
        function PO_DZ_1610(integer cs_1 , integer cs_2) { SetWindowSize(cs_1, cs_2); }

        //  设置魔兽窗口在屏幕中的位置
        function PO_DZ_1610_1(real x, real y) { SetWindowPos(0, x, y, 0, 0, 13); }

        //  设置UI移动到单位世界坐标
        function PO_DZ_1611(integer cs_1 , integer cs_2 , unit cs_3 , real cs_4 , real cs_5 , boolean cs_6)
        {
            ConverUnitWorldPosition(cs_3);
            DzFrameSetAbsolutePoint(cs_1, cs_2, GetScreenX() + cs_4, GetScreenY() + cs_5);
            //  是否继承缩放
            if (cs_6 == false) DzFrameSetScale(cs_1 , GetScreenScale());
        }

        //  锁定解除blp像素限制
        function PO_DZ_1612(boolean cs_1) { UnlockBlpSize(cs_1); }

        //  设置内置模型Frame的模型
        function PO_DZ_1613(integer self, string modle, integer id) { GetTriggeringTrigger(); }

        //  设置模型在 场景内的坐标 跟随镜头位置有关系
        function PO_DZ_1614(integer self, real x, real y, real z) { GetTriggeringTrigger(); }

        //  设置镜头位置
        function PO_DZ_1615(integer self, real x, real y, real z) { GetTriggeringTrigger(); }

        //  设置镜头目标位置
        function PO_DZ_1616(integer self, real x, real y, real z) { GetTriggeringTrigger(); }

        //  设置特效颜色 1.特效 2.颜色代码 0xffffffff
        function PO_DZ_1617(effect p1, real red, real green, real blue)
        {
            EXSetEffectColor(p1, 0xFF000000 + 0x10000 * PercentTo255(red) + 0x100 * PercentTo255(green) + PercentTo255(blue));
        }

        //  获取当前技能面板的X,Y位置的技能id
        function PO_DZ_1618(real x, real y) { GetTriggeringTrigger(); }

        //  内置模型-删除绑点特效 需要填 绑特效时的返回值
        function PO_DZ_1619(integer self, integer ID) { GetTriggeringTrigger(); }
        
        //  内置模型-同单位一样的 按照索引播放指定动画  
        function PO_DZ_1620(integer self, integer ID) { FrameSetAnimationByIndex(self, ID); }

        //  设置模型缩放倍率
        function PO_DZ_1621(integer p1, real p2) { GetTriggeringTrigger(); }

        //  设置模型按xyz轴缩放
        function PO_DZ_1622(integer p1, real p2, real p3, real p4) { GetTriggeringTrigger(); }

        //  1623的lua调用
        //  内置模型-设置模型旋转x,y,z轴
        function set_rotate_x(integer p1, real p2) { GetTriggeringTrigger(); }
        function set_rotate_y(integer p1, real p2) { GetTriggeringTrigger(); }
        function set_rotate_z(integer p1, real p2) { GetTriggeringTrigger(); }

        //  设置模型旋转xyz轴
        function PO_DZ_1623(integer p1, integer p2, real p3)
        {
            if (p2 == 1) {
                set_rotate_x(p1, -LoadReal(ht, p1, StringHash("rotatex")));
                set_rotate_x(p1, p3);
                SaveReal(ht, p1, StringHash("rotatex"), p3);
            } else if (p2 == 2) {
                set_rotate_y(p1, -LoadReal(ht, p1, StringHash("rotatey")));
                set_rotate_y(p1, p3);
                SaveReal(ht, p1, StringHash("rotatey"), p3);
            } else {
                set_rotate_z(p1, -LoadReal(ht, p1, StringHash("rotatez")));
                set_rotate_z(p1, p3);
                SaveReal(ht, p1, StringHash("rotatez"), p3);
            }
        }

        //  设置动画播放倍率
        function PO_DZ_1624(integer p1, real p2) { GetTriggeringTrigger(); }

        //  设置模型与控件的偏移坐标
        function PO_DZ_1625(integer p1, real p2, real p3) { GetTriggeringTrigger(); }

        //  设置物品鼠标指向物品提示信息是否显示
        function PO_DZ_1626(item u, boolean is_visible) { GetTriggeringTrigger(); }

        //  设置 忽略鼠标点击事件  默认是 true 填 false 可以 屏蔽鼠标点击
        function PO_DZ_1627(integer p1, boolean p2) { FrameSetIgnoreTrackEvents(p1, p2); }

        //  设置控件视口  /** 设置开启 设置控件视口 比如 底板开启后 他的子控件 在边缘 超出部分不会渲染 */
        function PO_DZ_1628(integer p1, boolean p2) { FrameSetViewPort(p1, p2); }

        //  主动绑定effect 到 handle 上面 可以单位绑 特效 可以特效绑 特效
        function PO_DZ_1629(unit Handle, string socket, effect e) { BindEffect1(Handle, socket, e); }

        function PO_DZ_1630(item Handle, string socket, effect e) { BindEffect2(Handle, socket, e); }

        function PO_DZ_1631(effect Handle, string socket, effect e) { BindEffect3(Handle, socket, e); }

        //  解除特效绑定
        function PO_DZ_1632(effect e) { UnBindEffect(e); }

        //  播放特效动画
        function PO_DZ_1633(effect e, string animation_name) { EXPlayEffectAnimation(e, animation_name, ""); }

        //  可以用来 缩放 单位/特效的 粒子2 的模型缩放 相当于是绿苹果里中间那3个缩放
        function PO_DZ_1634(effect Handle, real scale) { SetPariticle2Size(Handle, scale); }

        //  是用来缩放 ui模型上面的粒子2的
        function PO_DZ_1635(integer Handle, real scale) { FrameSetModelPariticle2Size(Handle, scale); }

        //  是否接触屏幕限制
        function PO_DZ_1636(boolean is_limit) { SetFrameLimitScreen(is_limit); }

        //  设置单位移动类型
        function PO_DZ_1637(unit u, integer p2) { SetUnitMoveType(u, p2:moveType); }

        //  设置单位碰撞体积大小
        function PO_DZ_1638(unit u, real size) { SetUnitCollisionSize(u, size); }

        //  设置原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
        function PO_DZ_1639(integer button1, string path) { FrameSetOriginButtonTexture(button1, path); }

        // 解除绑定 解除后 frame跟simple 就不再关联
        function PO_DZ_1640(integer SetupFrame) { FrameSimpleUnBindFrame(SetupFrame); }

        // 设置 simple类型控件的 父控件
        function PO_HS_1641(integer SimpleFrame, integer parentSimple) { FrameSetSimpleParent(SimpleFrame, parentSimple); }

        // 开启中心计时器
        function pp_stimer_main() -> boolean { GetTriggeringTrigger();return false; } 

        // 新建中心计时器
        function pp_stimer_create(real timeout, boolean periodic, code func) -> timer { GetTriggeringTrigger();return null; }

        // 清除中心计时器
        function pp_stimer_remove() -> boolean { GetTriggeringTrigger();return false; }
        
        // 获取传参Handle
        function pp_stimer_Handle() -> timer { GetTriggeringTrigger();return null; }

        // 血条每帧绘制刷新
        function pp_life_Refresh() -> boolean { GetTriggeringTrigger();return false; }

        // 注册血条
        function pp_life_create(unit u, real p1, real p2, real p3, integer p4) { GetTriggeringTrigger(); }

        // 清除单位血条
        function pp_life_delete(unit u) { GetTriggeringTrigger(); }

        // 设置血条显示上下高度范围
        function pp_life_setBorders(real p1, real p2) { GetTriggeringTrigger(); }

        // 设置单位护盾百分比
        function pp_life_setHDbar(unit u, real p1) { GetTriggeringTrigger(); }

        // 设置单位白条百分比
        function pp_life_setBTbar(unit u, real p1) { GetTriggeringTrigger(); }

        // 设置单位金边显示
        function pp_life_setJBbar(unit u, boolean p1) { GetTriggeringTrigger(); }

        // 清理物编单位和物品中名字带有'#'标识的字符串
        function PO_ClearNotes() ->integer { GetTriggeringTrigger();return 0; }

        // 新建排序组
        function Sort0(integer id) { GetTriggeringTrigger(); }

        // 添加索引和数据
        function Sort1(integer id, integer index, real value) { GetTriggeringTrigger(); }

        // 排序
        function Sort2(integer id, boolean bool) { GetTriggeringTrigger(); }

        // 提取索引
        function Sort3(integer id, integer int) ->integer { GetTriggeringTrigger();return 0; }

        // 提取数据
        function Sort4(integer id, integer int) ->real { GetTriggeringTrigger();return 0; }

        // 清空排序组
        function Sort5(integer id) { GetTriggeringTrigger(); }

        // 删除排序组
        function Sort6(integer id) { GetTriggeringTrigger(); }

        //  打开链接
        function MsgUrl(string msg) { GetTriggeringTrigger(); }
            
        // 一键设置UI模型
        function PO_SetModel(integer p1, string p2) {
            FrameSetModel2(p1, p2, 0);
            FrameSetModelX(p1, 0);
            FrameSetModelY(p1, 0);
            FrameSetModelZ(p1, -100);
            FrameSetModelCameraSource(p1, 200, 0, -20);
            FrameSetModelCameraTarget(p1, 0, 0, -40);
        }

        // 一键调整UI模型位置
        function PO_SetModellocation(integer p1, real x1, real y1, real x2, real y2, real z2, real x3, real y3, real z3) {
            FrameSetModelXY(p1, x1, y2);
            FrameSetModelRotateX(p1, x2);
            FrameSetModelRotateY(p1, y2);
            FrameSetModelRotateZ(p1, z2);
            FrameSetModelX(p1, x3);
            FrameSetModelY(p1, y3);
            FrameSetModelZ(p1, z3);
        }

        // 窗口居中（16:9）
        function CenterWindow() ->integer { GetTriggeringTrigger();return 0; }

        // 去除边框
        function Removeborders(boolean bool) { GetTriggeringTrigger(); }

    }
}
//! endzinc
#endif  // nzjapi_LIBRARY
