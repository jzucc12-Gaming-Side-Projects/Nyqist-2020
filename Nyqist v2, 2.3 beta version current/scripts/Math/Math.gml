//Operations
enum OP{
	add = 0,
	sub = 1,
	mult = 2,
	divide = 3,
	modulus = 4
}

function IsEven(_num){
	return (_num mod 2 == 0);
}
	
function DotArray(_array1, _array2){
	var _dotted = 0;
	if(array_length(_array1) == array_length(_array2))
	{
		for(var ii = 0; ii < array_length(_array1); ii++)
			_dotted += _array1[ii] * _array2[ii];
		return _dotted;
	}
	else
		show_debug_message("ARRAY SIZES DON'T MATCH");
}
	
function ElementWise(_operation){
	//Make array of argument arrays
	var _arrays = 0;
	for(var ii = 1; ii < argument_count; ii++)
		_arrays[ii-1] = argument[ii];
	
	//Determine elementwise array
	var _result = array_create(array_length(_arrays[0]),0);
	for(var ii = 0; ii < array_length(_arrays[0]); ii++)
	{
		for(var jj = 0; jj < array_length(_arrays); jj++)
		{
			if(jj == 0) //Sets result equal to first arrays entry
				_result[ii] = _arrays[jj][ii];
			else //Performs operation for subsequent entries
			{
				switch(_operation)
				{
					case OP.add:
						_result[ii] += _arrays[jj][ii];
						break;
					case OP.sub:
						_result[ii] -= _arrays[jj][ii];
						break;
					case OP.mult:
						_result[ii] *= _arrays[jj][ii];
						break;
					case OP.divide:
						_result[ii] /= _arrays[jj][ii];
						break;
					case OP.modulus:
						_result[ii] = _result[ii] mod _arrays[jj][ii];
						break;
					default:
						show_debug_message("INVALID OPERATION");
						break;
				}
			}
		}
	}
	return _result;
}