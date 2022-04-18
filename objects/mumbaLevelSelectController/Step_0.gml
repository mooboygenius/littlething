if live_call() return live_result;

event_inherited();

for (var i=0; i<ds_list_size(children); i++) {
	var inst=children[| i];
	with parentWindow {
		if ds_list_find_index(children, inst)<0 {
			show_debug_message(concat("added #", i, " to parent window"));
			ds_list_insert(children, 0, inst);
		}
	}
}

var cx=100,
cy=100,
vo=64;
for (var i=0; i<array_length(levels); i++) {
	var l=array_length(levels[i]),
	thisY=cy;
	thisY-=((l-1)/2)*vo;
	for (var z=0; z<l; z++) {
		with levels[i][z][mumbaLevelData.mapObject] {
			x=cx;
			y=thisY;
			depth=-1000;
		}
		thisY+=vo;
	}
	cx+=128;
}

with parentWindow {
	cameraLeftLimit=0;
	cameraRightLimit=0;
	cameraTopLimit=0;
	cameraBottomLimit=0;
	cameraX=0;
	cameraY=0;
	targetX=0;
	targetY=0;
}