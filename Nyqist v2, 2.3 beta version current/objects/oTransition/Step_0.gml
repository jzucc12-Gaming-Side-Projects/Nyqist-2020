//Leaving the old room
if(exiting)
{
	transition_percent = min(1, transition_percent + transition_spd);
	if(transition_percent >= 1)
	{
		exiting = false;
		room_goto(new_room);
	}
}

//Entering the new room
else if(!exit_only)
{
	transition_percent = max(0, transition_percent - transition_spd);
	if(transition_percent <= 0)
	{
		with(oPlayerMain) state = PlayerMainMove;
		instance_destroy();
	}
}
else
	instance_destroy();