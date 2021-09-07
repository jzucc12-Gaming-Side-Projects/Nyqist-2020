function PlayerMainMove(){
	//Execute movement
	xspeed = lengthdir_x(walk_spd*moving,move_direction);
	yspeed = lengthdir_y(walk_spd*moving,move_direction);
	PlayerCollision();
	
	//Check for interaction
	if(interact && !interacting)
	{
		//Set up
		interactee = noone;
		var _x_radius = x+lengthdir_x(interact_radius,direction);
		var _y_radius = y+lengthdir_y(interact_radius,direction);
		var _check = ds_list_create();
		var _found = collision_rectangle_list(_x_radius-check_half_width,
											  _y_radius-check_half_width,
											  _x_radius+check_half_width,
											  _y_radius+check_half_width,
											  oInteract,false,true,_check,true);
		//Determine who to interact with
		while(_found > 0)
		{
			var _cur = _check[| --_found];
			if(_cur.interact_script != -1)
			{
				interactee = _cur;
				break;
			}
		}
		ds_list_destroy(_check);
		
		//Interact
		with(interactee)
		{
			other.interacting = true;
			script_execute(interact_script);
		}
	}
	
	//Animate
	CharacterAnimation();
}

function PlayerMainTransition(){
	PlayerCollision();
	CharacterAnimation();
}

function PlayerMainLock(){
	moving = false;
	CharacterAnimation();
}