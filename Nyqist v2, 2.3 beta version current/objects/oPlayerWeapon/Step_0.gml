atb_curr = min(100,atb_curr + wpn_stat.spd/FRAME_RATE*4);
if(atb_curr >= 100)
{
	atb_curr = 100;
	atb_full = true;
}
else
	atb_full = false;
	