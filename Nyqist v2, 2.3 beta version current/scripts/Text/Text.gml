#region//enums
enum SPEAKER{
	luna = 0,
	oscar = 1,
	npc = 2,
	ozy = 3,
	mask = 4
}

enum FACE{
	normal = 0,
	happy = 1,
	sad = 2,
	angry = 3,
	laugh = 4
}
#endregion

function MakeTextBox(_boxprop, _speakerprop, _string){	
	//Determine object type
	if(!is_array(_string))
		var _obj = oDialogue;
	else
		var _obj = oResponse;
		
	//Create box
	with(instance_create_depth(0,0,0,_obj))
	{
		var _id = id;
		
		//Textbox properties
		font = _boxprop[0];
		if(_boxprop[1] != -1)
			halign = _boxprop[1];
		else if(_obj == oResponse)
			halign = fa_center;
		else
			halign = fa_left;
		valign = _boxprop[2];
		
		//Speaker properties
		speaker = _speakerprop[0];
		face = _speakerprop[1];
		color = _speakerprop[2];
		
		//Text properties
		draw_set_font(font);
		text_original = _string;
		text_height = string_height("M");
		rows = floor(box_height/text_height);
		ybuff = box_edge_H + (box_height - text_height*rows)*0.5;
		
		//Extra for Dialogue option
		if(_obj == oDialogue)
		{
			text_spd *= _boxprop[3];
			text_broken = BreakUpText(text_original, box_width);
			text = TextToArray(text_broken);
		}
	}
	return _id;
}

function BoxProp(){
	//Set default
	var _font = fText;
	var _halign = -1; //-1 used for variable default values
	var _valign = fa_top;
	var _spd = 1;
	
	//Change as needed
	for(var ii = 0; ii < argument_count; ii++)
	{
		if(is_string(argument[ii]))
		{
			switch(argument[ii])
			{
				case "top":
					_valign = fa_top;
					break;
				case "middle":
					_valign = fa_middle;
					break;
				case "bottom":
					_valign = fa_bottom;
					break;
				case "left":
					_halign = fa_left;
					break;
				case "center":
					_halign = fa_center;
					break;
				case "right":
					_halign = fa_right;
					break;
				default:
					show_debug_message("Improper text box property STRING input");
					break;
			}
		}
		else if(is_real(argument[ii]) && argument[ii] > 0)
			_spd = argument[ii];
		else if(asset_get_type(font_get_name(argument[ii])) == asset_font)
			_font = argument[ii];
		else
			show_debug_message("Improper text box property input");
		
	}
	return [_font,_halign,_valign,_spd];
}

function SetText(_font, _halign, _valign, _color){
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_color(_color);
	draw_set_font(_font);
}

function BreakUpText(_string, _width){
	//Set Variables
	var _current_pos = 0;
	var _start_pos = 0;
	var _current = 0;
	
	//Make breaks
	if(string_char_at(_string,string_length(_string)) != " ")
		_string = string_insert(" ",_string,string_length(_string)+1);
		
	do
	{
		//Find space to use as potential breakpoint
		_current_pos = string_pos_ext(" ",_string,_start_pos);
		_current = string_copy(_string,1,_current_pos);

		//Create break if current space goes beyond box limit
		if(string_width(_current) >= _width - 1)
		{
			_string = string_insert("\n",_string,_start_pos);
			_string = string_replace(_string,"\n ","\n");
		}
		_start_pos = _current_pos;
	}
	until(_current_pos = 0)
	
	return _string;
}

function TextToArray(_string){
	//Set variables
	var _start_pos = 0;
	var _current_pos = 0;
	var _breaks = string_count("\n",_string);
	var _index = 0;
	var _string_array = 0;
	
	//Save filled text box every third line break
	for(var ii = 1; ii <= _breaks; ii++)
	{
		_current_pos = string_pos_ext("\n",_string,_start_pos);
		if(ii mod rows == 0)
		{
			_string_array[_index] = string_copy(_string,1,_current_pos);
			_index++;
			_string = string_delete(_string,1,_current_pos);
			_current_pos = 0;
		}
		_start_pos = _current_pos;
	}
	_string_array[_index] = _string;
	
	return _string_array;
}
		
function ChooseConversation(_options,_events){
	var _choice = _options[0];
	
	//Choose conversation
	if(array_length(_options) > 1)
	{
		for(var ii = 0; ii < array_length(_events); ii++)
		{
			if(_events[ii])
				_choice = _options[ii+1]
		}
	}
	
	//Choose primary speaker if applicable
	if(array_length(_choice) > 1)
		_choice = _choice[!global.LunaMain];
	else
		_choice = _choice[0];
	
	return _choice;
}	
	
function SpeakerProp(){
	//Use NPC if no arguments, otherwise use speaker and face input
	if(argument_count == 0)
	{
		var _speaker = SPEAKER.npc;
		var _face = face_sprite;
		var _color = text_color;
	}
	else
	{
		var _speaker_enum = argument[0];
		var _face_enum = argument[1];
		var _speaker = -1;
		var _face = -1;
		var _color = -1;
		
		switch(_speaker_enum)
		{
			case SPEAKER.luna:
				_speaker = CopyStruct(global.Luna.text);
				break;
			case SPEAKER.oscar:
				_speaker = CopyStruct(global.Oscar.text);
				break;
			case SPEAKER.ozy:
			case SPEAKER.mask:
				_speaker = -1; //Fill in later
				break;			
			default:
				show_debug_message("WRONG SPEAKER");
				break;
		}

		_face = _speaker.face[_face_enum];
		_color = _speaker.col;
	}
	
	return[_speaker,_face,_color];
}