switch(transition_type)
{
	case TRANSITION_TYPE.FADE:
		draw_set_color(c_black);
		draw_set_alpha(transition_percent);
		draw_rectangle(0,0,width,height,false);
		break;
	
	default:
		draw_set_color(c_red);
		draw_rectangle(0,0,width,height,false);
		break;
}

draw_set_alpha(1);