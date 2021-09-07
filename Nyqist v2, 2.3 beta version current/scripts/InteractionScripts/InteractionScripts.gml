function InteractConversation(){
	if(change_face)
	{
		direction = point_direction(x,y,other.x,other.y);
		image_index = DIRECTION_FACING;
	}
	state = NPCLock;
	with(instance_create_depth(0,0,0,oConversation))
	{
		caller = other.id;
		conversation = ChooseConversation(caller.converse_options, caller.flags);
	}
}

function InitiateCombat(){
	global.paused = true;
	global.combatData = combat_data;
	with(instance_create_depth(oPlayerMain.x-1,oPlayerMain.y-1,0,oRoomChange))
	{
		new_room = rCombat_Parent;
		combat = true;
		transition = true;
	}
}