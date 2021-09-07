global.paused = false;
global.gameState = "Combat";
data = global.combatData;
data.LoadEnemy();

//Draw borders
box_buff = 3;
menu_x1 = RES_WIDTH*0.6;
menu_y1 = RES_HEIGHT*0.66;

#region//Spawn players
//Make player bodies
p1 = instance_create_depth(0,0,-1,oPlayerBody)
p2 = instance_create_depth(0,0,-1,oPlayerBody)

//Make player weapons
p1w1 = instance_create_depth(0,0,-1,oPlayerWeapon);
p1w2 = instance_create_depth(0,0,-1,oPlayerWeapon);
p2w1 = instance_create_depth(0,0,-1,oPlayerWeapon);
p2w2 = instance_create_depth(0,0,-1,oPlayerWeapon);
#endregion

//Active player information
wpns = [p1w1, p1w2, p2w1, p2w2];
atb_full_array = [p1w1.atb_full,p1w2.atb_full,p2w1.atb_full,p2w2.atb_full];
num_active = 0;
selected = 0;

//state info
state = ChooseAction;

//Action menu
showing = p1w1;
action_menu = showing.action_menu;
action_hover = showing.action_hover;
xbuff = 10;
ybuff = 7;