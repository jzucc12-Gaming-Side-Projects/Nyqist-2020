//Determine destination
if(instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Set new position
x += (xTo - x)/move_spd;
y += (yTo - y)/move_spd;

//Keep camera in room
x = clamp(x,view_width_half,room_width - view_width_half);
y = clamp(y,view_height_half,room_height - view_height_half);

//Move Camera
camera_set_view_pos(camera,x - view_width_half,y - view_height_half);