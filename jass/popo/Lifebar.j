#ifndef LifebarIncluded
#define LifebarIncluded
#include "DzAPI.j"
#include "popo/Framefdf.j"
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif

#ifndef CreateFrame
#define CreateFrame(s, frame)      DzCreateFrameByTagName(s, "name", frame, "template", 0)
#endif
//  血条
//! zinc
library Lifebar requires BzAPI, Other
{
    public struct LifebarHero {
        public {
            unit       u;
            integer DB_1;
            integer JB_1;
            integer XT_1;
            integer XT_2;
            integer LT_1;
            integer LT_2;
            integer BT_1;
            integer HD_1;
            integer DJDB_1;
            integer JB_2;
            integer DJ_1;
            integer MZ_1;
            real      HP;
            real     HPX;
            real      MP;
            real     MPX;
            real      BP;
            real      HD;
            real  HPBrax;
            real  HPBray;
            real  MPBrax;
            real  MPBray;
            real  BPBrax;
            real  BPBray;
            real  HDBrax;
            real  HDBray;
            real  DJBrax;
            real  DJBray;
            real   Bra_x;
            real   Bra_y;
            timer   BT_t;
            static method create() ->thistype { return thistype.allocate();}
            method destroy()  { this.deallocate();}
        }
    }
    public struct LifebarHero2 {
        public {
            unit       u;
            integer DB_1;
            integer JB_1;
            integer XT_1;
            integer XT_2;
            integer LT_1;
            integer LT_2;
            integer BT_1;
            integer HD_1;
            integer MZ_1;
            real      HP;
            real     HPX;
            real      MP;
            real     MPX;
            real      BP;
            real      HD;
            real  HPBrax;
            real  HPBray;
            real  MPBrax;
            real  MPBray;
            real  BPBrax;
            real  BPBray;
            real  HDBrax;
            real  HDBray;
            real   Bra_x;
            real   Bra_y;
            timer   BT_t;
            static method create() ->thistype { return thistype.allocate();}
            method destroy()  { this.deallocate();}
        }
    }
    public struct LifebarUnit {
        public {
            unit       u;
            integer DB_1;
            integer JB_1;
            integer XT_1;
            integer XT_2;
            integer BT_1;
            integer HD_1;
            real      HP;
            real     HPX;
            real      BP;
            real      HD;
            real  HPBrax;
            real  HPBray;
            real  BPBrax;
            real  BPBray;
            real  HDBrax;
            real  HDBray;
            real   Bra_x;
            real   Bra_y;
            timer   BT_t;
            integer MZ_1;
            static method create() ->thistype { return thistype.allocate();}
            method destroy()  { this.deallocate();}
        }
    }
    public struct LifebarSter {
        public {
            unit       u;
            integer DB_1;
            integer JB_1;
            integer XT_1;
            integer XT_2;
            integer BT_1;
            integer HD_1;
            integer DJDB_1;
            integer JB_2;
            integer DJ_1;
            real      HP;
            real     HPX;
            real      BP;
            real      HD;
            real  HPBrax;
            real  HPBray;
            real  BPBrax;
            real  BPBray;
            real  HDBrax;
            real  HDBray;
            real  DJBrax;
            real  DJBray;
            real   Bra_x;
            real   Bra_y;
            timer   BT_t;
            integer MZ_1;
            static method create() ->thistype { return thistype.allocate();}
            method destroy()  { this.deallocate();}
        }
    }
    
    private {
        hashtable ht = InitHashtable();
        integer HeroSize = 0;
        integer HeroSize2 = 0;
        integer UnitSize = 0;
        integer SterSize = 0;
        integer frame;
        integer thisSize = 0;
        trigger trg[];
        // 白条到期单位
        unit Unit = null;
        string  XT1[], XT2[];

        function SetLifebarId(integer p, unit u, integer i) {
            if (p == 1) SaveInteger(ht, GetHandleId(u), strHash("英雄血条实例"), i); 
            else if (p == 2) SaveInteger(ht, GetHandleId(u), strHash("单位血条实例"), i);
            else if (p == 3) SaveInteger(ht, GetHandleId(u), strHash("精英血条实例"), i);
            else if (p == 4) SaveInteger(ht, GetHandleId(u), strHash("英雄血条实例2"), i);
        }

        function GetLifebarId(integer p, unit u) ->integer {
            if (p == 1)  return LoadInteger(ht, GetHandleId(u), strHash("英雄血条实例")); 
            else if (p == 2) return LoadInteger(ht, GetHandleId(u), strHash("单位血条实例"));
            else if (p == 3) return LoadInteger(ht, GetHandleId(u), strHash("精英血条实例"));
            else if (p == 4) return LoadInteger(ht, GetHandleId(u), strHash("英雄血条实例2"));
            return 0;
        }

        function onInit() {
                frame = DzFrameGetParent(DzFrameGetPortrait());

                XT1[1] = "[UI]XT-01.tga";
                XT1[2] = "[UI]XT-01-1.tga";
                XT1[3] = "[UI]XT-01-2.tga";
                XT1[4] = "[UI]XT-01-3.tga";
                XT1[5] = "[UI]XT-01-4.tga";
                XT1[6] = "[UI]XT-01-5.tga";
                XT1[7] = "[UI]XT-01-6.tga";

                XT2[1] = "[UI]XT-02.tga";
                XT2[2] = "[UI]XT-02-1.tga";
                XT2[3] = "[UI]XT-02-2.tga";
                XT2[4] = "[UI]XT-02-3.tga";
                XT2[5] = "[UI]XT-02-4.tga";
                XT2[6] = "[UI]XT-02-5.tga";
                XT2[7] = "[UI]XT-02-6.tga";
        }
    }

    public {
        real PO_Lifebar_lifex = 0.0;
        real PO_Lifebar_lifey = 0.0;

        // 设置单位名字
        function PO_Lifebar_UnitName (unit u, string Name, string fileName, real height)  -> nothing {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            integer ui = 0;
            if (this == 0 && self == 0 && Example == 0 && this2 == 0) {
                debug BJDebugMsg("单位血条未注册");
            } else {
                if (this > 0) ui = this.MZ_1;
                else if (self > 0) ui = self.MZ_1;
                else if (Example > 0) ui = Example.MZ_1;
                else if (this2 > 0) ui = this2.MZ_1;
                DzFrameSetText(ui, Name);
                DzFrameSetFont(ui, fileName, height, 0);
            }
        }

        //  设置单位血条颜色
        function PO_Lifebar_Color (unit u, integer index)  -> nothing {
            LifebarUnit self = GetLifebarId(2, u);

            integer ui = 0;
            if (self == 0) {
                debug BJDebugMsg("单位血条未注册");
            } else {
                DzFrameSetTexture(self.XT_1, XT1[index], 0);
                DzFrameSetTexture(self.XT_2, XT2[index], 0);
            }
        }

        // 注册血条
        // i:1.英雄 2.单位  3.精英   u:单位   p1:宽度比例    p2:血条高度    p3:整体比例     p4:1.1440*1080 2.1920*1080
        function PO_Lifebar_create(integer i, unit u, real p1, real p2, real p3, integer p4) {
            LifebarHero this;
            LifebarUnit self;
            LifebarSter Example;
            LifebarHero2 this2;
            real war3_x, war3_y, x, y, MZGD = 0.002/*名字高度*/;
            integer ui;
            if (p4 == 1) {
                war3_x = 1440 / 0.8;
                war3_y = 1080 / 0.6;
            } else {
                war3_x = 1920 / 0.8;
                war3_y = 1080 / 0.6;
            }
            SetUnitPressUIVisible(u, false);
            if (i == 1) {
                this = LifebarHero.create();
                if (this.DB_1 == 0) { 
                    this.DB_1 = CreateFrame("BACKDROP", frame);
                    this.JB_1 = CreateFrame("BACKDROP", this.DB_1);
                    this.XT_2 = CreateFrame("BACKDROP", this.DB_1);
                    this.XT_1 = CreateFrame("BACKDROP", this.DB_1);
                    this.LT_2 = CreateFrame("BACKDROP", this.DB_1);
                    this.LT_1 = CreateFrame("BACKDROP", this.DB_1);
                    this.HD_1 = CreateFrame("BACKDROP", this.DB_1);
                    this.BT_1 = CreateFrame("BACKDROP", this.DB_1);
                    
                    this.DJDB_1 = CreateFrame("BACKDROP", this.DB_1);
                    this.JB_2 = CreateFrame("BACKDROP", this.DB_1);
                    this.DJ_1 = CreateFrame("TEXT", this.DB_1);
                    this.MZ_1 = pp_fdf_create(4, this.DB_1);
                    this.BT_t = CreateTimer();
                }
                this.u    = u;
                this.HP   = 1.0;
                this.HPX  = 1.0;
                this.MP   = 1.0;
                this.MPX  = 1.0;
                this.BP   = 0.0;
                this.HD   = 0.0;
                SetLifebarId(i, u, this);
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), false);

                //  血蓝条底图
                ui = this.DB_1;
                x  = (80 / war3_x) * p1 * p3;
                y  = (16 / war3_y) * p3;
                DzFrameSetSize(ui, x, y);
                DzFrameSetTexture(ui, "[UI]DB-1.tga", 0);
                DzFrameShow(ui, true);

                //  金边
                ui = this.JB_1;
                DzFrameSetAllPoints(ui, this.DB_1);
                DzFrameSetTexture(ui, "[UI]JB-1.tga", 0);
                DzFrameShow(ui, false);

                //  血条底
                ui = this.XT_2;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                DzFrameSetSize(ui, x * this.HPX, y);
                DzFrameSetPoint(ui, 0, this.DB_1, 0, (2 / war3_x) * p1 * p3, (-2 / war3_y) * p3);
                DzFrameSetTexture(ui, "[UI]XT-2.tga", 0);

                //  血条
                ui = this.XT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                this.HPBrax = x;
                this.HPBray = y;
                DzFrameSetSize(ui, x * this.HP, y);
                DzFrameSetPoint(ui, 3, this.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]XT-1.tga", 0);

                //  护盾
                ui = this.HD_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                this.HDBrax = x;
                this.HDBray = y;
                DzFrameSetSize(ui, x * this.HD, y);
                DzFrameSetPoint(ui, 3, this.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]HD-1.tga", 0);

                //  蓝条底
                ui = this.LT_2;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                DzFrameSetSize(ui, x * this.MPX, y);
                DzFrameSetPoint(ui, 6, this.DB_1, 6, (2 / war3_x) * p1 * p3, (2 / war3_y) * p3);
                DzFrameSetTexture(ui, "[UI]LT-2.tga", 0);

                //  蓝条
                ui = this.LT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                this.MPBrax = x;
                this.MPBray = y;
                DzFrameSetSize(ui, x * this.MP, y);
                DzFrameSetPoint(ui, 3, this.LT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]LT-1.tga", 0);

                //  白条
                ui = this.BT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                this.BPBrax = x;
                this.BPBray = y;
                DzFrameSetSize(ui, x * this.BP, y);
                DzFrameSetPoint(ui, 0, this.DB_1, 6, (2 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]BT-1.tga", 0);

                //  等级底图
                ui = this.DJDB_1;
                x  = (22 / war3_x) * p3;
                y  = (22 / war3_y) * p3;
                this.DJBrax = x;
                this.DJBray = y;
                DzFrameSetSize(ui, x, y);
                DzFrameSetPoint(ui, 5, this.DB_1, 3, (1 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]DJDB-1.tga", 0);

                //  金边
                ui = this.JB_2;
                DzFrameSetAllPoints(ui, this.DJDB_1);
                DzFrameSetTexture(ui, "[UI]JB-2.tga", 0);
                DzFrameShow(ui, false);

                //  等级 PO_font
                ui = this.DJ_1;
                DzFrameSetFont(ui, PO_font, 0.011 * p3, 0);
                DzFrameSetPoint(ui, 4, this.DJDB_1, 4, 0, 0);
                DzFrameSetTextAlignment(ui, 50);
                DzFrameSetEnable(ui, false);

                //  名字
                ui = this.MZ_1;
                DzFrameSetPoint(ui, 7, this.DB_1, 1, 0, MZGD);
                DzFrameSetTextAlignment(ui, 50);
                DzFrameSetEnable(ui, false);


                this.Bra_x = ((21 * 0.5) / war3_x) * p1 * p3 - 0.005;
                this.Bra_y = -0.016 + p2;
                ConverUnitWorldPosition(u);
                DzFrameSetAbsolutePoint(this.DB_1, 4, GetScreenX() + this.Bra_x, GetScreenY() + this.Bra_y);
                DzFrameSetScale(this.DB_1, GetScreenScale());
                DzFrameSetScale(this.JB_1, GetScreenScale());
                DzFrameSetScale(this.XT_2, GetScreenScale());
                DzFrameSetScale(this.XT_1, GetScreenScale());
                DzFrameSetScale(this.LT_2, GetScreenScale());
                DzFrameSetScale(this.LT_1, GetScreenScale());
                DzFrameSetScale(this.HD_1, GetScreenScale());
                DzFrameSetScale(this.BT_1, GetScreenScale());
                DzFrameSetScale(this.DJDB_1, GetScreenScale());
                DzFrameSetScale(this.JB_2, GetScreenScale());
                DzFrameSetScale(this.DJ_1, GetScreenScale());
                DzFrameSetScale(this.MZ_1, GetScreenScale());


                HeroSize += 1;
                SaveInteger(ht, strHash("英雄血条实例"), HeroSize, this);
                SaveInteger(ht, strHash("英雄血条序号"), this, HeroSize);
            } else if (i == 2) {
                self = LifebarUnit.create();
                if (self.DB_1 == 0) { 
                    self.DB_1 = CreateFrame("BACKDROP", frame);
                    self.JB_1 = CreateFrame("BACKDROP", self.DB_1);
                    self.XT_2 = CreateFrame("BACKDROP", self.DB_1);
                    self.XT_1 = CreateFrame("BACKDROP", self.DB_1);
                    self.HD_1 = CreateFrame("BACKDROP", self.DB_1);
                    self.BT_1 = CreateFrame("BACKDROP", self.DB_1);
                    self.MZ_1 = pp_fdf_create(4, self.DB_1);
                    
                    self.BT_t = CreateTimer();

                }
                self.u    = u;
                self.HP   = 1.0;
                self.HPX  = 1.0;
                self.BP   = 0.0;
                self.HD   = 0.0;
                SetLifebarId(i, u, self);
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), false);

                //  血条底图
                ui = self.DB_1;
                x  = (60 / war3_x) * p1 * p3;
                y  = (9 / war3_y) * p3;
                DzFrameSetSize(ui, x, y);
                DzFrameSetTexture(ui, "[UI]DB-01.tga", 0);
                DzFrameShow(ui, true);

                //  金边
                ui = self.JB_1;
                DzFrameSetAllPoints(ui, self.DB_1);
                DzFrameSetTexture(ui, "[UI]JB-01.tga", 0);
                DzFrameShow(ui, false);

                //  血条底
                ui = self.XT_2;
                x  = (56 / war3_x) * p1 * p3;
                y  = (5 / war3_y) * p3;
                DzFrameSetSize(ui, x * self.HPX, y);
                DzFrameSetPoint(ui, 3, self.DB_1, 3, (2 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]XT-02.tga", 0);

                //  血条
                ui = self.XT_1;
                x  = (56 / war3_x) * p1 * p3;
                y  = (5 / war3_y) * p3;
                self.HPBrax = x;
                self.HPBray = y;
                DzFrameSetSize(ui, x * self.HP, y);
                DzFrameSetPoint(ui, 3, self.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]XT-01.tga", 0);

                //  护盾
                ui = self.HD_1;
                x  = (56 / war3_x) * p1 * p3;
                y  = (5 / war3_y) * p3;
                self.HDBrax = x;
                self.HDBray = y;
                DzFrameSetSize(ui, x * self.HD, y);
                DzFrameSetPoint(ui, 3, self.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]HD-01.tga", 0);

                //  白条
                ui = self.BT_1;
                x  = (60 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                self.BPBrax = x;
                self.BPBray = y;
                DzFrameSetSize(ui, x * self.BP, y);
                DzFrameSetPoint(ui, 0, self.DB_1, 6, 0, 0);
                DzFrameSetTexture(ui, "[UI]BT-01.tga", 0);

                //  名字
                ui = self.MZ_1;
                DzFrameSetPoint(ui, 7, self.DB_1, 1, 0, MZGD);
                DzFrameSetTextAlignment(ui, 50);
                DzFrameSetEnable(ui, false);


                self.Bra_x = -0.007;
                self.Bra_y = -0.022 + p2;
                ConverUnitWorldPosition(u);
                DzFrameSetAbsolutePoint(self.DB_1, 4, GetScreenX() + self.Bra_x, GetScreenY() + self.Bra_y);
                DzFrameSetScale(self.DB_1, GetScreenScale());
                DzFrameSetScale(self.JB_1, GetScreenScale());
                DzFrameSetScale(self.XT_2, GetScreenScale());
                DzFrameSetScale(self.XT_1, GetScreenScale());
                DzFrameSetScale(self.HD_1, GetScreenScale());
                DzFrameSetScale(self.BT_1, GetScreenScale());
                DzFrameSetScale(self.MZ_1, GetScreenScale());


                UnitSize += 1;
                SaveInteger(ht, strHash("单位血条实例"), UnitSize, self);
                SaveInteger(ht, strHash("单位血条序号"), self, UnitSize);
            } else if (i == 3) {
                Example = LifebarSter.create();
                if (Example.DB_1 == 0) { 
                    Example.DB_1 = CreateFrame("BACKDROP", frame);
                    Example.JB_1 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.XT_2 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.XT_1 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.HD_1 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.BT_1 = CreateFrame("BACKDROP", Example.DB_1);
                    
                    Example.DJDB_1 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.JB_2 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.DJ_1 = CreateFrame("BACKDROP", Example.DB_1);
                    Example.MZ_1 = pp_fdf_create(4, Example.DB_1);
                    Example.BT_t = CreateTimer();
                }
                Example.u    = u;
                Example.HP   = 1.0;
                Example.HPX  = 1.0;
                Example.BP   = 0.0;
                Example.HD   = 0.0;
                SetLifebarId(i, u, Example);
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), false);

                //  血条底图
                ui = Example.DB_1;
                x  = (80 / war3_x) * p1 * p3;
                y  = (11 / war3_y) * p3;
                DzFrameSetSize(ui, x, y);
                DzFrameSetTexture(ui, "[UI]DB-001.tga", 0);
                DzFrameShow(ui, true);

                //  金边
                ui = Example.JB_1;
                DzFrameSetAllPoints(ui, Example.DB_1);
                DzFrameSetTexture(ui, "[UI]JB-001.tga", 0);
                DzFrameShow(ui, false);

                //  血条底
                ui = Example.XT_2;
                x  = (76 / war3_x) * p1 * p3;
                y  = (7 / war3_y) * p3;
                DzFrameSetSize(ui, x * Example.HPX, y);
                DzFrameSetPoint(ui, 0, Example.DB_1, 0, (2 / war3_x) * p1 * p3, (-2 / war3_y) * p3);
                DzFrameSetTexture(ui, "[UI]XT-002.tga", 0);

                //  血条
                ui = Example.XT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (7 / war3_y) * p3;
                Example.HPBrax = x;
                Example.HPBray = y;
                DzFrameSetSize(ui, x * Example.HP, y);
                DzFrameSetPoint(ui, 3, Example.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]XT-001.tga", 0);

                //  护盾
                ui = Example.HD_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                Example.HDBrax = x;
                Example.HDBray = y;
                DzFrameSetSize(ui, x * Example.HD, y);
                DzFrameSetPoint(ui, 3, Example.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]HD-001.tga", 0);

                //  白条
                ui = Example.BT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                Example.BPBrax = x;
                Example.BPBray = y;
                DzFrameSetSize(ui, x * Example.BP, y);
                DzFrameSetPoint(ui, 0, Example.DB_1, 6, (2 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]BT-001.tga", 0);

                //  标识底图
                ui = Example.DJDB_1;
                x  = (15 / war3_x) * p3;
                y  = (15 / war3_y) * p3;
                Example.DJBrax = x;
                Example.DJBray = y;
                DzFrameSetSize(ui, x, y);
                DzFrameSetPoint(ui, 5, Example.DB_1, 3, (1 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]DJDB-001.tga", 0);

                //  金边
                ui = Example.JB_2;
                DzFrameSetAllPoints(ui, Example.DJDB_1);
                DzFrameSetTexture(ui, "[UI]JB-002.tga", 0);
                DzFrameShow(ui, false);

                //  标识贴图
                ui = Example.DJ_1;
                x  = (13 / war3_x) * p3;
                y  = (13 / war3_y) * p3;
                Example.DJBrax = x;
                Example.DJBray = y;
                DzFrameSetSize(ui, x, y);
                DzFrameSetPoint(ui, 4, Example.DJDB_1, 4, 0, 0);
                DzFrameSetTexture(ui, "[UI]JYG-001.tga", 0);

                //  名字
                ui = Example.MZ_1;
                DzFrameSetPoint(ui, 7, Example.DB_1, 1, 0, MZGD);
                DzFrameSetTextAlignment(ui, 50);
                DzFrameSetEnable(ui, false);


                Example.Bra_x = ((14 * 0.5) / war3_x) * p1 * p3 - 0.007;
                Example.Bra_y = -0.018 + p2;
                ConverUnitWorldPosition(u);
                DzFrameSetAbsolutePoint(Example.DB_1, 4, GetScreenX() + Example.Bra_x, GetScreenY() + Example.Bra_y);
                DzFrameSetScale(Example.DB_1, GetScreenScale());
                DzFrameSetScale(Example.JB_1, GetScreenScale());
                DzFrameSetScale(Example.XT_2, GetScreenScale());
                DzFrameSetScale(Example.XT_1, GetScreenScale());
                DzFrameSetScale(Example.HD_1, GetScreenScale());
                DzFrameSetScale(Example.BT_1, GetScreenScale());
                DzFrameSetScale(Example.DJDB_1, GetScreenScale());
                DzFrameSetScale(Example.JB_2, GetScreenScale());
                DzFrameSetScale(Example.DJ_1, GetScreenScale());
                DzFrameSetScale(Example.MZ_1, GetScreenScale());


                SterSize += 1;
                SaveInteger(ht, strHash("精英血条实例"), SterSize, Example);
                SaveInteger(ht, strHash("精英血条序号"), Example, SterSize);
            } else if (i == 4) {
                this2 = LifebarHero2.create();
                if (this2.DB_1 == 0) { 
                    this2.DB_1 = CreateFrame("BACKDROP", frame);
                    this2.JB_1 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.XT_2 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.XT_1 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.LT_2 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.LT_1 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.HD_1 = CreateFrame("BACKDROP", this2.DB_1);
                    this2.BT_1 = CreateFrame("BACKDROP", this2.DB_1);
                    
                    this2.MZ_1 = pp_fdf_create(4, this2.DB_1);
                    this2.BT_t = CreateTimer();
                }
                this2.u    = u;
                this2.HP   = 1.0;
                this2.HPX  = 1.0;
                this2.MP   = 1.0;
                this2.MPX  = 1.0;
                this2.BP   = 0.0;
                this2.HD   = 0.0;
                SetLifebarId(i, u, this2);
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), false);

                //  血蓝条底图
                ui = this2.DB_1;
                x  = (80 / war3_x) * p1 * p3;
                y  = (16 / war3_y) * p3;
                DzFrameSetSize(ui, x, y);
                DzFrameSetTexture(ui, "[UI]DB-1.tga", 0);
                DzFrameShow(ui, true);

                //  金边
                ui = this2.JB_1;
                DzFrameSetAllPoints(ui, this2.DB_1);
                DzFrameSetTexture(ui, "[UI]JB-1.tga", 0);
                DzFrameShow(ui, false);

                //  血条底
                ui = this2.XT_2;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                DzFrameSetSize(ui, x * this2.HPX, y);
                DzFrameSetPoint(ui, 0, this2.DB_1, 0, (2 / war3_x) * p1 * p3, (-2 / war3_y) * p3);
                DzFrameSetTexture(ui, "[UI]XT-2.tga", 0);

                //  血条
                ui = this2.XT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                this2.HPBrax = x;
                this2.HPBray = y;
                DzFrameSetSize(ui, x * this2.HP, y);
                DzFrameSetPoint(ui, 3, this2.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]XT-1.tga", 0);

                //  护盾
                ui = this2.HD_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (8 / war3_y) * p3;
                this2.HDBrax = x;
                this2.HDBray = y;
                DzFrameSetSize(ui, x * this2.HD, y);
                DzFrameSetPoint(ui, 3, this2.XT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]HD-1.tga", 0);

                //  蓝条底
                ui = this2.LT_2;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                DzFrameSetSize(ui, x * this2.MPX, y);
                DzFrameSetPoint(ui, 6, this2.DB_1, 6, (2 / war3_x) * p1 * p3, (2 / war3_y) * p3);
                DzFrameSetTexture(ui, "[UI]LT-2.tga", 0);

                //  蓝条
                ui = this2.LT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                this2.MPBrax = x;
                this2.MPBray = y;
                DzFrameSetSize(ui, x * this2.MP, y);
                DzFrameSetPoint(ui, 3, this2.LT_2, 3, 0, 0);
                DzFrameSetTexture(ui, "[UI]LT-1.tga", 0);

                //  白条
                ui = this2.BT_1;
                x  = (76 / war3_x) * p1 * p3;
                y  = (2 / war3_y) * p3;
                this2.BPBrax = x;
                this2.BPBray = y;
                DzFrameSetSize(ui, x * this2.BP, y);
                DzFrameSetPoint(ui, 0, this2.DB_1, 6, (2 / war3_x) * p1 * p3, 0);
                DzFrameSetTexture(ui, "[UI]BT-1.tga", 0);

                //  名字
                ui = this2.MZ_1;
                DzFrameSetPoint(ui, 7, this2.DB_1, 1, 0, MZGD);
                DzFrameSetTextAlignment(ui, 50);
                DzFrameSetEnable(ui, false);


                this2.Bra_x = -0.007;
                this2.Bra_y = -0.016 + p2;
                ConverUnitWorldPosition(u);
                DzFrameSetAbsolutePoint(this2.DB_1, 4, GetScreenX() + this2.Bra_x, GetScreenY() + this2.Bra_y);
                DzFrameSetScale(this2.DB_1, GetScreenScale());
                DzFrameSetScale(this2.JB_1, GetScreenScale());
                DzFrameSetScale(this2.XT_2, GetScreenScale());
                DzFrameSetScale(this2.XT_1, GetScreenScale());
                DzFrameSetScale(this2.LT_2, GetScreenScale());
                DzFrameSetScale(this2.LT_1, GetScreenScale());
                DzFrameSetScale(this2.HD_1, GetScreenScale());
                DzFrameSetScale(this2.BT_1, GetScreenScale());
                DzFrameSetScale(this2.MZ_1, GetScreenScale());


                HeroSize2 += 1;
                SaveInteger(ht, strHash("英雄血条实例2"), HeroSize2, this2);
                SaveInteger(ht, strHash("英雄血条序号2"), this2, HeroSize2);
            }
        }

        // 清除单位血条
        function PO_Lifebar_Clear(unit u) {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            integer i, v;
            if (this > 0) {
                // max实例
                i = LoadInteger(ht, strHash("英雄血条实例"), HeroSize);

                // 空缺序号
                v = LoadInteger(ht, strHash("英雄血条序号"), this);
                
                // 填补空缺实例跟序号
                SaveInteger(ht, strHash("英雄血条实例"), v, i);
                SaveInteger(ht, strHash("英雄血条序号"), i, v);
                DzFrameShow(this.DB_1, false);
                if (LoadReal(ht, GetHandleId(this.BT_t), strHash("白条百分比")) > 0.0) {
                    DzFrameShow(this.BT_1, false);
                    PauseTimer(this.BT_t);
                }
                DzFrameSetText(this.MZ_1, "");
                DzFrameShow(this.HD_1, false);
                DzFrameShow(this.JB_1, false);
                DzFrameShow(this.JB_2, false);
                HeroSize -= 1;
                this.destroy();
                FlushChildHashtable(ht, GetHandleId(u));               
            }
            if (self > 0) {
                i = LoadInteger(ht, strHash("单位血条实例"), UnitSize);
                v = LoadInteger(ht, strHash("单位血条序号"), self);
                SaveInteger(ht, strHash("单位血条实例"), v, i);
                SaveInteger(ht, strHash("单位血条序号"), i, v);
                DzFrameShow(self.DB_1, false);
                if (LoadReal(ht, GetHandleId(self.BT_t), strHash("白条百分比")) > 0.0) {
                    DzFrameShow(self.BT_1, false);
                    PauseTimer(self.BT_t);
                }
                DzFrameSetText(self.MZ_1, "");
                DzFrameShow(self.HD_1, false);
                DzFrameShow(self.JB_1, false);
                UnitSize -= 1;
                self.destroy();
                FlushChildHashtable(ht, GetHandleId(u));
            }
            if (Example > 0) {
                i = LoadInteger(ht, strHash("精英血条实例"), SterSize);
                v = LoadInteger(ht, strHash("精英血条序号"), Example);
                SaveInteger(ht, strHash("精英血条实例"), v, i);
                SaveInteger(ht, strHash("精英血条序号"), i, v);
                DzFrameShow(Example.DB_1, false);
                if (LoadReal(ht, GetHandleId(Example.BT_t), strHash("白条百分比")) > 0.0) {
                    DzFrameShow(Example.BT_1, false);
                    PauseTimer(Example.BT_t);
                }
                DzFrameSetText(Example.MZ_1, "");
                DzFrameShow(Example.HD_1, false);
                DzFrameShow(Example.JB_1, false);
                DzFrameShow(Example.JB_2, false);
                SterSize -= 1;
                Example.destroy();
                FlushChildHashtable(ht, GetHandleId(u));
            }
            if (this2 > 0) {
                i = LoadInteger(ht, strHash("英雄血条实例2"), HeroSize2);
                v = LoadInteger(ht, strHash("英雄血条序号2"), this2);
                SaveInteger(ht, strHash("英雄血条实例2"), v, i);
                SaveInteger(ht, strHash("英雄血条序号2"), i, v);
                DzFrameShow(this2.DB_1, false);
                if (LoadReal(ht, GetHandleId(this2.BT_t), strHash("白条百分比")) > 0.0) {
                    DzFrameShow(this2.BT_1, false);
                    PauseTimer(this2.BT_t);
                }
                DzFrameSetText(this2.MZ_1, "");
                DzFrameShow(this2.HD_1, false);
                DzFrameShow(this2.JB_1, false);
                HeroSize2 -= 1;
                this2.destroy();
                FlushChildHashtable(ht, GetHandleId(u));
            }
        }

        // 隐藏和显示血条
        function PO_Lifebar_Display(unit u, boolean p1) {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            if (this > 0) {
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), p1);
                DzFrameShow(this.DB_1, !p1);
            }
            if (self > 0) {
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), p1);
                DzFrameShow(self.DB_1, !p1);
            }
            if (Example > 0) {
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), p1);
                DzFrameShow(Example.DB_1, !p1);
            }
            if (this2 > 0) {
                SaveBoolean(ht, strHash("血条隐藏"), GetHandleId(u), p1);
                DzFrameShow(this2.DB_1, !p1);
            }
        }

        // 设置血条显示上下边界
        function PO_Lifebar_SetBorders(real p1, real p2) {
            PO_Lifebar_lifex = p2;
            PO_Lifebar_lifey = p1;
        }

        // 设置英雄等级
        function PO_Lifebar_SetHeroLevel(unit u, integer lv) {
            LifebarHero this = GetLifebarId(1, u);
            if (this > 0) {
                DzFrameSetSize(this.DJDB_1, this.DJBrax + (this.DJBrax * ((StringLength(I2S(lv)) - 1) * 0.3)), this.DJBray);
                DzFrameSetText(this.DJ_1, "|cffffff00" + I2S(lv) + "|r");
            }
        }

        // 替换精英图标
        function PO_Lifebar_SetSterTexture(unit u, string str) {
            LifebarSter this = GetLifebarId(3, u);
            if (this > 0) {
                DzFrameSetTexture(this.DJ_1, str, 0);
            }
        }

        // 设置护盾百分比
        function PO_Lifebar_setHDbar(unit u, real p1) {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            if (this > 0) {
                DzFrameSetSize(this.HD_1, (this.HDBrax * p1 * 0.01), this.HDBray);
                if (p1 > 0) DzFrameShow(this.HD_1, true);
                else DzFrameShow(this.HD_1, false);
            }
            if (self > 0) {
                DzFrameSetSize(self.HD_1, (self.HDBrax * p1 * 0.01), self.HDBray);
                if (p1 > 0) DzFrameShow(self.HD_1, true);
                else DzFrameShow(self.HD_1, false);
            }
            if (Example > 0) {
                DzFrameSetSize(Example.HD_1, (Example.HDBrax * p1 * 0.01), Example.HDBray);
                if (p1 > 0) DzFrameShow(Example.HD_1, true);
                else DzFrameShow(Example.HD_1, false);
            }
            if (this2 > 0) {
                DzFrameSetSize(this2.HD_1, (this2.HDBrax * p1 * 0.01), this2.HDBray);
                if (p1 > 0) DzFrameShow(this2.HD_1, true);
                else DzFrameShow(this2.HD_1, false);
            }
        }

        // 设置白条存在时间
        function PO_Lifebar_setBTbar(unit u, real p1) {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            if (this > 0) {
                if (p1 > 0) DzFrameShow(this.BT_1, true);
                else DzFrameShow(this.BT_1, false);

                SaveReal(ht, GetHandleId(this.BT_t), strHash("白条百分比"), 100.0);
                SaveReal(ht, GetHandleId(this.BT_t), strHash("白条时间"), p1);
                SaveInteger(ht, GetHandleId(this.BT_t), strHash("实例"), this);
                DzFrameSetSize(this.BT_1, this.BPBrax, this.BPBray);
                TimerStart(this.BT_t, 0.01, true, function(){
                    timer   t = GetExpiredTimer();
                    LifebarHero this = LoadInteger(ht, GetHandleId(t), strHash("实例"));
                    real    s = LoadReal(ht, GetHandleId(t), strHash("白条时间"));
                    real   p1 = LoadReal(ht, GetHandleId(t), strHash("白条百分比"));
                    real    v = 100.0 / s * 0.01;
                    integer index;
                    p1 -= v;
                    SaveReal(ht, GetHandleId(t), strHash("白条百分比"), p1);
                    
                    if (p1 <= 0) {
                        DzFrameShow(this.BT_1, false);
                        PauseTimer(t);
                        Unit = this.u;
                        for (1 <= index <= thisSize) {
                            if (IsTriggerEnabled(trg[index]) && TriggerEvaluate(trg[index]) && trg[index] != null) {
                                TriggerExecute(trg[index]);
                            }
                        }
                        Unit = null;
                    } else {
                        DzFrameSetSize(this.BT_1, this.BPBrax * p1 * 0.01, this.BPBray);
                    }
                    t = null;
                });
            }
            if (self > 0) {
                if (p1 > 0) DzFrameShow(self.BT_1, true);
                else DzFrameShow(self.BT_1, false);

                SaveReal(ht, GetHandleId(self.BT_t), strHash("白条百分比"), 100.0);
                SaveReal(ht, GetHandleId(self.BT_t), strHash("白条时间"), p1);
                SaveInteger(ht, GetHandleId(self.BT_t), strHash("实例"), self);
                DzFrameSetSize(self.BT_1, self.BPBrax, self.BPBray);
                TimerStart(self.BT_t, 0.01, true, function(){
                    timer   t = GetExpiredTimer();
                    LifebarUnit self = LoadInteger(ht, GetHandleId(t), strHash("实例"));
                    real    s = LoadReal(ht, GetHandleId(t), strHash("白条时间"));
                    real   p1 = LoadReal(ht, GetHandleId(t), strHash("白条百分比"));
                    real    v = 100.0 / s * 0.01;
                    integer index;
                    p1 -= v;
                    SaveReal(ht, GetHandleId(t), strHash("白条百分比"), p1);
                    
                    if (p1 <= 0) {
                        DzFrameShow(self.BT_1, false);
                        PauseTimer(t);
                        Unit = self.u;
                        for (1 <= index <= thisSize) {
                            if (IsTriggerEnabled(trg[index]) && TriggerEvaluate(trg[index]) && trg[index] != null) {
                                TriggerExecute(trg[index]);
                            }
                        }
                        Unit = null;
                    } else {
                        DzFrameSetSize(self.BT_1, self.BPBrax * p1 * 0.01, self.BPBray);
                    }
                    t = null;
                });
            }
            if (Example > 0) {
                if (p1 > 0) DzFrameShow(Example.BT_1, true);
                else DzFrameShow(Example.BT_1, false);

                SaveReal(ht, GetHandleId(Example.BT_t), strHash("白条百分比"), 100.0);
                SaveReal(ht, GetHandleId(Example.BT_t), strHash("白条时间"), p1);
                SaveInteger(ht, GetHandleId(Example.BT_t), strHash("实例"), Example);
                DzFrameSetSize(Example.BT_1, Example.BPBrax, Example.BPBray);
                TimerStart(Example.BT_t, 0.01, true, function(){
                    timer   t = GetExpiredTimer();
                    LifebarSter Example = LoadInteger(ht, GetHandleId(t), strHash("实例"));
                    real    s = LoadReal(ht, GetHandleId(t), strHash("白条时间"));
                    real   p1 = LoadReal(ht, GetHandleId(t), strHash("白条百分比"));
                    real    v = 100.0 / s * 0.01;
                    integer index;
                    p1 -= v;
                    SaveReal(ht, GetHandleId(t), strHash("白条百分比"), p1);
                    
                    if (p1 <= 0) {
                        DzFrameShow(Example.BT_1, false);
                        PauseTimer(t);
                        Unit = Example.u;
                        for (1 <= index <= thisSize) {
                            if (IsTriggerEnabled(trg[index]) && TriggerEvaluate(trg[index]) && trg[index] != null) {
                                TriggerExecute(trg[index]);
                            }
                        }
                        Unit = null;
                    } else {
                        DzFrameSetSize(Example.BT_1, Example.BPBrax * p1 * 0.01, Example.BPBray);
                    }
                    t = null;
                });
            }
            if (this2 > 0) {
                if (p1 > 0) DzFrameShow(this2.BT_1, true);
                else DzFrameShow(this2.BT_1, false);

                SaveReal(ht, GetHandleId(this2.BT_t), strHash("白条百分比"), 100.0);
                SaveReal(ht, GetHandleId(this2.BT_t), strHash("白条时间"), p1);
                SaveInteger(ht, GetHandleId(this2.BT_t), strHash("实例"), this2);
                DzFrameSetSize(this2.BT_1, this2.BPBrax, this2.BPBray);
                TimerStart(this2.BT_t, 0.01, true, function(){
                    timer   t = GetExpiredTimer();
                    LifebarHero2 this2 = LoadInteger(ht, GetHandleId(t), strHash("实例"));
                    real    s = LoadReal(ht, GetHandleId(t), strHash("白条时间"));
                    real   p1 = LoadReal(ht, GetHandleId(t), strHash("白条百分比"));
                    real    v = 100.0 / s * 0.01;
                    integer index;
                    p1 -= v;
                    SaveReal(ht, GetHandleId(t), strHash("白条百分比"), p1);
                    
                    if (p1 <= 0) {
                        DzFrameShow(this2.BT_1, false);
                        PauseTimer(t);
                        Unit = this2.u;
                        for (1 <= index <= thisSize) {
                            if (IsTriggerEnabled(trg[index]) && TriggerEvaluate(trg[index]) && trg[index] != null) {
                                TriggerExecute(trg[index]);
                            }
                        }
                        Unit = null;
                    } else {
                        DzFrameSetSize(this2.BT_1, this2.BPBrax * p1 * 0.01, this2.BPBray);
                    }
                    t = null;
                });
            }
        }

        // 白条到期事件
        function PO_Lifebar_BTEvent(trigger t) {
            if (t != null) {
                thisSize += 1;
                trg[thisSize] = t;
            }
        }

        // 白条到期单位
        function PO_Lifebar_BTUnit() ->unit {
            return Unit;
        }

        // 设置单位金边显示
        function PO_Lifebar_setJBbar(unit u, boolean p1) {
            LifebarHero this = GetLifebarId(1, u);
            LifebarUnit self = GetLifebarId(2, u);
            LifebarSter Example = GetLifebarId(3, u);
            LifebarHero2 this2 = GetLifebarId(4, u);
            if (this > 0) {
                DzFrameShow(this.JB_1, p1);
                DzFrameShow(this.JB_2, p1);
            }
            if (self > 0) {
                DzFrameShow(self.JB_1, p1);
            }
            if (Example > 0) {
                DzFrameShow(Example.JB_1, p1);
                DzFrameShow(Example.JB_2, p1);
            }
            if (this2 > 0) {
                DzFrameShow(this2.JB_1, p1);
            }
        }

        // 刷新血条
        function PO_Lifebar_Refresh() {
            LifebarHero this;
            LifebarUnit self;
            LifebarSter Example;
            LifebarHero2 this2;
            integer index;
            real x, y, z, value, maxValue, s, sxta = 0.015/*血条低消失速度*/;
            if (HeroSize > 0) {
                for (1 <= index <= HeroSize) {
                    this = LoadInteger(ht, strHash("英雄血条实例"), index);
                    ConverUnitWorldPosition(this.u);
                    x = GetScreenX() + this.Bra_x;
                    y = GetScreenY() + this.Bra_y;
                    z = GetScreenScale();

                    if (x < 0 || x > 0.8 || y < PO_Lifebar_lifex || y > 0.6 - PO_Lifebar_lifey || LoadBoolean(ht, strHash("血条隐藏"), GetHandleId(this.u))) {
                        DzFrameShow(this.DB_1, false);
                    } else {
                        DzFrameShow(this.DB_1, true);

                        DzFrameSetAbsolutePoint(this.DB_1, 4, x, y);
                        DzFrameSetScale(this.DB_1, z);
                        DzFrameSetScale(this.JB_1, z);
                        DzFrameSetScale(this.XT_2, z);
                        DzFrameSetScale(this.XT_1, z);
                        DzFrameSetScale(this.LT_2, z);
                        DzFrameSetScale(this.LT_1, z);
                        DzFrameSetScale(this.HD_1, z);
                        DzFrameSetScale(this.BT_1, z);
                        DzFrameSetScale(this.DJDB_1, z);
                        DzFrameSetScale(this.JB_2, z);
                        DzFrameSetScale(this.DJ_1, z);
                        DzFrameSetScale(this.MZ_1, z);

                        if (this.HPX > this.HP) this.HPX -= sxta;
                        if (this.HPX < this.HP) this.HPX  = this.HP;
                        s = RMaxBJ(this.HPBrax * this.HPX, 0.0001);
                        DzFrameSetSize(this.XT_2, s, this.HPBray);

                        value = GetUnitState(this.u, ConvertUnitState(0));
                        maxValue = GetUnitState(this.u, ConvertUnitState(1));
                        if (maxValue > 0) {
                            this.HP = value / maxValue;
                        } else {
                            this.HP = 0;
                        }
                        if (this.HP == 0) DzFrameShow(this.XT_1, false);
                        else DzFrameShow(this.XT_1, true);
                        s = RMaxBJ(this.HPBrax * this.HP, 0.0001);
                        DzFrameSetSize(this.XT_1, s, this.HPBray);


                        if (this.MPX > this.MP) this.MPX -= sxta;
                        if (this.MPX < this.MP) this.MPX  = this.MP;
                        s = RMaxBJ(this.MPBrax * this.MPX, 0.0001);
                        DzFrameSetSize(this.LT_2, s, this.MPBray);

                        value = GetUnitState(this.u, ConvertUnitState(2));
                        maxValue = GetUnitState(this.u, ConvertUnitState(3));
                        if (maxValue > 0) {
                            this.MP = value / maxValue;
                        } else {
                            this.MP = 0;
                        }
                        if (this.MP == 0) DzFrameShow(this.LT_1, false);
                        else DzFrameShow(this.LT_1, true);
                        s = RMaxBJ(this.MPBrax * this.MP, 0.0001);
                        DzFrameSetSize(this.LT_1, s, this.MPBray);
                    }
                }
            }
            if (UnitSize > 0) {
                for (1 <= index <= UnitSize) {
                    self = LoadInteger(ht, strHash("单位血条实例"), index);
                    ConverUnitWorldPosition(self.u);
                    x = GetScreenX() + self.Bra_x;
                    y = GetScreenY() + self.Bra_y;
                    z = GetScreenScale();

                    if (x < 0 || x > 0.8 || y < PO_Lifebar_lifex || y > 0.6 - PO_Lifebar_lifey || LoadBoolean(ht, strHash("血条隐藏"), GetHandleId(self.u))) {
                        DzFrameShow(self.DB_1, false);
                    } else {
                        DzFrameShow(self.DB_1, true);

                        DzFrameSetAbsolutePoint(self.DB_1, 4, x, y);
                        DzFrameSetScale(self.DB_1, z);
                        DzFrameSetScale(self.JB_1, z);
                        DzFrameSetScale(self.XT_2, z);
                        DzFrameSetScale(self.XT_1, z);
                        DzFrameSetScale(self.HD_1, z);
                        DzFrameSetScale(self.BT_1, z);
                        DzFrameSetScale(self.MZ_1, z);

                        if (self.HPX > self.HP) self.HPX -= sxta;
                        if (self.HPX < self.HP) self.HPX  = self.HP;
                        s = RMaxBJ(self.HPBrax * self.HPX, 0.0001);
                        DzFrameSetSize(self.XT_2, s, self.HPBray);

                        value = GetUnitState(self.u, ConvertUnitState(0));
                        maxValue = GetUnitState(self.u, ConvertUnitState(1));
                        if (maxValue > 0) {
                            self.HP = value / maxValue;
                        } else {
                            self.HP = 0;
                        }
                        if (self.HP == 0) DzFrameShow(self.XT_1, false);
                        else DzFrameShow(self.XT_1, true);
                        s = RMaxBJ(self.HPBrax * self.HP, 0.0001);
                        DzFrameSetSize(self.XT_1, s, self.HPBray);
                    }
                }
            }
            if (SterSize > 0) {
                for (1 <= index <= SterSize) {
                    Example = LoadInteger(ht, strHash("精英血条实例"), index);
                    ConverUnitWorldPosition(Example.u);
                    x = GetScreenX() + Example.Bra_x;
                    y = GetScreenY() + Example.Bra_y;
                    z = GetScreenScale();

                    if (x < 0 || x > 0.8 || y < PO_Lifebar_lifex || y > 0.6 - PO_Lifebar_lifey || LoadBoolean(ht, strHash("血条隐藏"), GetHandleId(Example.u))) {
                        DzFrameShow(Example.DB_1, false);
                    } else {
                        DzFrameShow(Example.DB_1, true);

                        DzFrameSetAbsolutePoint(Example.DB_1, 4, x, y);
                        DzFrameSetScale(Example.DB_1, z);
                        DzFrameSetScale(Example.JB_1, z);
                        DzFrameSetScale(Example.XT_2, z);
                        DzFrameSetScale(Example.XT_1, z);
                        DzFrameSetScale(Example.HD_1, z);
                        DzFrameSetScale(Example.BT_1, z);
                        DzFrameSetScale(Example.DJDB_1, z);
                        DzFrameSetScale(Example.JB_2, z);
                        DzFrameSetScale(Example.DJ_1, z);
                        DzFrameSetScale(Example.MZ_1, z);

                        if (Example.HPX > Example.HP) Example.HPX -= sxta;
                        if (Example.HPX < Example.HP) Example.HPX  = Example.HP;
                        s = RMaxBJ(Example.HPBrax * Example.HPX, 0.0001);
                        DzFrameSetSize(Example.XT_2, s, Example.HPBray);

                        value = GetUnitState(Example.u, ConvertUnitState(0));
                        maxValue = GetUnitState(Example.u, ConvertUnitState(1));
                        if (maxValue > 0) {
                            Example.HP = value / maxValue;
                        } else {
                            Example.HP = 0;
                        }
                        if (Example.HP == 0) DzFrameShow(Example.XT_1, false);
                        else DzFrameShow(Example.XT_1, true);
                        s = RMaxBJ(Example.HPBrax * Example.HP, 0.0001);
                        DzFrameSetSize(Example.XT_1, s, Example.HPBray);
                    }
                }
            }
            if (HeroSize2 > 0) {
                for (1 <= index <= HeroSize2) {
                    this2 = LoadInteger(ht, strHash("英雄血条实例2"), index);
                    ConverUnitWorldPosition(this2.u);
                    x = GetScreenX() + this2.Bra_x;
                    y = GetScreenY() + this2.Bra_y;
                    z = GetScreenScale();

                    if (x < 0 || x > 0.8 || y < PO_Lifebar_lifex || y > 0.6 - PO_Lifebar_lifey || LoadBoolean(ht, strHash("血条隐藏"), GetHandleId(this2.u))) {
                        DzFrameShow(this2.DB_1, false);
                    } else {
                        DzFrameShow(this2.DB_1, true);

                        DzFrameSetAbsolutePoint(this2.DB_1, 4, x, y);
                        DzFrameSetScale(this2.DB_1, z);
                        DzFrameSetScale(this2.JB_1, z);
                        DzFrameSetScale(this2.XT_2, z);
                        DzFrameSetScale(this2.XT_1, z);
                        DzFrameSetScale(this2.LT_2, z);
                        DzFrameSetScale(this2.LT_1, z);
                        DzFrameSetScale(this2.HD_1, z);
                        DzFrameSetScale(this2.BT_1, z);
                        DzFrameSetScale(this2.MZ_1, z);

                        if (this2.HPX > this2.HP) this2.HPX -= sxta;
                        if (this2.HPX < this2.HP) this2.HPX  = this2.HP;
                        s = RMaxBJ(this2.HPBrax * this2.HPX, 0.0001);
                        DzFrameSetSize(this2.XT_2, s, this2.HPBray);

                        value = GetUnitState(this2.u, ConvertUnitState(0));
                        maxValue = GetUnitState(this2.u, ConvertUnitState(1));
                        if (maxValue > 0) {
                            this2.HP = value / maxValue;
                        } else {
                            this2.HP = 0;
                        }
                        if (this2.HP == 0) DzFrameShow(this2.XT_1, false);
                        else DzFrameShow(this2.XT_1, true);
                        s = RMaxBJ(this2.HPBrax * this2.HP, 0.0001);
                        DzFrameSetSize(this2.XT_1, s, this2.HPBray);



                        if (this2.MPX > this2.MP) this2.MPX -= sxta;
                        if (this2.MPX < this2.MP) this2.MPX  = this2.MP;
                        s = RMaxBJ(this2.MPBrax * this2.MPX, 0.0001);
                        DzFrameSetSize(this2.LT_2, s, this2.MPBray);

                        value = GetUnitState(this2.u, ConvertUnitState(2));
                        maxValue = GetUnitState(this2.u, ConvertUnitState(3));
                        if (maxValue > 0) {
                            this2.MP = value / maxValue;
                        } else {
                            this2.MP = 0;
                        }
                        if (this2.MP == 0) DzFrameShow(this2.LT_1, false);
                        else DzFrameShow(this2.LT_1, true);
                        s = RMaxBJ(this2.MPBrax * this2.MP, 0.0001);
                        DzFrameSetSize(this2.LT_1, s, this2.MPBray);
                    }
                }
            }
        }
    }
}
//! endzinc
#endif
