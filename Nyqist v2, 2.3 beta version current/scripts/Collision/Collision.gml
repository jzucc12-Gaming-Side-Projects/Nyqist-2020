function TileCollide(_map, _pos, _diff){
	var _collision = false;

	if(_pos == "x")
	{
		//Horizontal
		if(tilemap_get_at_pixel(_map,x + _diff,y))
		{
			x -= x mod TILE_SIZE;
			if(sign(_diff) == 1)
				x += TILE_SIZE - 1;
			_collision = true;
			xspeed = 0;
		}
	}
	else if(_pos == "y")
	{
		//Vertical
		if(tilemap_get_at_pixel(_map,x,y + _diff))
		{
			y -= y mod TILE_SIZE;
			if(sign(_diff) == 1)
				y += TILE_SIZE - 1;
			_collision = true;
			yspeed = 0;
		}		
	}
	else if(_pos == "d")
	{
		//Diagonal
		if(tilemap_get_at_pixel(global.collisionMap,x+xspeed,y+yspeed))
		{
		
			if(DIRECTION_FACING == 0 || DIRECTION_FACING == 2)
				yspeed = 0;
			else
				xspeed = 0;
		}
	}
	else
		show_debug_message("Incorrect collision tile input");
	
	return _collision;
}

function ObjectCollide(_obj, _pos, _diff){
	var _collision = false;
	var _collision_list = ds_list_create();
	
	if(_pos == "x")
	{
		//Horizontal
		instance_position_list(x+_diff,y,_obj,_collision_list,false)
		while(!ds_list_empty(_collision_list))
		{
			var _collided_with = _collision_list[| 0];
			if(_collided_with.can_collide)
			{
				if(sign(_diff) == 1)
					x = _collided_with.bbox_left - 1;
				else if(sign(_diff) == -1)
					x = _collided_with.bbox_right + 1;

				xspeed = 0;
				_collision = true;
				ds_list_clear(_collision_list);
			}
			else
				ds_list_delete(_collision_list,0);
		}
	}
	else if(_pos == "y")
	{
		//Vertical
		instance_position_list(x,y+_diff,_obj,_collision_list,false)
		while(!ds_list_empty(_collision_list))
		{
			var _collided_with = _collision_list[| 0];
			if(_collided_with.can_collide)
			{
				if(sign(_diff) == 1)
					y = _collided_with.bbox_top - 1;
				else if(sign(_diff) == -1)
					y = _collided_with.bbox_bottom + 1;
			
				yspeed = 0;
				_collision = true;
				ds_list_clear(_collision_list);
			}
			else
				ds_list_delete(_collision_list,0);
		}
	}
	else if(_pos == "d")
	{
		//Diagonal
		instance_position_list(x+xspeed,y+yspeed,_obj,_collision_list,false)
		while(!ds_list_empty(_collision_list))
		{
			var _collided_with = _collision_list[| 0];
			if(_collided_with.can_collide)
			{
				if(DIRECTION_FACING == 0 || DIRECTION_FACING == 2)
					yspeed = 0;
				else
					xspeed = 0;

				_collision = true;
				ds_list_clear(_collision_list);
			}
			else
				ds_list_delete(_collision_list,0);
		}
	}
	else
		show_debug_message("Incorrect collision object input");
		
	ds_list_destroy(_collision_list);
	return _collision;
}

function PlayerCollide(_obj){
	var _collisionx = false;
	var _collisiony = false;
	var colX = _obj.x;
	var colY = _obj.y;
	
	if(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,_obj,false,true))
	{
		//Horizontal
		if(colX <= bbox_left && xspeed < 0)
		{
			xspeed = 0;
			if(colX == bbox_left)
				x++;
			_collisionx = true;
		}
		else if(colX >= bbox_right && xspeed > 0)
		{
			xspeed = 0;
			if(colX == bbox_right)
				x--;
			_collisionx = true;
		}

		//Vertical
		if(colY <= bbox_top && yspeed < 0)
		{
			yspeed = 0;
			if(colY == bbox_top)
				y++;
			_collisiony = true;
		}
		else if(colY >= bbox_bottom && yspeed > 0)
		{
			yspeed = 0;
			if(colY == bbox_bottom)
				y--;
			_collisiony = true;
		}
	}
	return [_collisionx, _collisiony];
}

function PlayerCollision(){
	
	var _collisionx = false;
	var _collisiony = false;
	var _collisiond = false;
	
	//Horizontal
	_collisionx = TileCollide(global.collisionMap,"x",xspeed) || ObjectCollide(oInteract,"x",xspeed);
	
	//Vertical
	_collisiony = TileCollide(global.collisionMap,"y",yspeed) || ObjectCollide(oInteract,"y",yspeed);
	
	//Diagonal
	_collisiond = TileCollide(global.collisionMap,"d",-1) || ObjectCollide(oInteract,"d",-1);
	
	//Move
	x += xspeed;
	y += yspeed;
	
	//Stuck state for following player
	var _stuckx = (_collisionx && abs(yspeed) < .1);
	var _stucky = (_collisiony && abs(xspeed) < .1);
	if((state == PlayerFollowMove) && (_stuckx || _stucky))
	{
		last_state = state;
		state = PlayerFollowStuck;
	}
	
	return (_collisionx || _collisiony || _collisiond);
}

function NPCCollision(){
	
	var _collisionx = false;
	var _collisiony = false;
	var _collisiond = false;
	
	//Player collision
	if(can_collide)
	{
		var _tempMain = PlayerCollide(oPlayerMain);
		var _tempFollow = PlayerCollide(oPlayerFollow);
		_collisionx = _tempMain[0] || _tempFollow[0];
		_collisiony = _tempMain[1] || _tempFollow[1];
	}
	
	#region//Horizontal
	//Leash
	var _dx = abs((x + xspeed) - x_origin);
	if(leashed && _dx > leash)
	{
		if(walked == 0)
			xspeed = -xspeed;
		else
		{
			x = x_origin + leash * sign(xspeed);
			xspeed = 0;
			_collisionx = true;
		}
	}
	
	//Tile collision
	_collisionx = _collisionx || TileCollide(global.collisionMap,"x",xspeed);
	#endregion
	
	#region//Vertical

	//Leash
	var _dy = abs((y + yspeed) - y_origin);
	if(leashed && _dy > leash)
	{
		if(walked == 0)
			yspeed = -yspeed;
		else
		{
			y = y_origin + leash * sign(yspeed);
			yspeed = 0;
			_collisiony = true;
		}
	}
	
	//Tile collision
	_collisiony = _collisiony || TileCollide(global.collisionMap,"y",yspeed);
	#endregion
	
	//Diagonal
	_collisiond = TileCollide(global.collisionMap,"d", -1);
	
	//Move
	x += xspeed;
	y += yspeed;

	var _stuckx = (_collisionx && abs(yspeed) < .1);
	var _stucky = (_collisiony && abs(xspeed) < .1);
	if((state == NPCChase) && (_stuckx || _stucky))
	{
		show_debug_message(stuck_count);
		if(stuck_count > stuck_max)
		{
			stuck_count = 0;
			stuck = true;
		}
		else
		{
			stuck_count++;
			stuck = false;
		}
	}
	else
		stuck = false;

	return (_collisionx || _collisiony || _collisiond);
}
	
function NewDynamicPath(_map,_xstart,_ystart,_xgoal,_ygoal){
	dynamic_path = path_add();
	mp_grid_path(_map,dynamic_path,_xstart,_ystart,_xgoal,_ygoal,true);
	path_set_kind(dynamic_path, 1);
	path_set_precision(dynamic_path, 8);
		
	point_no = 1;
	x_goto = path_get_point_x(dynamic_path,point_no);
	y_goto = path_get_point_y(dynamic_path,point_no);	
}

function NextPathPoint(){
	if (point_distance(x,y,x_goto,y_goto) < next_point)
	{
		if (++point_no == path_get_number(dynamic_path))
			return true;
		else
		{
			x_goto = path_get_point_x(dynamic_path,point_no);
			y_goto = path_get_point_y(dynamic_path,point_no); 
			return false;
		}
	}
}
	
function CheckTileInPath(_map,_x,_y){
	var _check = path_add();
	var _in_path = false;
	mp_linear_path(_check,_x,_y,1,false);
	for(var ii = 0; ii < path_get_number(_check); ii++)
	{
		if(tilemap_get_at_pixel(_map,path_get_point_x(_check,ii),path_get_point_y(_check,ii)))
			_in_path = true;
	}
	path_delete(_check);
	return !_in_path;
}