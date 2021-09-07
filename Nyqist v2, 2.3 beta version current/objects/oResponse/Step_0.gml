down = keyboard_check_pressed(ord("S"));
up = keyboard_check_pressed(ord("W"));
down_hold = keyboard_check(ord("S"));
up_hold = keyboard_check(ord("W"));
choice = keyboard_check_pressed(vk_space);
dir_hold = down_hold - up_hold;
dir = down - up;

if((buff_current == move_buff && dir_hold != 0) || dir != 0)
{
	buff_current = 0;
	var _move = sign(dir_hold + dir);
	if(cursor + _move < 0)
		cursor = array_length(text_original) -1;
	else if(cursor + _move > array_length(text_original) - 1)
		cursor = 0;
	else
		cursor += _move;
}
else
	buff_current = min(buff_current+1,move_buff);
	
if(choice)
	instance_destroy();
	
