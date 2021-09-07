//Background and foes
data.DrawScenery();
NineSliceStretch(sTextBox,0,menu_y1,menu_x1,RES_HEIGHT,1);
NineSliceStretch(sTextBox,menu_x1,menu_y1,RES_WIDTH,RES_HEIGHT,1);
data.DrawEnemy();

#region //Action menu
if(showing.active)
{
	draw_set_font(fText2);
	for(var ii = 0; ii < array_length(showing.action_menu); ii++)
	{
		if(showing.action_hover == ii)
			draw_set_color(c_yellow);
		else
			draw_set_color(c_white);
		draw_text(menu_x1+xbuff,menu_y1+ybuff+(string_height("M")*ii),showing.action_menu[ii][showing.action_horiz_option[ii]]);
	}
	#endregion
}