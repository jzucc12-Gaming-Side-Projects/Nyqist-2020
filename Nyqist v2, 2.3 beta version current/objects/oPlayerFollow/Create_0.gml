//State
state = PlayerFollowMove;
last_state = state;

//Movement
boundary = TILE_SIZE-1;
walk_spd_base = 2/FRAME_RATE;
walk_spd = walk_spd_base;
walk_mod_base = 1;
walk_mod = walk_mod_base;
run_mod = 2;

//Pathing
dynamic_path = -1;
next_point = 2;
x_goto = -1;
y_goto = -1;
path_counter = 0;
path_count_max = FRAME_RATE/2.5;

//Animation
if(global.LunaMain)
	sprite = CopyStruct(global.Oscar.sprite);
else
	sprite = CopyStruct(global.Luna.sprite);
image_speed = 0;
animation_frame = 0;
animation_spd_base = 1;
animation_spd = animation_spd_base;