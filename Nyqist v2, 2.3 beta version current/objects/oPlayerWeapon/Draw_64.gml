//atb backdrop
if(active && atb_full)
	draw_set_color(c_green);
else if(atb_full)
	draw_set_color(c_red);
else
	draw_set_color(c_white);
draw_rectangle(x,y,x+atb_width,y+atb_height,0);

//atb fill
if(!atb_full)
{
	draw_set_color(c_yellow);
	atb_fill = lerp(0,atb_width,atb_curr/atb_max);
	draw_rectangle(x,y,x+atb_fill,y+atb_height,0);
}