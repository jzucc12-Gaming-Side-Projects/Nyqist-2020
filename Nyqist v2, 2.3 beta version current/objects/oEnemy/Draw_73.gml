//debug drawing
if(global.debug)
{
	draw_set_color(c_purple);
	draw_circle(x,y,combat_radius,true);
	draw_set_color(c_red);
	draw_circle(x,y,hear_rad,true);
	draw_set_color(c_yellow);
	draw_triangle(x,y,p2x,p2y,p3x,p3y,true);

	
	if(dynamic_path != -1)
	{
		draw_set_color(c_white);
		draw_path(dynamic_path, x, y, true); 
	}
}