#ifndef FrameIncluded
#define FrameIncluded

#include "BlizzardAPI.j"

//  界面
//! zinc
library Frame requires BzAPI, Other
{
    private {
        hashtable ht = InitHashtable();
        integer Resolution = 1;              // frame分辨率计算模式
    }

    public {
        // UI分辨率计算模式
        function PO_Frame_Res(integer i ) {
            Resolution = i;
        }

        //  UI分辨率计算UI宽
        function PO_Frame_X(real x, real s)  -> real {
            real value = 1440;
            if (Resolution == 1) {
                value = 1440;
            } else if (Resolution == 2) {
                value = 1920;
            }
            return 0.8 * (x / value) * s;
        }

        //  UI分辨率计算UI高
        function PO_Frame_Y(real y, real s)  -> real {
            real value = 1080;
            if (Resolution == 1) {
                value = 1080;
            } else if (Resolution == 2) {
                value = 1080;
            }
            return 0.6 * (y / value) * s;
        }

        //  设置Frame的大小（分辨率）
        function PO_FrameSetSizeRes(integer frame, real x, real y, real s) {
            SaveReal(ht, frame, strHash("X"), PO_Frame_X(x, s));
            SaveReal(ht, frame, strHash("Y"), PO_Frame_Y(y, s));
            DzFrameSetSize(frame, PO_Frame_X(x, s), PO_Frame_Y(y, s));
        }

        //  设置Frame的大小
        function PO_FrameSetSize(integer frame, real x, real y) {
            SaveReal(ht, frame, strHash("X"), x);
            SaveReal(ht, frame, strHash("Y"), y);
            DzFrameSetSize(frame, x, y);
        }

        //  设置Frame缩放
        function PO_FrameSetScale(integer frame, real size) {
            real x = LoadReal(ht, frame, strHash("X"));
            real y = LoadReal(ht, frame, strHash("Y"));
            DzFrameSetSize(frame, x*size, y*size);
        }

        //  设置窗体横排排序算法 1.排序窗体 2.锚点 3.跟随窗体 4.锚点 5.首位X坐标 6.首位Y坐标 7.X间距 8.Y间距 9.排序横排数量 10.排序id  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
        function PO_FrameSortingHor (integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y, real Xi, real Yi, integer indx, integer i) {
            real FrameX = Xi * I2R((i-1) - ((i-1) / indx * indx)) + x;
            real FrameY = Yi * I2R((i-1) / indx) + y;
            DzFrameSetPoint(frame, point, relativeFrame, relativePoint, FrameX, FrameY);
        }

        //  设置窗体竖排排序算法 1.排序窗体 2.锚点 3.跟随窗体 4.锚点 5.首位X坐标 6.首位Y坐标 7.X间距 8.Y间距 9.排序竖排数量 10.排序id  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
        function PO_FrameSortingVer (integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y, real Xi, real Yi, integer indx, integer i) {
            real FrameX = Xi * I2R((i-1) / indx) + x;
            real FrameY = Yi * I2R((i-1) - ((i-1) / indx * indx)) + y;
            DzFrameSetPoint(frame, point, relativeFrame, relativePoint, FrameX, FrameY);
        }

        //  设置UI的移动与淡化
        function PO_SetmobileAlpha(player Play, integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y, real dis, real deg, real s, real time, integer Alpha, boolean enable)  -> nothing {
            timer t;
            integer hand;
            integer pid = GetHandleId(Play);
            if (!LoadBoolean(ht, pid, frame + strHash("移动淡化"))) {
                t = CreateTimer();
                hand = GetHandleId(t);
                SaveBoolean(ht, pid, frame + strHash("移动淡化"), true);
                SavePlayerHandle(ht, hand, strHash("Play"), Play);
                SaveInteger(ht, hand, strHash("frame"), frame);
                SaveInteger(ht, hand, strHash("point"), point);
                SaveInteger(ht, hand, strHash("relativeFrame"), relativeFrame);
                SaveInteger(ht, hand, strHash("relativePoint"), relativePoint);
                SaveReal(ht, hand, strHash("x"), x);
                SaveReal(ht, hand, strHash("y"), y);
                SaveReal(ht, hand, strHash("dis"), dis);
                SaveReal(ht, hand, strHash("deg"), deg);
                SaveReal(ht, hand, strHash("s"), s);
                SaveReal(ht, hand, strHash("time"), time);
                SaveInteger(ht, hand, strHash("Alpha"), Alpha);
                SaveBoolean(ht, hand, strHash("enable"), enable);
                if (Play == GetLocalPlayer()) {
                    DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x, y);
                    DzFrameShow(frame, true);
                    //  Alpha(1.无 2.渐淡 3.渐显 4.渐淡渐显 5.渐显渐淡)
                    if (Alpha == 1 || Alpha == 2 ||Alpha == 4) {
                        DzFrameSetAlpha(frame, PercentTo255(100.0));
                    } else {
                        DzFrameSetAlpha(frame, PercentTo255(0.0));
                    }
                }
                TimerStart(t, s, true, function(){
                    timer t = GetExpiredTimer();
                    integer hand = GetHandleId(t);
                    player  Play = LoadPlayerHandle(ht, hand, strHash("Play"));
                    integer pid = GetHandleId(Play);
                    integer frame = LoadInteger(ht, hand, strHash("frame"));
                    integer point = LoadInteger(ht, hand, strHash("point"));
                    integer relativeFrame = LoadInteger(ht, hand, strHash("relativeFrame"));
                    integer relativePoint = LoadInteger(ht, hand, strHash("relativePoint"));
                    real x = LoadReal(ht, hand, strHash("x"));
                    real y = LoadReal(ht, hand, strHash("y"));
                    real dis = LoadReal(ht, hand, strHash("dis"));
                    real deg = LoadReal(ht, hand, strHash("deg"));
                    real s = LoadReal(ht, hand, strHash("s"));
                    real time = LoadReal(ht, hand, strHash("time"));
                    integer Alpha = LoadInteger(ht, hand, strHash("Alpha"));
                    boolean enable = LoadBoolean(ht, hand, strHash("enable"));
                    
                    //  运行次数
                    real i = LoadReal(ht, hand, strHash("i")) + s;
                    //  XY位移计算
                    real move_x = PO_MobileX(x, (dis / time) * i, deg);
                    real move_y = PO_MobileY(y, (dis / time) * i, deg);
                    //  初始透明度
                    real alp = 0.0;

                    //  透明度计算
                    if (Alpha == 1) {
                        alp  = 100.0;
                    } else if (Alpha == 2) {
                        alp  = 100.0 - ((100.0 / time) * i);
                    } else if (Alpha == 3) {
                        alp  = 0.0 + ((100.0 / time) * i);
                    } else if (Alpha == 4) {
                        if (i <= time / 2) {
                            alp  = 100.0 - ((100.0 / time * 2) * i);
                        } else {
                            alp  = 100.0 - ((100.0 / time * 2) * (time - i));
                        }
                    } else if (Alpha == 5) {
                        if (i <= time / 2) {
                            alp  = 0.0 + ((100.0 / time * 2) * i);
                        } else {
                            alp  = 0.0 + ((100.0 / time * 2) * (time - i));
                        }
                    }

                    SaveReal(ht, hand, strHash("i"), i);

                    if (i >= time) {
                        SaveBoolean(ht, pid, frame + strHash("移动淡化"), false);
                        if (Play == GetLocalPlayer()) {
                            DzFrameShow(frame, enable);
                        }
                        FlushChildHashtable(ht, hand);
                        DestroyTimer(t);
                    } else {
                        if (Play == GetLocalPlayer()) {
                            DzFrameSetPoint(frame, point, relativeFrame, relativePoint, move_x, move_y);
                            DzFrameSetAlpha(frame, PercentTo255(alp));
                        }
                    }
                    t = null;
                    Play = null;
                });
            }
            t = null;
        }

        // 设置frame坐标偏移
        function PO_FrameSetPoint(integer frame, real x, real y) {
            GetTriggerPlayer();
        }
    }
}
//! endzinc
#endif
