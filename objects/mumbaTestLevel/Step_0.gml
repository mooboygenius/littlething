if live_call() return live_result;

event_inherited();

if gameFrame%300==0 {
	var cloud=instance_create_depth(0, 0, 0, mumbaBeachCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaBeachClouds), GAME_HEIGHT*.5);
		drawX=other.tileSurfaceWidth+sprite_get_xoffset(sprMumbaBeachClouds)+random(64);
	}
	ds_list_add(children, cloud);
}