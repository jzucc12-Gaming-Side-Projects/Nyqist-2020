function CombatData(_ground,_sky, _music, _enemy,_caller) constructor{
	ground = _ground;
	sky = _sky;
	music = _music;
	enemy = _enemy;
	caller = _caller;
	
	function DrawScenery(){
		draw_set_color(sky);
		draw_rectangle(0,0,RES_WIDTH,RES_HEIGHT,false);
		draw_set_color(ground);
		draw_rectangle(0,RES_HEIGHT*0.67,RES_WIDTH,RES_HEIGHT,false);
	}
	
	function LoadEnemy()
	{
		var _num = array_length(enemy);
		if(_num > 0)
		{
			for(var ii = 0; ii < _num; ii++)
				enemy[ii] = instance_create_depth(0,0,0,enemy[ii]);
		}
		else
			enemy = instance_create_depth(0,0,0,enemy);
			
	}
	
	function DrawEnemy(){
		var _ystart = 1/3*.66;
		var _ymod = _ystart;
		var _num = array_length(enemy);
		if(_num > 0)
		{
			switch(_num)
			{
				case 3:
					_ymod = _ystart/2;
					break;
				case 4: 
					_ystart = 0.2*.66;
					_ymod = _ystart;
					break;
				case 5:
					_ystart = 1/6*.66;
					_ymod = _ystart;
					break;
			}
			for(var ii = 0; ii < _num; ii++)
			{
				if(!IsEven(_num))
					var _xpos = RES_WIDTH * (.2 + .1 * !IsEven(ii));
				else
					var _xpos = RES_WIDTH * 0.2;
				var _ypos = RES_HEIGHT * (_ystart + _ymod*ii);
				draw_sprite_ext(enemy[ii].sprite,-1,_xpos,_ypos,2,2,0,-1,1);
			}
		}
		else
			draw_sprite_ext(enemy.sprite,0,RES_WIDTH/4,RES_HEIGHT/2*.66,2,2,0,-1,1);
	}
}

function CombatBox(_boxprop, _speakerprop, _string){
	with(instance_create_depth(0,0,0,oResponse))
	{
		//Textbox properties
		font = _boxprop[0];
		if(_boxprop[1] != -1)
			halign = _boxprop[1];
		else if(_obj == oResponse)
			halign = fa_center;
		else
			halign = fa_left;
		valign = _boxprop[2];
		
		//Text properties
		draw_set_font(font);
		text_original = _string;
		text_height = string_height("M");
		rows = floor(box_height/text_height);
		ybuff = box_edge_H + (box_height - text_height*rows)*0.5;
	}
}