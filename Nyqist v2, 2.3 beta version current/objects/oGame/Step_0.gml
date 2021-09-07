if(keyboard_check_pressed(ord("P")))
	global.paused = !global.paused;


#region//Resize screen
if(keyboard_check_pressed(187) && !window_get_fullscreen()) //Plus button
	scale *= d_scale;
if(keyboard_check_pressed(189)) //Minus button
	scale /= d_scale;

if(RES_WIDTH*scale >= display_get_width() || RES_HEIGHT*scale >= display_get_height())
	window_set_fullscreen(true);
else
{
	window_set_fullscreen(false);
	window_set_size(RES_WIDTH*scale,RES_HEIGHT*scale);
}
#endregion