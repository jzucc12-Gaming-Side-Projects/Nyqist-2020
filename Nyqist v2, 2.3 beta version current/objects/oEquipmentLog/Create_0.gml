wpn_log = -1;
armor_log = -1;
head_log = -1;

var _fist_stats = EquipmentStat(2,1,2,1,2,1,2,1,2,1,2,1);
NewEquipment(E_TYPE.wpn,"Fist",-1,0,_fist_stats,-1,0);

var _sword_stats = EquipmentStat(2,2,2,2,2,2,2,2,2,2,2,2);
NewEquipment(E_TYPE.wpn,"Sword",-1,20,_sword_stats,-1,1);

var _shield_stats = EquipmentStat(3,3,3,3,3,3,3,3,3,3,3,3);
NewEquipment(E_TYPE.wpn,"Shield",-1,20,_shield_stats,0,2);

var _vest_stats = EquipmentStat(3,4,3,4,3,4,3,4,3,4,3,4);
NewEquipment(E_TYPE.armor,"Vest",-1,10,_vest_stats,-1,0);

var _goggles_stats = EquipmentStat(5,5,5,5,5,5,5,5,5,5,5,5);
NewEquipment(E_TYPE.head,"Goggles",-1,10,_goggles_stats,-1,0);

#region//COME BACK TO WHEN SAVING STRUCTS IS POSSIBLE
/*
var _thing = ds_list_create();
var _wrapper = ds_map_create();
_thing[| 0] = wpn_log;
_thing[| 1] = [1,2,4];
_thing[| 2] = 3;

show_debug_message(_thing[| 0][0].title);
ds_map_add_list(_wrapper,"root",_thing);

var _string = json_encode(_wrapper);
var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
buffer_write(_buffer,buffer_string,_string);
buffer_save(_buffer, "Equipment.txt");
buffer_delete(_buffer);
ds_map_destroy(_wrapper);

var _buffer = buffer_load("Equipment.txt");
var _string = buffer_read(_buffer,buffer_string);
buffer_delete(_buffer);
var _json = json_decode(_string);
var _list = _json[? "root"];
var _equip = _list[| 0];
ds_map_destroy(_json);
ds_list_destroy(_list);

show_debug_message(_equip.title);
*/
#endregion