var _ystart = y1 + ybuff;
var _drawY = _ystart;

event_inherited();
	
for(var ii = 0; ii < array_length(text_original); ii++)
{
	if(cursor == ii)
		draw_set_color(c_red);
	else
		draw_set_color(color);
	draw_text(x1+xbuff, _drawY,text_original[ii]);
	_drawY += text_height;
}