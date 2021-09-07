//State
state = PlayerMainMove;
last_state = state;

//Movement
walk_spd_base = 2;
walk_spd = walk_spd_base;
walk_mod_base = 1;
walk_mod = walk_mod_base;
run_mod = 2;
xspeed = 0;
yspeed = 0;

//Interaction
check_half_width = 2;
interact_radius = 10;
interacting = false;

//Animation
if(global.LunaMain)
	sprite = CopyStruct(global.Luna.sprite);
else
	sprite = CopyStruct(global.Oscar.sprite);
image_speed = 0;
animation_frame = 0;
animation_spd_base = 1;
animation_spd = animation_spd_base;