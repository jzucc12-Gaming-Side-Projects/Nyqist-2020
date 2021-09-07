//Check for room change
if(instance_exists(oPlayerMain) && position_meeting(oPlayerMain.x,oPlayerMain.y,id))
{
	if(!combat)
	{
		global.newRoom = new_room;
		global.newX = new_xpos;
		global.newY = new_ypos;
		global.newDir = oPlayerMain.direction;
	}
	else
	{
		global.newX = oPlayerMain.x;
		global.newY = oPlayerMain.y;
		global.newDir = oPlayerMain.direction;
	}
	
	if(transition)
	{
		if(!instance_exists(oTransition))
		{
			with(oPlayerMain) state = PlayerMainTransition;
		
			with(instance_create_depth(0,0,-999,oTransition))
			{
				transition_type = other.transition_type;
				transition_spd = other.transition_spd;
				new_room = other.new_room;
				exit_only = other.combat;
			}
		}
	}
	else
		room_goto(new_room);
	instance_destroy();
}