#ifndef ChatbarrageIncluded
#define ChatbarrageIncluded
#include "DzAPI.j"
#include "popo/Framefdf.j"
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

#define CreateFrame(s, frame)      DzCreateFrameByTagName(s, "name", frame, "template", 0)
//  聊天弹幕
//! zinc
library Chatbarrage requires BzAPI, Other
{
    public struct Chatbarrage {
        public {
            integer portrait;
            integer back;
            integer text;
            real    x = 0.8;
            real    y;

            static method create() ->thistype {
                thistype this = thistype.allocate();
                integer  ui;
                real x, y;
                this.y = GetRandomReal(0.13, 0.55);

                if (this.portrait == 0) {
                    this.portrait = CreateFrame("BACKDROP", GetGameUI());
                    this.back     = CreateFrame("BACKDROP", this.portrait);
                    this.text     = pp_fdf_create(4, this.portrait);
                } else {
                    DzFrameShow(this.portrait, true);
                }
                
                // 单位头像
                ui = this.portrait;
                x  = PO_Frame_X(32, 1.0);
                y  = PO_Frame_Y(32, 1.0);
                DzFrameSetSize(ui, x, y);
                DzFrameSetAbsolutePoint(ui, 3, this.x, this.y);

                // 黑底
                ui = this.back;
                x  = PO_Frame_X(150, 1.0);
                y  = PO_Frame_Y(32, 1.0);
                DzFrameSetSize(ui, x, y);
                DzFrameSetTexture(ui, "[UI]back-1.tga", 0);
                DzFrameSetPoint(ui, 3, this.portrait, 5, 0, 0);

                // 聊天信息
                ui = this.text;
                DzFrameSetPoint(ui, 3, this.portrait, 5, 0.002, 0);
                DzFrameSetTextAlignment(ui, 90);
                DzFrameSetEnable(ui, false);

                return this;
            }
            method destroy()  { this.deallocate();}
        }
    }

    private {
        hashtable ht = InitHashtable();
        integer Size = 0;
        timer      t = CreateTimer();
        real   speed = 0.80 / 1000.0;

        function skin() {
            Chatbarrage this, self[];
            integer index, i = 0, v, o, m;

            for (1 <= index <= Size) {
                this = LoadInteger(ht, strHash("聊天弹幕实例"), index);
                this.x -= speed;
                DzFrameSetAbsolutePoint(this.portrait, 3, this.x, this.y);
                if (this.x <= -0.3) {
                    i += 1;
                    self[i] = this;
                }
            }

            if (i > 0) {
                for (1 <= index <= i) {
                    this = self[index];
                    o = LoadInteger(ht, strHash("聊天弹幕实例"), Size);  // 获取最后一位this
                    v = LoadInteger(ht, strHash("聊天弹幕序号"), this);  // 获取即将空缺的Size

                    SaveInteger(ht, strHash("聊天弹幕实例"), v, o);      // 将最后的this保存到空缺的Size里
                    SaveInteger(ht, strHash("聊天弹幕序号"), o, v);      // 互相保存方便获取
                    
                    DzFrameShow(this.portrait, false);
                    Size -= 1;
                    this.destroy();
                }
            }

            if (Size == 0) {
                PauseTimer(GetExpiredTimer());
            }
        }
    }
    
    public {
        // 发送信息弹幕
        // atr:头像   str:聊天信息  fileName:字体   height:字体大小
        function PO_Chatbarrage_create(string art, string str, string fileName, real height) {
            Chatbarrage this = Chatbarrage.create();
            DzFrameSetTexture(this.portrait, art, 0);
            DzFrameSetText(this.text, str);
            DzFrameSetFont(this.text, fileName, height, 0);

            Size += 1;
            SaveInteger(ht, strHash("聊天弹幕实例"), Size, this);
            SaveInteger(ht, strHash("聊天弹幕序号"), this, Size);

            if (Size == 1) {
                TimerStart(t, 0.01, true, function skin);
            }
        }
    }
}
//! endzinc
#endif