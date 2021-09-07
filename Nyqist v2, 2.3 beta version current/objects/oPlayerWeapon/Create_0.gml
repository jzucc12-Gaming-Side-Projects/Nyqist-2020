//Decide Weapon
wpn_no = instance_number(oPlayerWeapon);

if(wpn_no < 3)
	player = oCombatManager.p1.player;
else
	player = oCombatManager.p2.player;
	
if(!IsEven(wpn_no))
{
	wpn_stat = player.equipped_stat[1];
	wpn = GetEquipment(0,player.equipped[0]);
}
else
{
	wpn_stat = player.equipped_stat[2];
	wpn = GetEquipment(1,player.equipped[1]);
}


//Make atb
x = RES_WIDTH * 0.9;
y = RES_HEIGHT * (0.72 + 0.03 * IsEven(wpn_no) + 0.18*(wpn_no > 2));
atb_height = 2;
atb_width = 40;
atb_curr = irandom(15);
atb_max = 100;
atb_full = false;
active = false;

//Action menu
action_hover = 0;
action_horiz_option = [0,0,0,0];
action_menu[0][0] = wpn.title;
action_menu[0][1] = "Block";
action_menu[1][0] = "Enhancement";
action_menu[1][1] = "Hack";
action_menu[2][0] = "Item";
action_menu[2][1] = "Equipment";
action_menu[3][0] = "Flee";