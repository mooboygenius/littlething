if live_call() return live_result;

event_inherited();

tileSet=tlsMumbaGrass;

generateLevelMapArray([
"",
"",
"",
"00000000002",
"",
"",
"",
"",
"",
"",
"11111111111111111111111111111111111111111",
"11111111111111111111111111111111111111111",
"11111111111111111111111111111111111111111",
"11111111111111111111111111111111111111111",
"11111111111111111111111111111111111111111",
"11111111111111111111111111111111111111111"
]);

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
back5=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	loops=true;
	sprite_index=sprMumbaPlainsSky;
	cameraXMultiplier=0;
}
with back2 {
	loops=true;
	sprite_index=sprMumbaPlainsHills;
	cameraXMultiplier=.1;
}
with back3 {
	loops=true;
	sprite_index=sprMumbaPlains1;
	cameraXMultiplier=.3;
}
with back4 {
	loops=true;
	sprite_index=sprMumbaPlains2;
	cameraXMultiplier=.4;
}
with back5 {
	loops=true;
	sprite_index=sprMumbaPlains3;
	cameraXMultiplier=.5;
}
ds_list_add(children, back1, back2, back3, back4, back5);

repeat(irandom_range(4, 6)) {
	var cloud=instance_create_depth(0, 0, 0, mumbaBeachCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaBeachClouds), GAME_HEIGHT*.5);
		drawX=random(other.tileSurfaceWidth)+sprite_get_xoffset(sprMumbaBeachClouds)+random(64);
	}
	ds_list_add(children, cloud);
}

ds_list_add(children, instance_create_depth(tileSurfaceWidth div 2, 124, depth-10, mumbaMovingPlatform));