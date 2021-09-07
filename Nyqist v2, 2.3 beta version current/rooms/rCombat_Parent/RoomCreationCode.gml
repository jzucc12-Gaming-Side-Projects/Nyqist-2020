//Initialize manager
var _oldState = global.gameState;
instance_create_depth(0,0,0,oCombatManager);

//Check state
switch(_oldState)
{
	case "Combat":
	{
		break;
	}
	case "Overworld":
	{
		break;
	}
	case "Menu":
	{
		break;
	}
	default:
		show_debug_message("Improper State input");
}