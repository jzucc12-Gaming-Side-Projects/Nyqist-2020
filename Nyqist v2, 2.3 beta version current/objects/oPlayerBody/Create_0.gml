//Decide player
var _luna_num = 2 - global.LunaMain;
p_no = instance_number(oPlayerBody);
if(p_no == _luna_num)
	player = CopyStruct(global.Luna);
else
	player = CopyStruct(global.Oscar);
body_stat = player.equipped_stat[0];

//Draw info
x = RES_WIDTH * 0.75;
x_name = RES_WIDTH * 0.8;
x_hp = x_name;
y = RES_HEIGHT * 0.33 * 0.66 * p_no;
y_name = RES_HEIGHT * (0.68 + 0.18 * (p_no-1));
y_hp = y_name + 18;
image_speed = 0;

