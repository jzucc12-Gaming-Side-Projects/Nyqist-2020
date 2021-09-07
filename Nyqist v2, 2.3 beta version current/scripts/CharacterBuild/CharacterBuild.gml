#region//Enum
enum EQUIP{
	wpn1,
	wpn2,
	armor,
	head,
	equip_count
}

enum STAT{
	def_stat,
	wpn1_stat,
	wpn2_stat,
	stat_count
}
#endregion

#region//Build Character
function CharacterInfo(_title, _nickname, _level){
	var _info = {
		title : _title,
		nickname : _nickname,
		level : _level
	}
	return _info;
}

function CharacterStat(_hp_max, _tp_max, _evasion, _phys_df, _tech_df,
					   _spd, _phys_accu, _phys_dmg, _tech_accu, _tech_dmg,
					   _crit_accu, _crit_mult){
	var _def_stat = {
		hp_max : _hp_max,
		hp : _hp_max,
		tp_max : _tp_max,
		tp : _tp_max,
		evasion : _evasion,
		phys_df : _phys_df,
		tech_df : _tech_df
	}
	
	var _wpn_stat = {
		spd : _spd,
		phys_accu : _phys_accu,
		phys_dmg : _phys_dmg,
		tech_accu : _tech_accu,
		tech_dmg : _tech_dmg,
		crit_accu : _crit_accu,
		crit_mult : _crit_mult
	}
	
	var _wpn_stat2 = CopyStruct(_wpn_stat);
	
	return [_def_stat, _wpn_stat, _wpn_stat2];
}

function CharacterEquipped(_wpn1,_wpn2,_armor,_head,_aug1,_aug2,_hack,_enh){
	return [_wpn1, _wpn2, _armor, _head];
	//aug1 = _aug1;
	//aug2 = _aug2;
	//hack = _hack;
	//enh = _enh;
}

function CharacterSpritePackage(_idle, _move, _combat, _down, _ko, _wait){
	var _sprite = {
		idle : _idle,
		move : _move,
		combat : _combat,
		down : _down,
		ko : _ko,
		wait : _wait
	}
	return _sprite;
}

function CharacterSpriteFace(_normal, _happy, _sad, _angry, _laugh){
	return [_normal,_happy,_sad,_angry,_laugh];
}

function CharacterText(_face,_col){
	var _text = {
		face : _face,
		col : _col
	}
	return _text;
}

function CharacterBuild(_info, _sprite, _text, _base_stat, _equipped) constructor{
	info = _info;	  //Player name, level
	sprite = _sprite; //Full body sprites
	text = _text;	  //Face sprites and text information
	equipped = _equipped;  //Equipment array
	
	#region//Stat Formation and Functions
	function CopyStat(_stat){
		var _new_stat;
		_new_stat[0] = CopyStruct(_stat[0]);
		_new_stat[1] = CopyStruct(_stat[1]);
		_new_stat[2] = CopyStruct(_stat[2]);
		return _new_stat;
	}
	
	base_stat = CopyStat(_base_stat); //Base stats
	mod_stat = CopyStat(_base_stat); //Modified base stats
	
	function EquipOne(_equipment_no, _index, _enact){
		//Keeps track if function called itself to prevent infinite loops
		if(argument_count == 4 && argument[3] == true)
			var _recursive = true;
		else
			var _recursive = false;
		
		//Cancel if not making a change		
		if(equipped[_equipment_no] == _index)
			return equipped_stat;
		
		//Determine equipping path
		var _deequip = false;
		var _equipped_stat = CopyStat(equipped_stat);
		if(_index == -1) //If deequiping
			var _deequip = true;
		else if(equipped[_equipment_no] != -1) //If equipping over a slot that isn't empty, deequip first
			var _equipped_stat = EquipOne(_equipment_no,-1,_enact,true);
		
		//Get equipoment to equip or deequip
		if(!_deequip)
			var _equipment = GetEquipment(_equipment_no,_index);
		else
			var _equipment = GetEquipment(_equipment_no,equipped[_equipment_no]);
		 var _equipment_stat = _equipment.stat;
		
		//Cycle de-equip through each stat set
		_equipped_stat = EquipStats(_equipment_no,_equipped_stat,_equipment_stat,_deequip);
		
		//Apply changes to character if requested
		if(_enact)
		{
			equipped_stat = _equipped_stat;
			equipped[_equipment_no] = _index;
		}
		
		//Auto equips fist to weapon if weapon is deequipped only
		if((_equipment_no == 0 || _equipment_no == 1) && _index == -1 && !_recursive)
			var _equipped_stat = EquipOne(_equipment_no,0,_enact,true);
		return _equipped_stat;
	}
			
	function EquipAll(){
		var _equipped_stat = CopyStat(mod_stat);
	
		//Cycle through each inventory slot
		for(var ii = 0; ii < EQUIP.equip_count; ii++)
		{
			//Get equipoment to equip or deequip
			if(equipped[ii] == -1)
				continue;
			else
				var _equipment = GetEquipment(ii,equipped[ii]);
			var _equipment_stat = _equipment.stat;
			
			//Cycle through stat sets
			var _equipped_stat = EquipStats(ii,_equipped_stat,_equipment_stat,false);
		}
		return _equipped_stat;
	}
	
	function DeequipAll(_enact){
		var _equipped_stat = CopyStat(mod_stat);
		if(_enact)
		{
			equipped_stat = _equipped_stat;
			for(var ii = 0; ii < array_length(equipped); ii++)
				equipped[ii] = -1;
		}
		return _equipped_stat;
	}
		
	equipped_stat = EquipAll(); //Final stats with equipment
	#endregion
}
#endregion
