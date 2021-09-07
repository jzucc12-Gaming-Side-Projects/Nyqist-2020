//debug drawings
if(global.debug)
{
	var _xdiff = x+lengthdir_x(interact_radius,direction);
	var _ydiff = y+lengthdir_y(interact_radius,direction);
	draw_set_color(c_white);
	draw_rectangle(_xdiff-check_half_width,_ydiff-check_half_width,
				   _xdiff+check_half_width,_ydiff+check_half_width,false);
}