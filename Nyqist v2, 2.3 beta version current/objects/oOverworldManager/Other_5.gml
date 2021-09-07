if(global.collisionMap != -1)
{
	layer_tilemap_destroy(global.collisionMap);
	mp_grid_destroy(global.mp_map);
}