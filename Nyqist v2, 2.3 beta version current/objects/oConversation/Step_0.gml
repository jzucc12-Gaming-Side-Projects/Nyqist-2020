var _box_exist = instance_exists(oDialogue) || instance_exists(oResponse);

if(!_box_exist && box_no < array_length(conversation[branch]))
{
	if(conversation[branch][box_no][0] == -1)
	{
		with(caller)
			script_execute(other.conversation[other.branch][other.box_no][1]);
	}
	else
	{
		MakeTextBox(conversation[branch][box_no][0], conversation[branch][box_no][1],
					conversation[branch][box_no][2]);
	}
	box_no++;
}
else if(!_box_exist && !(box_no < array_length(conversation)))
	instance_destroy();
