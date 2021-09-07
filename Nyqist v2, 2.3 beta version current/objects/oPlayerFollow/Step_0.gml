dx = oPlayerMain.x - x;
dy = oPlayerMain.y - y;
distance = sqrt(power(dx,2) + power(dy,2));

moving = (distance > boundary);
move_direction = point_direction(0,0,dx,dy);

if(!global.paused)
	script_execute(state);

depth = -bbox_bottom;