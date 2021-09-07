function PlayerFollowMove(){
	//Execute Movement
	xspeed = dx*moving*walk_spd;
	yspeed = dy*moving*walk_spd;
	PlayerCollision();
	CharacterAnimation();
}
	
function PlayerFollowLock(){
	moving = false;
	CharacterAnimation();
}

function PlayerFollowStuck(){
	xspeed = 0;
	yspeed = 0;
	
	//Create path
	if(dynamic_path == -1 || path_counter == path_count_max)
	{
		NewDynamicPath(global.mp_map,x,y,oPlayerMain.x,oPlayerMain.y);
		path_counter = 0;
	}
	else
		path_counter++;
	
	//Go to next path point or end path
	if (!moving || NextPathPoint())
	{
		state = last_state;
		path_delete(dynamic_path);
		dynamic_path = -1;
	}

	//Move and animate
	var _spd = sqrt(power(dx,2) + power(dy,2))*walk_spd;
	mp_potential_step(x_goto,y_goto,_spd,false);
	move_direction = point_direction(x,y,x_goto,y_goto);
	CharacterAnimation();
}