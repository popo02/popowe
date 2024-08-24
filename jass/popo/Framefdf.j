#ifndef FramefdfIncluded
#define FramefdfIncluded

#include "BlizzardAPI.j"

//  界面fdf
//! zinc
library Framefdf requires BzAPI
{
    private {
        hashtable ht = InitHashtable();
        integer PO_ID[];
        integer PO_Index = StringHash("PO控件索引");
        integer PO_Control[];
        integer PO_Texture = StringHash("PO控件贴图");
        integer PO_Slider1 = StringHash("最大值");
        integer PO_Slider2 = StringHash("最小值");
        integer PO_Slider3 = StringHash("步进值");

        //  初始化
        function onInit () {
            DzLoadToc("Ui\\textareaPath.toc");
            PO_ID[1] = 0;
            PO_ID[2] = 0;
            PO_ID[3] = 0;
            PO_ID[4] = 0;
            PO_ID[5] = 0;
            PO_ID[6] = 0;
            PO_Control[1] = StringHash("PO子控件一");
            PO_Control[2] = StringHash("PO子控件二");
            PO_Control[3] = StringHash("PO子控件三");
        }
    }

    public {
        //  获取PO_SLIDER的最大值，最小值，步进值
        function pp_fdf_GetSliderValue (integer frame, integer i) -> real {
            if (i == 1) {return LoadReal(ht, frame, PO_Slider2);}
            else if (i == 2) {return LoadReal(ht, frame, PO_Slider1);}
            else {return LoadReal(ht, frame, PO_Slider3);}
        }

        //  设置PO_SLIDER滑块大小值，步进值，当前值
        function pp_fdf_SetSliderValue (integer frame, real min, real max, real step, real value) {
            DzFrameSetMinMaxValue(frame, min, max);
            DzFrameSetStepValue(frame, step);
            DzFrameSetValue(frame, value);
            SaveReal(ht, frame, PO_Slider1, max);
            SaveReal(ht, frame, PO_Slider2, min);
            SaveReal(ht, frame, PO_Slider3, step);
        }

        //  获取PO_SLIDER滑块
        function pp_fdf_GetSliderThumbButton (integer frame)  -> integer {
            return LoadInteger(ht, frame, PO_Control[2]);
        }

        //  设置PO_SLIDER控件的贴图
        function pp_fdf_SetSliderTexture (integer frame, integer i, string texture) {
            integer ui[];
            ui[1] = LoadInteger(ht, frame, PO_Control[1]);
            ui[3] = LoadInteger(ht, frame, PO_Control[3]);
            if (i == 1) {
                DzFrameSetTexture(ui[1], texture, 0);
            } else {
                DzFrameSetTexture(ui[3], texture, 0);
            }
        }


        //  设置PO_BUTTON控件的贴图
        function pp_fdf_SetButtonTexture (integer frame, integer i, string texture) {
            integer ui[];
            ui[1] = LoadInteger(ht, frame, PO_Control[1]);
            ui[2] = LoadInteger(ht, frame, PO_Control[2]);
            ui[3] = LoadInteger(ht, frame, PO_Control[3]);
            if (i == 1) {
                DzFrameSetTexture(ui[1], texture, 0);
                if (LoadStr(ht, ui[2], PO_Texture) == null) {
                    DzFrameSetTexture(ui[2], texture, 0);
                }
                if (LoadStr(ht, ui[3], PO_Texture) == null) {
                    DzFrameSetTexture(ui[3], texture, 0);
                }
            } else if (i == 2) {
                DzFrameSetTexture(ui[2], texture, 0);
                SaveStr(ht, ui[2], PO_Texture, texture);
            } else {
                DzFrameSetTexture(ui[3], texture, 0);
                SaveStr(ht, ui[3], PO_Texture, texture);
            }
        }

        //  创建Frame控件
        function pp_fdf_create (integer i, integer parent)  -> integer {
            integer frame[];
            if (i == 1) {
                frame[1] = DzCreateFrame("PO_BUTTON-00", parent, i:PO_ID);
                frame[2] = DzFrameFindByName("PO_BUTTON-01", i:PO_ID);
                frame[3] = DzFrameFindByName("PO_BUTTON-02", i:PO_ID);
                frame[4] = DzFrameFindByName("PO_BUTTON-03", i:PO_ID);
                SaveInteger(ht, frame[1], PO_Control[1], frame[2]);
                SaveInteger(ht, frame[1], PO_Control[2], frame[3]);
                SaveInteger(ht, frame[1], PO_Control[3], frame[4]);
            } else if (i == 2) {
                frame[1] = DzCreateFrame("PO_BUTTON", parent, i:PO_ID);
                frame[2] = DzFrameFindByName("PO_BUTTON-1", i:PO_ID);
                frame[3] = DzFrameFindByName("PO_BUTTON-2", i:PO_ID);
                frame[4] = DzFrameFindByName("PO_BUTTON-3", i:PO_ID);
                SaveInteger(ht, frame[1], PO_Control[1], frame[2]);
                SaveInteger(ht, frame[1], PO_Control[2], frame[3]);
                SaveInteger(ht, frame[1], PO_Control[3], frame[4]);
            } else if (i == 3) {
                frame[1] = DzCreateFrame("PO_BACKDROP", parent, i:PO_ID);
            } else if (i == 4) {
                frame[1] = DzCreateFrame("PO_TEXT", parent, i:PO_ID);
            } else if (i == 5) {
                frame[1] = DzCreateFrame("PO_SLIDER-1", parent, i:PO_ID);
                frame[2] = DzFrameFindByName("PO_SLIDER1-1", i:PO_ID);
                frame[3] = DzFrameFindByName("PO_SLIDER2-1", i:PO_ID);
                frame[4] = DzFrameFindByName("PO_SLIDER3-1", i:PO_ID);
                SaveInteger(ht, frame[1], PO_Control[1], frame[2]);
                SaveInteger(ht, frame[1], PO_Control[2], frame[3]);
                SaveInteger(ht, frame[1], PO_Control[3], frame[4]);
            } else {
                frame[1] = DzCreateFrame("PO_SLIDER-2", parent, i:PO_ID);
                frame[2] = DzFrameFindByName("PO_SLIDER1-2", i:PO_ID);
                frame[3] = DzFrameFindByName("PO_SLIDER2-2", i:PO_ID);
                frame[4] = DzFrameFindByName("PO_SLIDER3-2", i:PO_ID);
                SaveInteger(ht, frame[1], PO_Control[1], frame[2]);
                SaveInteger(ht, frame[1], PO_Control[2], frame[3]);
                SaveInteger(ht, frame[1], PO_Control[3], frame[4]);
            }
            i:PO_ID +=1;
            return frame[1];
        } 
    }
}
//! endzinc
#endif
