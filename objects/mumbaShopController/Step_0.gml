if live_call() return live_result;

event_inherited();

var width=0, height=0;

for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] {
		owner=other;
		state=other.state;
	}
	with parentWindow {
		width=portWidth;
		height=portHeight;
		if ds_list_find_index(children, other.children[| i])<0 {
			ds_list_add(children, other.children[| i]);
		}
	}
}

var in=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS),
size=ds_list_size(menuItems)-1;
if in!=0 {
	currentSelection+=in;
	if currentSelection<0 currentSelection=size else if currentSelection>size currentSelection=0;
}

var ty=60;
for (var i=0; i<ds_list_size(menuItems); i++) {
	with menuItems[| i] {
		var tx=width-sprite_xoffset-10;
		if other.currentSelection==i {
			active=true;
			tx-=16;
		}
		targetX=tx;
		targetY=ty;
		ty+=sprite_height;
	}
}