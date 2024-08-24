#include "japi/YDWEXweiObjectSlk.j"
#ifndef JAPI_LIBRARY
#define JAPI_LIBRARY
#define YDWEAbilityStateIncluded
#define YDWEEffectIncluded
#define YDWEJapiUnitIncluded
#define YDWEEventDamageDataIncluded
#define YDWEYDWEJapiScriptIncluded
#define YDWEYDWEJapiOtherIncluded
library japi
    globals
        private constant integer EVENT_DAMAGE_DATA_VAILD       = 0
        private constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
        private constant integer EVENT_DAMAGE_DATA_IS_ATTACK   = 2
        private constant integer EVENT_DAMAGE_DATA_IS_RANGED   = 3
        private constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
        private constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
        private constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6

        constant integer YDWE_OBJECT_TYPE_ABILITY      = 0
    	constant integer YDWE_OBJECT_TYPE_BUFF         = 1
    	constant integer YDWE_OBJECT_TYPE_UNIT         = 2
    	constant integer YDWE_OBJECT_TYPE_ITEM         = 3
    	constant integer YDWE_OBJECT_TYPE_UPGRADE      = 4
    	constant integer YDWE_OBJECT_TYPE_DOODAD       = 5
    	constant integer YDWE_OBJECT_TYPE_DESTRUCTABLE = 6
	endglobals
 
	native EXGetUnitAbility        takes unit u, integer abilcode returns ability
    native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
    native EXGetAbilityId          takes ability abil returns integer
    native EXGetAbilityState       takes ability abil, integer state_type returns real
    native EXSetAbilityState       takes ability abil, integer state_type, real value returns boolean
    native EXGetAbilityDataReal    takes ability abil, integer level, integer data_type returns real
    native EXSetAbilityDataReal    takes ability abil, integer level, integer data_type, real value returns boolean
    native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
    native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
    native EXGetAbilityDataString  takes ability abil, integer level, integer data_type returns string
    native EXSetAbilityDataString  takes ability abil, integer level, integer data_type, string value returns boolean

    function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer state_type returns real
        return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
    endfunction

    function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
        return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction

    function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
        return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction

    function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
        return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction

    function YDWESetUnitAbilityState takes unit u, integer abilcode, integer state_type, real value returns boolean
        return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
    endfunction

    function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns boolean
        return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

    function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns boolean
        return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

    function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns boolean
        return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

    native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean

    function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
        call UnitAddAbility(u, abilcode)
        call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), 1, ABILITY_DATA_UNITID, GetUnitTypeId(u))
        call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
        call UnitRemoveAbility(u, abilcode)
        call UnitAddAbility(u, abilcode)
        call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
        call UnitRemoveAbility(u, abilcode)
    endfunction

    native EXGetItemDataString takes integer itemcode, integer data_type returns string
    native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean

    function YDWEGetItemDataString takes integer itemcode, integer data_type returns string
        return EXGetItemDataString(itemcode, data_type)
    endfunction

    function YDWESetItemDataString takes integer itemcode, integer data_type, string value returns boolean
        return EXSetItemDataString(itemcode, data_type, value)
    endfunction


    native EXGetEventDamageData takes integer edd_type returns integer
    native EXSetEventDamage takes real amount returns boolean
    
    function YDWEIsEventPhysicalDamage takes nothing returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)
    endfunction

    function YDWEIsEventAttackDamage takes nothing returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
    endfunction
    
    function YDWEIsEventRangedDamage takes nothing  returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)
    endfunction
    
    function YDWEIsEventDamageType takes damagetype damageType returns boolean
        return damageType == ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
    endfunction

    function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
        return weaponType == ConvertWeaponType(EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE))
    endfunction
    
    function YDWEIsEventAttackType takes attacktype attackType returns boolean
        return attackType == ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
    endfunction

    
    function YDWESetEventDamage takes real amount returns boolean
        return EXSetEventDamage(amount)
    endfunction
    

    native EXGetEffectX takes effect e returns real
    native EXGetEffectY takes effect e returns real
    native EXGetEffectZ takes effect e returns real
    native EXSetEffectXY takes effect e, real x, real y returns nothing
    native EXSetEffectZ takes effect e, real z returns nothing
    native EXGetEffectSize takes effect e returns real
    native EXSetEffectSize takes effect e, real size returns nothing
    native EXEffectMatRotateX takes effect e, real angle returns nothing
    native EXEffectMatRotateY takes effect e, real angle returns nothing
    native EXEffectMatRotateZ takes effect e, real angle returns nothing
    native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
    native EXEffectMatReset takes effect e returns nothing
    native EXSetEffectSpeed takes effect e, real speed returns nothing

    function YDWESetEffectLoc takes effect e, location loc returns nothing
        call EXSetEffectXY(e, GetLocationX(loc), GetLocationY(loc))
    endfunction


	native EXDisplayChat     takes player p, integer chat_recipient, string message returns nothing

    function YDWEDisplayChat takes player p, integer chat_recipient, string message returns nothing
        call EXDisplayChat(p, chat_recipient, message)
    endfunction

    native EXExecuteScript     takes string script returns string

    native EXSetUnitFacing takes unit u, real angle returns nothing
    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
    native EXSetUnitMoveType takes unit u, integer t returns nothing
    native EXSetUnitArrayString takes integer uid, integer id,integer n,string name returns boolean
    native EXSetUnitInteger takes integer uid, integer id,integer n returns boolean

    function DzIsUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns boolean
        return ConvertAttackType(R2I(GetUnitState(GetTriggerUnit(), ConvertUnitState(16+19*index))))==attackType
    endfunction

    function DzSetUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns nothing
        call SetUnitState( GetTriggerUnit(), ConvertUnitState(16+19*index), GetHandleId(attackType ))
    endfunction

    function DzIsUnitDefenseType takes unit whichUnit,integer defenseType returns boolean
        return R2I(GetUnitState(GetTriggerUnit(), ConvertUnitState(0x50)))==defenseType
    endfunction

    function DzSetUnitDefenseType takes unit whichUnit,integer defenseType returns nothing
        call SetUnitState( GetTriggerUnit(), ConvertUnitState(0x50), defenseType )
    endfunction

    function YDWEUnitAddStun takes unit u returns nothing
        call EXPauseUnit(u, true)
    endfunction

    function YDWEUnitRemoveStun takes unit u returns nothing
        call EXPauseUnit(u, false)
    endfunction

    // function DzSetHeroTypeProperName takes integer uid,string name returns nothing
	//     call EXSetUnitArrayString(uid,61,0,name)
    // 	call EXSetUnitInteger(uid,61,1)
	// endfunction

	// function DzSetUnitTypeName takes integer uid,string name returns nothing
	//     call EXSetUnitArrayString(uid,10,0,name)
    // 	call EXSetUnitInteger(uid,10,1)
	// endfunction
endlibrary
#endif
