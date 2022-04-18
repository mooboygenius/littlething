if live_call() return live_result;

event_inherited();

banner=instance_create_depth(0, 0, depth-100, mumbaLSBanner);
tiles=instance_create_depth(0, 0, depth-10, mumbaLSFloor);

children=ds_list_create();
ds_list_add(children, banner, tiles);

enum mumbaLevelData {name, sprite, mapObject}
addLevel=function(name, sprite) {
	/// @function addLevel(name, sprite)
	return [name, sprite];
}

beachLevel=addLevel("Beginner Beach", sprLevelSelectPalmTree);
cityLevel=addLevel("Manic Metropolis", sprLevelSelectTower);
grassLevel=addLevel("Perilous Plain", sprLevelSelectFlower);

levels=[
[beachLevel],
[cityLevel, grassLevel]
];

for (var i=0; i<array_length(levels); i++) {
	for (var z=0; z<array_length(levels[i]); z++) {
		levels[i][z][mumbaLevelData.mapObject]=instance_create_depth(0, 0, depth-50, mumbaLSLevelCoin);
		with levels[i][z][mumbaLevelData.mapObject] {
			decorSprite=other.levels[i][z][mumbaLevelData.sprite];
		}
		ds_list_add(children, levels[i][z][mumbaLevelData.mapObject]);
	}
}