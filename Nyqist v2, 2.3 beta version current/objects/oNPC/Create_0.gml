event_inherited();
image_speed = 0;

//Moving
moving = false;
xspeed = 0;
yspeed = 0;
dir = 0;
still_count = 0;
walked = 0;
x_origin = x;
y_origin = y;

//Animation
animation_frame = 0;
move_direction = -1;

//Stuck
stuck = false;
stuck_count = 0;
stuck_max = FRAME_RATE/3;

//Dynamic Pathing
mp_map = -1;
dynamic_path = -1;
x_goto = -1;
y_goto = -1;
next_point = 2;