//Swap sprite
if(keyboard_check_pressed(ord("O")) && instance_exists(oPlayerFollow))
{
	if(oPlayerMain.state != PlayerMainLock)
	{
		global.LunaMain = !global.LunaMain;
		with(oPlayerMain)
		{
			if(global.LunaMain)
				sprite = CopyStruct(global.Luna.sprite);
			else
				sprite = CopyStruct(global.Oscar.sprite);
			var _x_temp = x;
			var _y_temp = y;
			x = oPlayerFollow.x
			y = oPlayerFollow.y;
			direction = oPlayerFollow.direction;
		}
		with(oPlayerFollow)
		{
			if(global.LunaMain)
				sprite = CopyStruct(global.Oscar.sprite);
			else
				sprite = CopyStruct(global.Luna.sprite);
			x = _x_temp;
			y = _y_temp;
			dx = oPlayerMain.x - x;
			dy = oPlayerMain.y - y;
			direction = point_direction(0,0,dx,dy);
		}
	}
}