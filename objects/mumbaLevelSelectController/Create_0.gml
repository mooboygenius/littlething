if live_call() return live_result;

event_inherited();

banner=instance_create_depth(0, 0, depth-20, mumbaLSBanner);
bannerLower=instance_create_depth(0, 0, depth-1000, mumbaLSBanner);
with bannerLower {
	sprite_index=sprLevelSelectBannerUpsideDown;
	xOffset=sprite_width/2;
}
mumba=instance_create_depth(0, 0, depth-500, mumbaLSMumba);
tiles=instance_create_depth(0, 0, depth-1, mumbaLSFloor);
shadows=instance_create_depth(0, 0, depth-10, mumbaLSShadowController);

children=ds_list_create();
ds_list_add(children, banner, tiles, shadows, mumba, bannerLower);

enum mumbaLevelData {name, sprite, mapObject}
addLevel=function(name, sprite) {
	/// @function addLevel(name, sprite)
	return [name, sprite];
}

beachLevel=addLevel("Beginner Beach", sprLevelSelectPalmTree);
cityLevel=addLevel("Manic Metropolis", sprLevelSelectTower);
grassLevel=addLevel("Perilous Plain", sprLevelSelectFlower);
fireLevel=addLevel("Vicious Volcano", sprLevelSelectVolcano);
snowLevel=addLevel("Tense Tundra", sprLevelSelectSnowman);
heavenLevel=addLevel("Hazardous Heaven", sprLevelSelectHeaven);
tunnelLevel=addLevel("Turmoil Tunnels", sprLevelSelectRock);
bossLevel=addLevel("???", sprLevelSelectMystery);
deadEstateLevel=addLevel("Dead Estate", sprLevelSelectDeadEstate);

levels=[
[beachLevel],
[cityLevel, grassLevel],
[fireLevel, snowLevel],
[heavenLevel, tunnelLevel],
[bossLevel],
[deadEstateLevel]
];

for (var i=0; i<array_length(levels); i++) {
	for (var z=0; z<array_length(levels[i]); z++) {
		levels[i][z][mumbaLevelData.mapObject]=instance_create_depth(0, 0, depth-50, mumbaLSLevelCoin);
		var d=noone;
		with levels[i][z][mumbaLevelData.mapObject] {
			name=other.levels[i][z][mumbaLevelData.name];
			decorSprite=other.levels[i][z][mumbaLevelData.sprite];
			var spr=decorSprite;
			d=decor;
			with decor {
				sprite_index=spr;
			}
		}
		if instance_exists(d) {
			ds_list_add(children, d);
			show_debug_message("added decor");
		} else {
			show_debug_message("couldn't find decor");
		}
		
		ds_list_add(children, levels[i][z][mumbaLevelData.mapObject]);
	}
}

positionLevels=function() {
	/// @function positionLevels()
	var cx=100,
	cy=110,
	vo=64;
	for (var i=0; i<array_length(levels); i++) {
		var l=array_length(levels[i]),
		thisY=cy;
		thisY-=((l-1)/2)*vo;
		for (var z=0; z<l; z++) {
			with levels[i][z][mumbaLevelData.mapObject] {
				x=cx;
				y=thisY;
			}
			thisY+=vo;
		}
		cx+=128;
	}
}
positionLevels();

var gx=0, gy=0;

with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
	gx=x;
	gy=y;
}

with mumba {
	gotoX=gx;
	gotoY=gy;
	x=gotoX;
	y=gotoY;
}

var arr=[],
s=array_length(levels)-1;
for (var i=s; i>=0; i--) {
	// give transfer array to current level objects
	for (var z=0; z<array_length(levels[i]); z++) {
		with levels[i][z][mumbaLevelData.mapObject] {
			nextCoins=arr;
		}
	}
	
	// reset transfer array
	arr=[];
	
	// push current array's objects into transfer array
	for (var z=0; z<array_length(levels[i]); z++) {
		array_push(arr, levels[i][z][mumbaLevelData.mapObject]);
	}
	
	show_debug_message(concat("i ", i, ":"));
	for (var q=0; q<array_length(arr); q++) {
		show_debug_message(concat(arr[q]));
	}
	
	show_debug_message(concat("end;"));
}

with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
	active=true;
}