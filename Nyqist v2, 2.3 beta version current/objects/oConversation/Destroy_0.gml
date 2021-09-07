with(oPlayerMain)
{
	state = last_state;
	interacting = false;
}

if(caller != -1)
	caller.state = caller.base_state;