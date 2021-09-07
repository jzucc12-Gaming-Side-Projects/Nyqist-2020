var _old_selected = selected;
var _move = swap_move;
if(swap_move == 0)
	var _move = 1;
else
	var _move = swap_move;
do
{
	selected = Wrap(selected + _move, 0, array_length(wpns)-1);
}until(selected == _old_selected || wpns[selected].atb_full);