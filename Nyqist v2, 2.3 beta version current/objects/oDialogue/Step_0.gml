//Progress text every frame
text_prog += text_spd;

//Show all text in box, show next box, or close text box
if(keyboard_check_pressed(vk_space))
{
	var _length = string_length(text[text_index]);
	if(text_prog < _length)
		text_prog = _length;
	else if(text_index < array_length(text)-1)
	{
		text_index++;
		text_prog = 0;
	}
	else
		instance_destroy();
}