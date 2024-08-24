#ifndef SoundIncluded
#define SoundIncluded
#define SaveSound(self, index, value)   SaveStr(ht, self, index, value)
#define LoadSound(self, index)          LoadStr(ht, self, index)
#define FlushSound(self)                FlushChildHashtable(ht, self)
#ifndef strHash
#define strHash(str) <?= StringHash(str) ?>
#endif
#include "popo/IntGroup.j"
//! zinc
library Sound requires IntGroup
{
    public struct Music {
        private
        {   
            integer     max;
            IntGroup   intG;
            static hashtable ht = InitHashtable();
            
            // 获取音频时间
            static method GetSoundTimer(string musicFileName) -> real { return I2R(GetSoundFileDuration(musicFileName)) * 0.001; }
            
            static method onInit() {
                trigger  t = CreateTrigger();
                Music.MusicTimer = CreateTimer();
                TriggerRegisterTimerExpireEvent(t, Music.MusicTimer);
                TriggerAddCondition(t, Filter(function(){
                    timer   t = GetExpiredTimer();
                    thistype this = LoadInteger(ht, GetHandleId(t), strHash("实例"));
                    integer i = pp_IntGroup_Remove(this.intG, false);
                    string  musicFileName;
                    integer index;
                    real    s;
                    if (i == 0) {
                        for (1 <= index <= this.max) { pp_IntGroup_Addint(this.intG, index); }
                        i = pp_IntGroup_Remove(this.intG, false);  
                    }
                    musicFileName = LoadSound(this, i);
                    s = GetSoundTimer(musicFileName);
                    PauseTimer(Music.MusicTimer);
                    StopMusic(false);
                    PlayMusic(musicFileName);
                    TimerStart(t, s, false, null);
                    debug BJDebugMsg("[音乐组] - 计时器到期");
                    debug BJDebugMsg("[音乐组] - 音乐组播放序号:" + I2S(i));
                    t = null;
                }));
                t = null;
            }
        }

        public {
            static timer     MusicTimer;
            //  新建随机音乐组
            static method create() -> thistype {
                thistype this   = thistype.allocate();
                this.intG       = pp_IntGroup_create();
                this.max        = 0;
                return this;
            }

            //  添加音乐
            method Addsound(string musicFileName) {
                this.max     += 1;
                pp_IntGroup_Addint(this.intG, this.max);
                SaveSound(this, this.max, musicFileName);
            }

            //  播放随机音乐组
            method playMusic() {
                integer i = pp_IntGroup_Remove(this.intG, false);
                string  musicFileName;
                integer index;
                real    s;
                if (i == 0) {
                    for (1 <= index <= this.max) { pp_IntGroup_Addint(this.intG, index); }
                    i = pp_IntGroup_Remove(this.intG, false);
                }
                musicFileName = LoadSound(this, i);
                s = GetSoundTimer(musicFileName);
                SaveInteger(ht, GetHandleId(Music.MusicTimer), strHash("实例"), this);
                PauseTimer(Music.MusicTimer);
                StopMusic(false);
                PlayMusic(musicFileName);
                TimerStart(Music.MusicTimer, s, false, null);
                debug BJDebugMsg("[音乐组] - 音乐组播放序号:" + I2S(i));
            }
        }
    }
    public struct Sound {
        private
        {   
            integer      id;
        }

        public {
            sound    bgm[5];
            //  新建可叠加音效
            static method create(string fileName, integer volume) -> thistype {
                thistype this   = thistype.allocate();
                integer index;
                for (1 <= index <= 4) {
                    this.bgm[index] = CreateSound(fileName, false, false, false, 10, 10, "");
                    SetSoundDuration(this.bgm[index], GetSoundFileDuration(fileName));
                    SetSoundVolume(this.bgm[index], volume);
                }
                this.id = 1;
                return this;
            }

            //  播放叠加音效
            method playsound() {
                if (this > 0) {
                    StopSoundBJ(this.bgm[this.id], false);
                    PlaySoundBJ(this.bgm[this.id]);
                    this.id += 1;
                    if (this.id > 4) this.id = 1;
                } else {
                    debug BJDebugMsg("[音效] - 未获取到音效");
                }
            }
        }
    }
    public {
        integer PO_lastCreatedMusic = 0;
        integer PO_lastCreatedSound = 0;

        // 新建随机音乐组
        function PO_Music_create() -> Music {
            Music this = Music.create();
            PO_lastCreatedMusic = this;
            return PO_lastCreatedMusic;
        }

        // 添加音乐
        function PO_Music_Addsound(Music this, string musicFileName) {
            this.Addsound(musicFileName);
        }

        // 播放随机音乐组
        function PO_Music_playMusic(Music this) {
            this.playMusic();
        }

        // 停止背景音乐
        function PO_Music_StopMusic(boolean fadeOut) {
            PauseTimer(Music.MusicTimer);
            StopMusic(fadeOut);
        }

        // 恢复背景音乐
        function PO_Music_ResumeMusic() {
            ResumeTimer(Music.MusicTimer);
            ResumeMusic();
        }

        // 设置背景音乐音量
        function PO_Music_MusicVolume(integer volume) {
            SetMusicVolume(volume);
        }

        // 新建可叠加音效
        function PO_Sound_create(string fileName, integer volume) -> Sound {
            Sound this = Sound.create(fileName, volume);
            PO_lastCreatedSound = this;
            return PO_lastCreatedSound;
        }

        // 播放可叠加音效
        function PO_Sound_playsound(Sound this) {
            this.playsound();
        }

        // 设置音效速率
        function PO_Sound_Pitch(Sound this, real pitch) {
            SetSoundPitch(this.bgm[1], pitch);
            SetSoundPitch(this.bgm[2], pitch);
            SetSoundPitch(this.bgm[3], pitch);
            SetSoundPitch(this.bgm[4], pitch);
        }
    }
}
//! endzinc
#endif
