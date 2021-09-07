function ChooseAction(){
	
	#region//Swapping selected and action taking
	//Check which weapons are available
	atb_full_array = [p1w1.atb_full,p1w2.atb_full,p2w1.atb_full,p2w2.atb_full];
	for(var ii = 0; ii < array_length(atb_full_array); ii++)
		num_active += atb_full_array[ii];

	//Change selection to active weapon if currently on inactive weapon
	if(num_active > 0 && !atb_full_array[selected])
		alarm[0] = 1;

	//Swapping selected weapon
	if(swap_move != 0 && num_active > 1)
		alarm[0] = 1;

	//Set active weapon
	for(var ii = 0; ii < array_length(wpns); ii++)
	{
		if(ii == selected)
			wpns[ii].active = true;
		else
			wpns[ii].active = false;
	}

	//Select Action
	if(action && wpns[selected].atb_full)
	{
		//Determine next state
		wpns[selected].active = false;
		wpns[selected].atb_curr = 0;
		alarm[0] = 1;
	}
	
	var _old_showing = showing;
	showing = wpns[selected];
	if(!global.Recall && _old_showing != showing)
	{
		showing.action_hover = 0;
		showing.action_horiz_option = [0,0,0,0];
	}
	
	#region//Action menu navigation
	showing.action_hover = Wrap(showing.action_hover + move_vert,0,array_length(showing.action_menu)-1);
	showing.action_horiz_option[showing.action_hover] = Wrap(showing.action_horiz_option[showing.action_hover] + move_horiz,0,array_length(showing.action_menu[showing.action_hover])-1);
	#endregion
	#endregion
}