#ifndef HarmFrameIncluded
#define HarmFrameIncluded
#include "DzAPI.j"
#include "popo/Framefdf.j"
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

#ifndef CreateFrame
#define CreateFrame(s, frame)      DzCreateFrameByTagName(s, "name", frame, "template", 0)
#endif
// 伤害漂浮frame
//! zinc
library HarmFrame requires BzAPI, Other
{
    public struct HarmFrame
    {
        private {
            integer Harm,Bjframe;
            real x, y, z, move, movex;
            integer alpha;
            boolean flag = false;
            real    zoom = 1.0;

            static timer tm = CreateTimer();
            static real tms = 0.01;

            static location loc = Location(0, 0);

            static string fileName = "Fonts\\dfst-m3u.ttf";
            static real height = 0.016;
            static real high   = -0.035;
            static real move_x = -0.005;
            static real move_x2 = 0.00002;

            static real Speed = 0.00035;
            static integer alphas = 2;

            static real zoomS = 0.015;
            static real zoomM = 0.5;
            static integer zoomT = 180;

            static hashtable ht = InitHashtable();
            static integer size = 0;

            static integer parent;

            static method onInit() {
                integer ui;
                DzLoadToc("Ui\\textareaPath.toc");
                ui = DzCreateSimpleFrame("xuetiao-1", 0, 1);
                parent = DzFrameFindByName("xuetiao-2", 1);
            }
            
            method Destroy() {
                integer v, o;
                DzFrameShow(this.Harm, false);
                DzFrameShow(this.Bjframe, false);

                this.x = 0.0;
                this.y = 0.0;
                this.z = 0.0;
                this.alpha = 0;
                this.move  = 0.0;
                this.zoom  = 0.0;
                this.flag = false;
                v = LoadInteger(ht, this, strHash("序列"));
                o = LoadInteger(ht, thistype.size, strHash("实例"));
                thistype.size -= 1;
                SaveInteger(ht, v, strHash("实例"), o);
                SaveInteger(ht, o, strHash("序列"), v);
                this.deallocate();
            }

            static method skin() {
                thistype this;
                integer index = thistype.size;
                while (true) {
                    this = LoadInteger(ht, index, strHash("实例"));
                    this.alpha -= thistype.alphas;

                    if (this.alpha > 0) {
                        DzFrameSetAlpha(this.Harm, this.alpha);
                        if (this.flag) {
                            DzFrameSetAlpha(this.Bjframe, this.alpha);
                        }

                        this.movex += thistype.move_x2;
                        this.move  += thistype.Speed;
                        ConverRealWorldPosition(this.x, this.y, this.z);
                        DzFrameSetAbsolutePoint(this.Harm, 4, GetScreenX() + this.movex, GetScreenY() + this.move);
                        if (this.flag) {
                            if (this.alpha > thistype.zoomT) this.zoom += thistype.zoomS;
                            else if (this.zoom >= thistype.zoomM) this.zoom -= thistype.zoomS;

                            DzFrameSetFont(this.Harm, thistype.fileName, thistype.height * this.zoom, 0);
                            DzFrameSetScale(this.Bjframe, GetScreenScale() * this.zoom);
                        }
                    }
                    if (this.alpha <= 0) this.Destroy();
                    index -= 1;
                    if (index <= 0) break;
                }
                if (thistype.size <= 0) {
                    PauseTimer(thistype.tm);
                }
            }
        }

        public {
            static method setfileName(string file) {
                thistype.fileName = file;
            }

            static method setheight(real height) {
                thistype.height = height;
            }

            static method create(player p, string str, unit u, integer bjmodel, boolean switch)  -> thistype {
                thistype this = thistype.allocate();

                thistype.size += 1;

                SaveInteger(ht, thistype.size, strHash("实例"), this);
                SaveInteger(ht, this, strHash("序列"), thistype.size);

                if (this.Harm == 0) {
                    this.Harm = pp_fdf_create(4, parent);
                }

                DzFrameShow(this.Harm, false);
                
                this.x = GetUnitX(u);
                this.y = GetUnitY(u);
                this.z = GetUnitFlyHeight(u);
                this.move  = thistype.high;
                this.movex = thistype.move_x;
                this.zoom = 1.0;

                MoveLocation(loc, this.x, this.y);

                this.z += GetLocationZ(loc);
                this.z += unit_overhead(u);
                ConverRealWorldPosition(this.x, this.y, this.z);
                DzFrameSetAbsolutePoint(this.Harm, 4, GetScreenX() + this.movex, GetScreenY() + this.move);

                DzFrameSetText(this.Harm, str);
                DzFrameSetFont(this.Harm, thistype.fileName, thistype.height, 0);
                DzFrameSetTextAlignment(this.Harm, 50);
                DzFrameSetEnable(this.Harm, false);

                this.alpha = 254;
                DzFrameSetAlpha(this.Harm, this.alpha);

                if (this.Bjframe == 0) {
                    this.Bjframe = CreateFrame("BACKDROP", parent);
                    DzFrameSetSize(this.Bjframe, 20.0 / 1800.0, 20.0 / 1800.0);
                    DzFrameSetPoint(this.Bjframe, 8, this.Harm, 6, 0, 0);
                }
                if (bjmodel == 1) DzFrameSetTexture(this.Bjframe, "[UI]WLBJ.tga", 0);
                if (bjmodel == 2) DzFrameSetTexture(this.Bjframe, "[UI]FSBJ.tga", 0);
                
                DzFrameSetScale(this.Bjframe, GetScreenScale() * this.zoom);
                DzFrameSetAlpha(this.Bjframe, this.alpha);
                DzFrameShow(this.Bjframe, false);

                this.flag = switch;
                if (switch) {
                    if (p == GetLocalPlayer()) {
                        DzFrameShow(this.Bjframe, true);
                    }
                }

                if (p == GetLocalPlayer()) {
                    DzFrameShow(this.Harm, true);
                }

                if (thistype.size == 1) {
                    TimerStart(tm, tms, true, function thistype.skin);
                }

                return this;
            }
        }
    }

    public
    {
        function PO_HarmFrame_create(player p, string str, unit u, integer bjmodel, boolean switch) {
            HarmFrame.create(p, str, u, bjmodel, switch);
        }

        function PO_HarmFrame_fileName(string file) {
            HarmFrame.setfileName(file);
        }

        function PO_HarmFrame_height(real height) {
            HarmFrame.setheight(height);
        }
    }
}
//! endzinc
#endif