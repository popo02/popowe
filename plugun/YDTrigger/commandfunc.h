
//  隐藏按钮只需要设置Buttonpos=0,-11即可
//  移动
//  [CmdMove]
//  Buttonpos=0,0

//  攻击
//  [CmdAttack]
//  Buttonpos=3,0

//  攻击地面
//  [CmdAttackGround]
//  Buttonpos=3,1

//  保持原位
//  [CmdHoldPos]
//  Buttonpos=2,0

//  巡逻
//  [CmdPatrol]
//  Buttonpos=0,1

//  设集结点
//  [CmdRally]
//  Buttonpos=3,1

//  英雄技能
//  [CmdSelectSkill]
//  Buttonpos=3,1

//  停止
//  [CmdStop]
//  Buttonpos=1,0


#  define PO_Command(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8) DoNothing()           YDNL\
<?local CommandFunc='[CmdMove]\n'                                                               \
CommandFunc=CommandFunc .. 'Art=CommandMove\n'                                                  \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x1 .. ',' .. y1                                      \
CommandFunc=CommandFunc .. '\n[CmdAttack]\n'                                                    \
CommandFunc=CommandFunc .. 'Art=CommandAttack\n'                                                \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x2 .. ',' .. y2                                      \
CommandFunc=CommandFunc .. '\n[CmdAttackGround]\n'                                              \
CommandFunc=CommandFunc .. 'Art=CommandAttackGround\n'                                          \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x3 .. ',' .. y3                                      \
CommandFunc=CommandFunc .. '\n[CmdBuild]\n'                                                     \
CommandFunc=CommandFunc .. 'Art=CommandBasicStruct\n'                                           \
CommandFunc=CommandFunc .. 'Buttonpos=0,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdBuildHuman]\n'                                                  \
CommandFunc=CommandFunc .. 'Art=CommandBasicStructHuman\n'                                      \
CommandFunc=CommandFunc .. 'Buttonpos=0,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdBuildOrc]\n'                                                    \
CommandFunc=CommandFunc .. 'Art=CommandBasicStructOrc\n'                                        \
CommandFunc=CommandFunc .. 'Buttonpos=0,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdBuildNightElf]\n'                                               \
CommandFunc=CommandFunc .. 'Art=CommandBasicStructNightElf\n'                                   \
CommandFunc=CommandFunc .. 'Buttonpos=0,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdBuildUndead]\n'                                                 \
CommandFunc=CommandFunc .. 'Art=CommandBasicStructUndead\n'                                     \
CommandFunc=CommandFunc .. 'Buttonpos=0,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdCancel]\n'                                                      \
CommandFunc=CommandFunc .. 'Art=CommandCancel\n'                                                \
CommandFunc=CommandFunc .. 'ButtonPos=3,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdCancelBuild]\n'                                                 \
CommandFunc=CommandFunc .. 'Art=CommandCancel\n'                                                \
CommandFunc=CommandFunc .. 'ButtonPos=3,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdCancelTrain]\n'                                                 \
CommandFunc=CommandFunc .. 'Art=CommandCancel\n'                                                \
CommandFunc=CommandFunc .. 'ButtonPos=3,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdCancelRevive]\n'                                                \
CommandFunc=CommandFunc .. 'Art=CommandCancel\n'                                                \
CommandFunc=CommandFunc .. 'ButtonPos=3,2\n'                                                    \
CommandFunc=CommandFunc .. '[CmdHoldPos]\n'                                                     \
CommandFunc=CommandFunc .. 'Art=CommandHoldPosition\n'                                          \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x4 .. ',' .. y4                                      \
CommandFunc=CommandFunc .. '\n[CmdPatrol]\n'                                                    \
CommandFunc=CommandFunc .. 'Art=CommandPatrol\n'                                                \
CommandFunc=CommandFunc .. 'Buttonpos=' ..x5 .. ',' .. y5                                       \
CommandFunc=CommandFunc .. '\n[CmdPurchase]\n'                                                  \
CommandFunc=CommandFunc .. 'Art=CommandPurchase\n'                                              \
CommandFunc=CommandFunc .. 'Buttonpos=0,0\n'                                                    \
CommandFunc=CommandFunc .. '[CmdRally]\n'                                                       \
CommandFunc=CommandFunc .. 'Art=CommandRally\n'                                                 \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x6 .. ',' .. y6                                      \
CommandFunc=CommandFunc .. '\nPlacementModel=UI\\Feedback\\RallyPoint\\RallyPoint.mdl\n'        \
CommandFunc=CommandFunc .. '[CmdSelectSkill]\n'                                                 \
CommandFunc=CommandFunc .. 'Art=CommandNewSkill\n'                                              \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x7 .. ',' .. y7                                      \
CommandFunc=CommandFunc .. '\n[CmdStop]\n'                                                      \
CommandFunc=CommandFunc .. 'Art=CommandStop\n'                                                  \
CommandFunc=CommandFunc .. 'Buttonpos=' .. x8 .. ',' .. y8                                      \
import("units\\commandfunc.txt")(CommandFunc)?>


# define Console01 DoNothing()                             YDNL\
<?import("Console.lua")[=[                                     \
    require('jass.console').enable = true                      \
]=]?>                                                          \

# define Console02 DoNothing()                             YDNL\
<?import("Console.lua")[=[                                     \
    require('jass.console').enable = false                     \
]=]?>                                                          \

# define PO_Console(Console) Console


# define Maprecord01 DoNothing()                             YDNL\
<?import("Maprecord.lua")[=[                                     \
    Maprecord = true                      \
]=]?>                                                          \

# define Maprecord02 DoNothing()                             YDNL\
<?import("Maprecord.lua")[=[                                     \
    Maprecord = false                     \
]=]?>                                                          \

# define SetPlatformEnvironment(Maprecord) Maprecord

