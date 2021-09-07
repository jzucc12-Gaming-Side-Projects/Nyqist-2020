global.collisionMap = -1;
global.mp_map = -1;

if(layer_exists("Collision"))
{
	//set up collision map
	global.collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));
	layer_set_visible("Collision", false);
	
	//Set mp map
	var _tiles_x = room_width / TILE_SIZE;
	var _tiles_y = room_height / TILE_SIZE;
	global.mp_map = mp_grid_create(0,0,_tiles_x,_tiles_y,TILE_SIZE,TILE_SIZE);
	for (var ii = 0; ii < _tiles_x; ii++)
	{
		for (var jj = 0; jj < _tiles_y; jj++)
		{
			if(tilemap_get_at_pixel(global.collisionMap,TILE_SIZE*(ii+1/2),TILE_SIZE*(jj+1/2)))
				mp_grid_add_cell(global.mp_map,ii,jj);
		}
	}		
}
