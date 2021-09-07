#region//Enum
#macro D_TYPES 3
enum D_TYPE{
	heat = 0,
	cold = 1,
	shock = 2,
}

enum VULN{
	vuln = 1,
	dmg = 1,
	absorb = 2,
	res = -1,
	imm = -9999
}
#endregion

//Set up type array
function DTypeArray(_vuln){
	var _array = array_create(D_TYPES,0);
	for(var ii = 1; ii < argument_count; ii++)
		_array[argument[ii]] = _vuln;
	return _array;
}

//Checks to see if target is vulnerable, resistant, or immune to an attack
function CheckVuln(_attack, _vuln, _res, _immune, _absorb)
{
	//Check to see if attack damage is absorbed
	var _abs_check = DotArray(_absorb,_attack);
	if(_abs_check > 0)
		return -1;
	
	//Figure out net vulnerability
	var _combine = ElementWise(OP.add,_vuln,_res,_immune);
	var _result = DotArray(_combine,_attack);
	
	//Gets net vulnerability sign if not immune to any part of the attack
	if(abs(_result) <= D_TYPES)
		_result = sign(_result);

	//Returns damage multiplier
	return power(2,_result);
}