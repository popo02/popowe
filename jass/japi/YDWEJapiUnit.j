#ifndef YDWEJapiUnitIncluded
#define YDWEJapiUnitIncluded

library YDWEJapiUnit
	globals
		constant integer DEFENSE_TYPE_LIGHT=0
		constant integer DEFENSE_TYPE_MEDIUM=1
		constant integer DEFENSE_TYPE_LARGE=2
		constant integer DEFENSE_TYPE_FORT=3
		constant integer DEFENSE_TYPE_NORMAL=4
		constant integer DEFENSE_TYPE_HERO=5
		constant integer DEFENSE_TYPE_DIVINE=6
		constant integer DEFENSE_TYPE_NONE=7
	endglobals

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

	function DzSetHeroTypeProperName takes integer uid,string name returns nothing
	    call EXSetUnitArrayString(uid,61,0,name)
    	call EXSetUnitInteger(uid,61,1)
	endfunction

	function DzSetUnitTypeName takes integer uid,string name returns nothing
	    call EXSetUnitArrayString(uid,10,0,name)
    	call EXSetUnitInteger(uid,10,1)
	endfunction

endlibrary

#endif  /// YDWEJapiUnitIncluded
