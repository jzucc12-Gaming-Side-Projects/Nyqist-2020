function CharacterAnimation(){
	//Animate Sprite
	var _oldsprite = sprite_index;
	if(moving)
	{
		sprite_index = sprite.move;
		direction = move_direction;
	}
	else
		sprite_index = sprite.idle;
	
	if(_oldsprite != sprite_index)
		animation_frame = 0;		
	var _sprite_frames = sprite_get_number(sprite_index)/4;
	
	animation_frame += 10/FRAME_RATE * animation_spd;
	if(animation_frame > _sprite_frames - 1)
			animation_frame = 0;
			
	image_index = DIRECTION_FACING*_sprite_frames + animation_frame;		
}

function NPCAnimation(_fixed){
	//Animate Sprite
	var _oldsprite = sprite_index;
	if(moving)
	{
		sprite_index = move_sprite;
		direction = move_direction;
	}
	else
		sprite_index = idle_sprite;
	
	if(_oldsprite != sprite_index)
		animation_frame = 0;		
	var _sprite_frames = sprite_get_number(sprite_index)/4;
	
	if(!_fixed)
	{
		animation_frame += 10/FRAME_RATE * animation_spd;
		if(animation_frame > _sprite_frames - 1)
				animation_frame = 0;
	}
	else
	{
		animation_frame = lerp(0,_sprite_frames,walked/walk_distance)*animation_spd;
		if(animation_frame > _sprite_frames - 1)
				animation_frame = 0;
	}
	image_index = DIRECTION_FACING*_sprite_frames + animation_frame;		
}