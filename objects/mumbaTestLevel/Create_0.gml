if live_call() return live_result;

event_inherited();

generateLevelMapArray([
"                        ",
"                        ",
"                        ",
"S                       ",
"                        ",
"1111    11111111????1111",
"                        ",
"                        ",
"                        ",
"1111????11111111    1111",
"R                      R",
"R          2           R",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111"
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

spawner=instance_create_depth(tileSurfaceWidth/2, 0, depth, mumbaEnemySpawner);
with spawner {
	normalWaves=[
	[mumbaAngel]
	];

	hardWaves=[
	[mumbaAngel]
	]
	spawnTimerMinimum=300;
	spawnTimerMaximum=420;
}
ds_list_add(children, spawner);