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
"              ^  ",
"1111111111111111111111111111111111111111111111",
"111111111111111111111111111111111111111",
"111111111111111111111111111111111111",
"1111111111111111111111111111111111",
"1111111111111111111111111111111111",
]);

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