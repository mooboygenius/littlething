if live_call() return live_result;

event_inherited();

//tileSet=tlsMumbaBlank;

generateLevelMapArray([
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"                        ",
"  2                     ",
"                        ",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111",
"111111111111111111111111",
]);

generateMap();

//ds_list_add(children, instance_create_depth(tileSurfaceWidth div 2, tileSurfaceHeight div 2, -10, mumbaBoss));

back1=instance_create_depth(0, 0, 0, mumbaBackground);
with back1 loops=true;
ds_list_add(children, back1, instance_create_depth(0, 0, 0, mumbaSwapBlockController));