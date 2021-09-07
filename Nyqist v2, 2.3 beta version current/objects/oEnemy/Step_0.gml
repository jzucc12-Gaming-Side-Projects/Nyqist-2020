#region//Detection
#region//Detection set up
var _followx = follow.x;
var _followy = follow.y;
distance = distance_to_point(_followx,_followy);
if(state == NPCChase)
{
	hear_rad = hear_return;
	vision_rad = vision_return;
}
else
{
	hear_rad = hear_alert;
	vision_rad = vision_alert;
}
	
//Triangle points
p2x = x + lengthdir_x(vision_rad,direction + vision_angle);
p2y = y + lengthdir_y(vision_rad,direction + vision_angle);
p3x = x + lengthdir_x(vision_rad,direction - vision_angle);
p3y = y + lengthdir_y(vision_rad,direction - vision_angle);
#endregion

//Determine detection
var _hear_chase = point_in_circle(_followx,_followy,x,y,hear_rad);
var _vision_chase = point_in_triangle(_followx,_followy,x,y,p2x,p2y,p3x,p3y);
chase = will_chase && !stuck && (_hear_chase || _vision_chase);
leash = leash_base / !chase;

#region//Handle detection
if(chase && CheckTileInPath(global.collisionMap,_followx,_followy))
{
	state = NPCChase;
	
	//End patrol if one exists
	if(base_state == NPCPathPatrol)
	{
		patrol_active = false;
		path_end();
	}
}
else if(state == NPCChase && !chase)
{
	state = NPCReturn;
	dynamic_path = -1;
}
#endregion
#endregion

//Start combat if too close
if(!initiating && will_chase && point_in_circle(_followx,_followy,x,y,combat_radius))
{
	InitiateCombat();
	initiating = true;
}
else if(!initiating)
	event_inherited();