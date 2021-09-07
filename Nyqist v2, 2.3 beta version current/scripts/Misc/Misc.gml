function CopyStruct(_struct){
	//Create dummy struct
	var _new_struct = {
	}
	
	//Determine variables in old struct
	var _struct_names = variable_struct_get_names(_struct);
	
	//Copy all variables into the dummy struct
	for(var jj = 0; jj < variable_struct_names_count(_struct); jj++)
	{
		var _copied_val = variable_struct_get(_struct,_struct_names[jj]);
		variable_struct_set(_new_struct,_struct_names[jj],_copied_val);
	}
	return _new_struct;
}

function Wrap(_variable, _minimum, _maximum){
//Integer cases
if(_variable % 1 == 0)
{
	while(_variable > _maximum || _variable < _minimum)
	{
		if(_variable > _maximum)
			_variable = _minimum + _variable - _maximum - 1;
			
		else if(_variable < _minimum)
			_variable = _maximum + _variable - _minimum + 1;
			
		else _variable = _variable;
	}
	return(_variable);
}

//Non-integer cases
else
{
	var _old = _variable;
	do
	{
		_old = _variable;
		if(_variable < _minimum)
			_variable = _maximum - (_minimum - _variable);
		
		else if(_variable > _maximum)
			_variable = _minimum + (_variable - _maximum);
		
		else
			_variable = _variable;
	} until(_variable != _old)
	return _variable;
}
}