if live_call() return live_result;

event_inherited();

generateLevelMapArray([
"",
"",
"",
"",
"",
"002",
"",
"",
"0000001",
"000001100000!000000!000000!",
"0000111000000000000000000000000010000001",
"1111111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111",
"111111111111111111111111111111111111",
"1111111111111111111111111111111111",
"1111111111111111111111111111111111",
]);

generateMap();

generateLevelMapArray([
"",
"",
"",
"",
"",
"",
"",
"",
"000000001110000111111100001111",
"0",
"0",
"0",
"0",
"0",
"0",
"0",
]);

tileSet=tlsMumbaBeachPlanks;

generateMap();

back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBeachWater1);
back3=instance_create_depth(0, 0, 0, mumbaBeachWater2);
back4=instance_create_depth(0, 0, 0, mumbaBeachWater3);
with back1 {
	loops=true;
	sprite_index=sprMumbaBeachSky;
}
ds_list_add(children, back1, back2, back3, back4);

repeat(irandom_range(4, 6)) {
	var cloud=instance_create_depth(0, 0, 0, mumbaBeachCloud);
	with cloud {
		drawY+=random_range(0+sprite_get_yoffset(sprMumbaBeachClouds), GAME_HEIGHT*.5);
		drawX=random(other.tileSurfaceWidth)+sprite_get_xoffset(sprMumbaBeachClouds)+random(64);
	}
	ds_list_add(children, cloud);
}

/*back1=instance_create_depth(0, 0, 0, mumbaBackground);
back2=instance_create_depth(0, 0, 0, mumbaBackground);
back3=instance_create_depth(0, 0, 0, mumbaBackground);
back4=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 {
	cameraXMultiplier=0;
	loops=true;
	sprite_index=sprMumbaCitySky;
}
with back2 {
	cameraXMultiplier=.2;
	loops=true;
	sprite_index=sprMumbaCity1;
}
with back3 {
	cameraXMultiplier=.4;
	loops=true;
	sprite_index=sprMumbaCity2;
}
with back4 {
	cameraXMultiplier=.6;
	loops=true;
	sprite_index=sprMumbaCity3;
}
ds_list_add(children, back1, back2, back3, back4);