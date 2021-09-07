#region//Enums
enum E_TYPE{
	wpn = 0,
	armor = 1,
	head = 2,
}
#endregion

function EquipmentStat(_hp_max, _tp_max, _evasion, _phys_df, _tech_df, 
			  _spd, _phys_accu, _phys_dmg, _tech_accu, _tech_dmg,
			  _crit_accu, _crit_mult){
	var _stat = {
		hp_max : _hp_max,
		hp : _hp_max,
		tp_max : _tp_max,
		tp : _tp_max,
		evasion : _evasion,
		phys_df : _phys_df,
		tech_df : _tech_df,
		spd : _spd,
		phys_accu : _phys_accu,
		phys_dmg : _phys_dmg,
		tech_accu : _tech_accu,
		tech_dmg : _tech_dmg,
		crit_accu : _crit_accu,
		crit_mult : _crit_mult
	}
	return _stat;
}

function NewEquipment(_type,_title,_sprite,_cost,_stat,_special,_index){
	
	var _equipment = {
		type : _type,
		title : _title,
		sprite : _sprite,
		cost : _cost,
		stat : _stat,
		special : _special
	}
	
	switch(_type)
	{
		case E_TYPE.wpn:
			other.wpn_log[_index] = _equipment;
			break;
		case E_TYPE.armor:
			other.armor_log[_index] = _equipment;
			break;
		case E_TYPE.head:
			other.head_log[_index] = _equipment;
			break;
	}
}
	
function GetEquipment(_equipment_no, _index){
	var _equipment = -1;
	
	switch(_equipment_no)
	{
		case EQUIP.wpn1:
		case EQUIP.wpn2:
			_equipment = CopyStruct(oEquipmentLog.wpn_log[_index]);
			break;
		case EQUIP.armor:
			_equipment = CopyStruct(oEquipmentLog.armor_log[_index]);
			break;
		case EQUIP.head:
			_equipment = CopyStruct(oEquipmentLog.head_log[_index]);
			break;				
	}
	return _equipment
}
	
function EquipStats(_equipment_no,_equipped_stat, _equipment_stat, _deequip){
	//Cycle through stat sets
	for(var ii = 0; ii < STAT.stat_count; ii++)
	{
		//Skip if weapon and stat don't match
		if((_equipment_no == 0 && ii == 2) || (_equipment_no == 1 && ii == 1))
			continue
				
		//Copy stats to temporary struct
		var _stat_names = variable_struct_get_names(_equipped_stat[ii]);
		for(var jj = 0; jj < array_length(_stat_names); jj++)
		{
			var _stat_curr = _stat_names[jj];
			var _old_stat = variable_struct_get(_equipped_stat[ii],_stat_curr);
			var _new_stat = variable_struct_get(_equipment_stat,_stat_curr);
			if(!_deequip)
				variable_struct_set(_equipped_stat[ii],_stat_curr,_old_stat + _new_stat);
			else
				variable_struct_set(_equipped_stat[ii],_stat_curr,_old_stat - _new_stat);
		}
	}	
	return _equipped_stat;
}