function NPCWanderGrid(){
	
	dir = irandom(4);
	switch(dir)
	{
		case 0:
			xspeed = walk_spd;
			yspeed = 0;
			break;
		case 1:
			xspeed = 0;
			yspeed = -walk_spd;
			break;
		case 2:
			xspeed = -walk_spd;
			yspeed = 0;
			break;
		case 3:
			xspeed = 0;
			yspeed = walk_spd;
			break;
		case 4:
			xspeed = 0;
			yspeed = 0;
			break;
	}
	if(dir == 4)
		state = NPCStill;
	else
		state = NPCFixedMove;
}

function NPCStill(){
	still_count++;
	if(still_count >= still_max)
	{
		state = base_state;
		still_count = 0;
	}
	NPCAnimation(false);
}

function NPCLock(){
	moving = false;
	NPCAnimation(false);
}

function NPCWanderFree(){
	var _move = irandom(5);
	if(_move < 3)
	{
		direction = irandom(360);
		xspeed = lengthdir_x(walk_spd,direction);
		yspeed = lengthdir_y(walk_spd,direction);
		state = NPCFixedMove;
	}
	else
		state = NPCStill;
}

function NPCFixedMove(){
	//Collision
	var _collided = NPCCollision();
	var _move_mag = sqrt(power(xspeed,2) + power(yspeed,2));
	move_direction = point_direction(0,0,xspeed,yspeed);
	walked += _move_mag;
	moving = (_move_mag > 0) && (walked <= walk_distance);
	
	//Walk
	if(!moving)
	{
		walked = 0;
		state = NPCStill;
	}
	NPCAnimation(true);	
}

function NPCChase(){
	move_direction = point_direction(x,y,follow.x,follow.y);
	var _xbase = lengthdir_x(chase_spd,move_direction);
	var _ybase = lengthdir_y(chase_spd,move_direction);
	var _xfaster = lengthdir_x(distance,move_direction);
	var _yfaster = lengthdir_y(distance,move_direction);
	xspeed = _xbase+_xfaster*chase_faster;
	yspeed = _ybase+_yfaster*chase_faster;
	moving = true;
	NPCCollision();
	NPCAnimation(false);
}

function NPCReturn(){
	xspeed = 0;
	yspeed = 0;
	
	//Create path
	if(dynamic_path == -1)
		NewDynamicPath(global.mp_map,x,y,x_origin,y_origin);
	
	//Go to next path point or end path
	if (NextPathPoint())
	{
		state = base_state;
		path_delete(dynamic_path);
		dynamic_path = -1;
		moving = false;
	}
	else
		moving = true;

	//Move and animate
	mp_potential_step(x_goto,y_goto,walk_spd,false);
	move_direction = point_direction(x,y,x_goto,y_goto);
	NPCAnimation(false);
}
	
function NPCPathPatrol(){
	if(!patrol_active)
	{
		path_start(patrol,patrol_spd,patrol_action,patrol_absolute);
		patrol_active = true;
	}
	moving = true;
	move_direction = direction;
	NPCCollision();
	NPCAnimation(false);
}