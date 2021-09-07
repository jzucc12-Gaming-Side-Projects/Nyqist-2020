//debug drawing
if(global.debug)
{
	draw_circle_color(x,y,boundary,c_blue,c_blue,true);
	
	if(dynamic_path != -1)
	{
		draw_set_color(c_white);
		draw_path(dynamic_path, x, y, true); 
	}
}