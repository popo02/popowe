#ifndef DRAGINCLUDE
#define DRAGINCLUDE

#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

#include "BlizzardAPI.j"

//! zinc
library Drag requires BzAPI
{
    public struct Drag {
        private {
            //  鼠标进入UI标识
            static boolean   MouseEnt = false;
            //  鼠标点击左键标识
            static boolean   MouseCli = false;
            //  移动的Frame
            static integer   Point, RelativeFrame, RelativePoint;
            //  哈希表
            static hashtable ht       = InitHashtable();
            //  屏幕鼠标x,y
            static real Drag_X = 0.0;
            static real Drag_Y = 0.0;
            static real Move_X = 0.0;
            static real Move_Y = 0.0;
            static real Size_X = 0.0;
            static real Size_Y = 0.0;
            static real Cor_X  = 0.0;
            static real Cor_Y  = 0.0;
            static real Siz_X  = 0.0;
            static real Siz_Y  = 0.0;
            static integer Frame = 0;
            static integer Move_XY  = 0;
            static real Min    = 0.0;
            static real Max    = 0.0;

            //  鼠标相对位置的x坐标  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method screenX (integer point)  -> real {
                Screen_XY();
                if (point == 0) return Screen_X;
                if (point == 1) return Screen_X - 0.40;
                if (point == 2) return Screen_X - 0.80;
                if (point == 3) return Screen_X;
                if (point == 4) return Screen_X - 0.40;
                if (point == 5) return Screen_X - 0.80;
                if (point == 6) return Screen_X;
                if (point == 7) return Screen_X - 0.40;
                if (point == 8) return Screen_X - 0.80;
                return 0.0;
            }

            //  鼠标相对位置的y坐标  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method screenY (integer point)  -> real {
                Screen_XY();
                if (point == 0) return Screen_Y - 0.60;
                if (point == 1) return Screen_Y - 0.60;
                if (point == 2) return Screen_Y - 0.60;
                if (point == 3) return Screen_Y - 0.30;
                if (point == 4) return Screen_Y - 0.30;
                if (point == 5) return Screen_Y - 0.30;
                if (point == 6) return Screen_Y;
                if (point == 7) return Screen_Y;
                if (point == 8) return Screen_Y;
                return 0.0;
            }

            //  鼠标屏幕边缘碰撞x坐标计算  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method sizeX (integer point)  -> real {
                if (point == 0) return 0.40;
                if (point == 1) return 0.00;
                if (point == 2) return -0.40;
                if (point == 3) return 0.40;
                if (point == 4) return 0.00;
                if (point == 5) return -0.40;
                if (point == 6) return 0.40;
                if (point == 7) return 0.00;
                if (point == 8) return -0.40;
                return 0.0;
            }

            //  鼠标屏幕边缘碰撞y坐标计算  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method sizeY (integer point)  -> real {
                if (point == 0) return -0.30;
                if (point == 1) return -0.30;
                if (point == 2) return -0.30;
                if (point == 3) return 0.00;
                if (point == 4) return 0.00;
                if (point == 5) return 0.00;
                if (point == 6) return 0.30;
                if (point == 7) return 0.30;
                if (point == 8) return 0.30;
                return 0.0;
            }

            //  图片x坐标偏移计算  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method sizX (integer point)  -> real {
                if (point == 0) return -1.00;
                if (point == 1) return 0.00;
                if (point == 2) return 1.00;
                if (point == 3) return -1.00;
                if (point == 4) return 0.00;
                if (point == 5) return 1.00;
                if (point == 6) return -1.00;
                if (point == 7) return 0.00;
                if (point == 8) return 1.00;
                return 0.0;
            }

            //  图片y坐标偏移计算  [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
            static method sizY (integer point)  -> real {
                if (point == 0) return 1.00;
                if (point == 1) return 1.00;
                if (point == 2) return 1.00;
                if (point == 3) return 0.00;
                if (point == 4) return 0.00;
                if (point == 5) return 0.00;
                if (point == 6) return -1.00;
                if (point == 7) return -1.00;
                if (point == 8) return -1.00;
                return 0.0;
            }

        }

        public {
            static real Screen_X, Screen_Y;

            //  鼠标在屏幕中UI的X和Y坐标
            static method Screen_XY () {
                integer x01 = DzGetMouseX();           //获取鼠标在屏幕的坐标X
                integer y01 = DzGetMouseY();           //获取鼠标在屏幕的坐标Y
                integer x02 = DzGetMouseXRelative();   //获取鼠标游戏窗口坐标X
                integer y02 = DzGetMouseYRelative();   //获取鼠标游戏窗口坐标Y
                integer x03 = DzGetWindowWidth();      //获取魔兽窗口宽度
                integer y03 = DzGetWindowHeight();     //获取魔兽窗口高度
                integer x04 = DzGetWindowX();          //获取魔兽窗口X坐标
                integer y04 = DzGetWindowY();          //获取魔兽窗口Y坐标
                integer x05 = x01 - x02 - x04;
                integer y05 = y01 - y02 - y04;
                if (y01 == y02) {
                    Screen_X = (I2R(x02) / I2R(x03)) * 0.80;
                    Screen_Y = 0.60 - ((I2R(y02) / I2R(y03)) * 0.60);
                } else {
                    Screen_X = (I2R(x02) / I2R(x03 - (x05 * 2))) * 0.80;
                    Screen_Y = 0.60 - ((I2R(y02) / I2R(y03 - (x05 + y05))) * 0.60);
                }
            }

            //  设置鼠标进入UI的标识
            static method SetMouseEnt(boolean Switch) { MouseEnt = Switch; }

            //  保存UI的偏移X坐标
            static method saveFrameX(integer frame, real value) {
                SaveReal(ht, frame, strHash("savex"), value);
                SaveReal(ht, frame, strHash("Cor_X"), value);
                
            }

            //  保存UI的偏移Y坐标
            static method saveFrameY(integer frame, real value) {
                SaveReal(ht, frame, strHash("savey"), value);
                SaveReal(ht, frame, strHash("Cor_Y"), value);
            }

            //  获取UI的偏移X坐标
            static method loadFrameX(integer frame) ->real { return LoadReal(ht, frame, strHash("savex")); }

            //  获取UI的偏移Y坐标
            static method loadFrameY(integer frame) ->real { return LoadReal(ht, frame, strHash("savey")); }

            //  判断被移动的UI
            static method IsMouseCli(integer ui) ->boolean { return Frame == ui && MouseCli; }

            //  判断鼠标点击和释放
            static method IsMouseCli2() ->boolean { return MouseCli; }

            //  鼠标点击左键标识 [MouseEnt为true时才能设置 或者MouseCli为true时]
            static method SetMouseCli(boolean Switch) {
                if (LoadBoolean(ht, DzGetMouseFocus(), strHash("IsMove"))) {
                    Frame = DzGetMouseFocus();
                }
                if (MouseEnt && !MouseCli) {
                    RelativePoint = LoadInteger(ht, Frame, strHash("relativePoint"));
                    Cor_X         = LoadReal(ht, Frame, strHash("Cor_X"));
                    Cor_Y         = LoadReal(ht, Frame, strHash("Cor_Y"));
                    Move_X        = screenX(RelativePoint) - Cor_X;
                    Move_Y        = screenY(RelativePoint) - Cor_Y;
                    Siz_X         = LoadReal(ht, Frame, strHash("Siz_X"));
                    Siz_Y         = LoadReal(ht, Frame, strHash("Siz_Y"));
                    Move_XY       = LoadInteger(ht, Frame, strHash("Move_XY"));
                    Min           = LoadReal(ht, Frame, strHash("Min"));
                    Max           = LoadReal(ht, Frame, strHash("Max"));
                    SaveReal(ht, Frame, strHash("Move_X"), Move_X);
                    SaveReal(ht, Frame, strHash("Move_Y"), Move_Y);
                }
                if(MouseEnt || MouseCli) MouseCli = Switch; 
            }

            //  保存UI初始位置  调用方式[Drag.SetPoints(.......);]
            //  [frame:UI  point:自身锚点  relativeFrame:跟随UI  relativePoint:跟随锚点  x:偏移x  y:偏移y  sizex:UI宽  sizey:UI高  movexy:(0:xy皆可拖动  1:x拖动  2:y拖动)  min:最小值限制  max:最大值限制]
            //  movexy不为0时  min、max才会生效
            static method SetPoints (integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y, real sizex, real sizey, integer movexy, real min, real max) {
                SaveInteger(ht, frame, strHash("point"), point);
                SaveInteger(ht, frame, strHash("relativeFrame"), relativeFrame);
                SaveInteger(ht, frame, strHash("relativePoint"), relativePoint);
                SaveReal(ht, frame, strHash("Init_X"), x);
                SaveReal(ht, frame, strHash("Init_Y"), y);
                SaveReal(ht, frame, strHash("Cor_X"), x);
                SaveReal(ht, frame, strHash("Cor_Y"), y);
                SaveReal(ht, frame, strHash("Size_X"), (0.8 - sizex) * 0.5);
                SaveReal(ht, frame, strHash("Size_Y"), -(0.6 - sizey) * 0.5);
                SaveReal(ht, frame, strHash("Siz_X"), sizex * 0.5);
                SaveReal(ht, frame, strHash("Siz_Y"), sizey * 0.5);
                SaveInteger(ht, frame, strHash("Move_XY"), movexy);
                SaveReal(ht, frame, strHash("Min"), min);
                SaveReal(ht, frame, strHash("Max"), max);
                SaveBoolean(ht, frame, strHash("IsMove"), true);
                SaveReal(ht, frame, strHash("savex"), x);
                SaveReal(ht, frame, strHash("savey"), y);
                DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x, y);
                DzFrameSetSize(frame, sizex, sizey);
            }

            //  设置UI移动  调用方式[Drag.MoveFrame();]
            static method MoveFrame () {
                real x[], y[];
                if (MouseCli) {
                    Point         = LoadInteger(ht, Frame, strHash("point"));
                    RelativeFrame = LoadInteger(ht, Frame, strHash("relativeFrame"));
                    RelativePoint = LoadInteger(ht, Frame, strHash("relativePoint"));
                    if (Move_XY == 0) {
                        Cor_X         = screenX(RelativePoint) - LoadReal(ht, Frame, strHash("Move_X"));
                        Cor_Y         = screenY(RelativePoint) - LoadReal(ht, Frame, strHash("Move_Y"));
                        Size_X        = LoadReal(ht, Frame, strHash("Size_X"));
                        Size_Y        = LoadReal(ht, Frame, strHash("Size_Y"));
                        SaveReal(ht, Frame, strHash("Cor_X"), Cor_X);
                        SaveReal(ht, Frame, strHash("Cor_Y"), Cor_Y);

                        x[1]   = sizeX(RelativePoint) + Size_X + (sizX(Point) * Siz_X);
                        x[2]   = sizeX(RelativePoint) + Size_X + (sizX(Point) * Siz_X);
                        if (Cor_X > y[1]) { SaveReal(ht, Frame, strHash("Move_X"), screenX(RelativePoint) - x[1]);Drag_X = x[1]; }
                        else if (Cor_X < y[2]) { SaveReal(ht, Frame, strHash("Move_X"), screenX(RelativePoint) - x[2]);Drag_X = x[2]; }
                        else Drag_X = Cor_X;

                        y[1]   = sizeY(RelativePoint) + Size_Y + (sizY(Point) * Siz_Y);
                        y[2]   = sizeY(RelativePoint) + Size_Y + (sizY(Point) * Siz_Y);
                        if (Cor_Y > y[1]) { SaveReal(ht, Frame, strHash("Move_Y"), screenY(RelativePoint) - y[1]);Drag_Y = y[1]; }
                        else if (Cor_Y < y[2]) { SaveReal(ht, Frame, strHash("Move_Y"), screenY(RelativePoint) - y[2]);Drag_Y = y[2]; }
                        else Drag_Y = Cor_Y;
                    } else if (Move_XY == 1) {
                        Cor_X         = screenX(RelativePoint) - LoadReal(ht, Frame, strHash("Move_X"));
                        SaveReal(ht, Frame, strHash("Cor_X"), Cor_X);

    
                        x[1]   = sizeX(RelativePoint) + Max + (sizX(Point) * Siz_X);
                        x[2]   = sizeX(RelativePoint) + Min + (sizX(Point) * Siz_X);
                        if (Cor_X > y[1]) { SaveReal(ht, Frame, strHash("Move_X"), screenX(RelativePoint) - x[1]);Drag_X = x[1]; }
                        else if (Cor_X < y[2]) { SaveReal(ht, Frame, strHash("Move_X"), screenX(RelativePoint) - x[2]);Drag_X = x[2]; }
                        else Drag_X = Cor_X;

                        Drag_Y = LoadReal(ht, Frame, strHash("Init_Y"));
                    } else {
                        Cor_Y         = screenY(RelativePoint) - LoadReal(ht, Frame, strHash("Move_Y"));
                        SaveReal(ht, Frame, strHash("Cor_Y"), Cor_Y);

                        Drag_X = LoadReal(ht, Frame, strHash("Init_X"));

                        y[1]   = sizeY(RelativePoint) + Max + (sizY(Point) * Siz_Y);
                        y[2]   = sizeY(RelativePoint) + Min + (sizY(Point) * Siz_Y);

                        if (Cor_Y > y[1]) { SaveReal(ht, Frame, strHash("Move_Y"), screenY(RelativePoint) - y[1]);Drag_Y = y[1]; }
                        else if (Cor_Y < y[2]) { SaveReal(ht, Frame, strHash("Move_Y"), screenY(RelativePoint) - y[2]);Drag_Y = y[2]; }
                        else Drag_Y = Cor_Y;
                    }

                    DzFrameSetPoint(Frame, Point, RelativeFrame, RelativePoint, Drag_X, Drag_Y);
                    SaveReal(ht, Frame, strHash("savex"), Drag_X);
                    SaveReal(ht, Frame, strHash("savey"), Drag_Y);
                }
            }

            //  重置UI位置  调用方式[Drag.ResetFrame(.......);]
            static method ResetFrame (integer frame) {
                Point         = LoadInteger(ht, frame, strHash("point"));
                RelativeFrame = LoadInteger(ht, frame, strHash("relativeFrame"));
                RelativePoint = LoadInteger(ht, frame, strHash("relativePoint"));
                Move_X        = LoadReal(ht, frame, strHash("Init_X"));
                Move_Y        = LoadReal(ht, frame, strHash("Init_Y"));
                DzFrameSetPoint(frame, Point, RelativeFrame, RelativePoint, Move_X, Move_Y);
                SaveReal(ht, frame, strHash("Cor_X"), Move_X);
                SaveReal(ht, frame, strHash("Cor_Y"), Move_Y);
                SaveReal(ht, frame, strHash("savex"), Move_X);
                SaveReal(ht, frame, strHash("savey"), Move_Y);
            }

            //  设置UI位置  调用方式[Drag.SetPoint(.......);]
            static method SetPoint (integer frame, real x, real y) {
                Point         = LoadInteger(ht, frame, strHash("point"));
                RelativeFrame = LoadInteger(ht, frame, strHash("relativeFrame"));
                RelativePoint = LoadInteger(ht, frame, strHash("relativePoint"));
                Move_XY       = LoadInteger(ht, frame, strHash("Move_XY"));
                Min           = LoadReal(ht, frame, strHash("Min"));
                Max           = LoadReal(ht, frame, strHash("Max"));
                if (Move_XY == 1) {
                    x = RMinBJ(x, Max);
                    x = RMaxBJ(x, Min);
                    y = LoadReal(ht, frame, strHash("Init_Y"));
                } else if (Move_XY == 2) {
                    x = LoadReal(ht, frame, strHash("Init_X"));
                    y = RMinBJ(y, Max);
                    y = RMaxBJ(y, Min);
                }
                DzFrameSetPoint(frame, Point, RelativeFrame, RelativePoint, x, y);
                SaveReal(ht, frame, strHash("Cor_X"), x);
                SaveReal(ht, frame, strHash("Cor_Y"), y);
                SaveReal(ht, frame, strHash("savex"), x);
                SaveReal(ht, frame, strHash("savey"), y);
            }

            //  获取UI X位置  调用方式[Drag.GetPointX(.......);]
            static method GetPointX (integer frame) -> real {
                return LoadReal(ht, frame, strHash("savex"));
            }

            //  获取UI Y位置  调用方式[Drag.GetPointY(.......);]
            static method GetPointY (integer frame) -> real {
                return LoadReal(ht, frame, strHash("savey"));
            }
        }
    }

    public {
        // 设置鼠标进入UI的标识
        function PO_SetMouseEnt(boolean Switch) { Drag.SetMouseEnt(Switch); }

        //  判断被移动的Frame
        function PO_IsMouseCli(integer ui)  -> boolean { return Drag.IsMouseCli(ui); }

        //  判断鼠标点击和释放
        function PO_IsMouseCli2()  -> boolean { return Drag.IsMouseCli2(); }

        //  鼠标点击左键标识
        function PO_SetMouseCli(boolean Switch) { Drag.SetMouseCli(Switch); }

        //  设置可移动的Frame
        function PO_SetPoints(integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y, real sizex, real sizey, integer movexy, real min, real max) {
            Drag.SetPoints(frame, point, relativeFrame, relativePoint, x, y, sizex, sizey, movexy, min, max);
        }

        //  设置Frame移动
        function PO_MoveFrame() { Drag.MoveFrame(); }

        //  重置Frame位置
        function PO_ResetFrame(integer frame) { Drag.ResetFrame(frame); }

        //  鼠标在屏幕中UI的X坐标
        function PO_Screen_X ()  -> real {
            Drag.Screen_XY();
            return Drag.Screen_X;
        }

        //  鼠标在屏幕中UI的Y坐标
        function PO_Screen_Y ()  -> real {
            Drag.Screen_XY();
            return Drag.Screen_Y;
        }

        //  鼠标在屏幕中UI中心点的X坐标
        function PO_Screen_InX ()  -> real {
            Drag.Screen_XY();
            return Drag.Screen_X - 0.40;
        }

        //  鼠标在屏幕中UI中心点的Y坐标
        function PO_Screen_InY ()  -> real {
            Drag.Screen_XY();
            return Drag.Screen_Y - 0.30;
        }

        //  设置UI位置
        function PO_Screen_SetPoint (integer frame, real x, real y) {
            Drag.SetPoint(frame, x, y);
        }

        //  获取UI X坐标
        function PO_Screen_GetPointX (integer frame) -> real {
            return Drag.GetPointX(frame);
        }

        //  获取UI Y坐标
        function PO_Screen_GetPointY (integer frame) -> real {
            return Drag.GetPointY(frame);
        }
    }
}
//! endzinc

#endif
    