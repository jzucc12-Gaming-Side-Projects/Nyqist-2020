//Initialize manager
var _oldState = global.gameState;
instance_create_depth(0,0,0,oOverworldManager);

//Check state
switch(_oldState)
{
	case "Combat":
	{
		//Despawn defeated
		ds_list_add(global.combatDespawnList,global.combatData.caller);
		for(var ii = 0; ii < ds_list_size(global.combatDespawnList); ii++)
		{
			with(global.combatDespawnList[| ii])
				instance_destroy();
		}
		break;
	}
	case "Overworld":
	{
		ds_list_clear(global.combatDespawnList);
		break;
	}
	case "Menu":
	{
		break;
	}
	default:
		show_debug_message("Improper State input");
}