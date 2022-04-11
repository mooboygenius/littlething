if live_call() return live_result;

var previousDepth=-9999,
previous=noone,
inst=noone;

for (var i=0; i<ds_list_size(children); i++) {
	var d=0,
	prevDepth=0;
	if i>0 {
		with children[| i] d=depth;
		with children[| i-1] prevDepth=depth;
		if d>prevDepth {
			var previousInst=children[| i-1];
			ds_list_set(children, i-1, children[| i]);
			ds_list_set(children, i, previousInst);
		}
	}
}

for (var i=0; i<ds_list_size(children); i++) {
	var d=0;
	with children[| i] d=depth;
}

with cameraFocus {
	other.cameraTargetX=-x;
	other.cameraTargetY=-y;
	
	switch object_index {
		case mumbaPlayer:
			other.cameraTargetX-=48*sign(xScale);
		break;
	}
}
cameraSpeed=.05;
cameraTargetX+=portWidth/2;
cameraTargetY+=portHeight/1.5;
cameraX=lerp(cameraX, cameraTargetX, cameraSpeed)+irandom_range(-cameraShake, cameraShake)+lengthdir_x(cameraKick, cameraKickDirection);
cameraY=lerp(cameraY, cameraTargetY, cameraSpeed)+irandom_range(-cameraShake, cameraShake)+lengthdir_y(cameraKick, cameraKickDirection);
cameraShake=max(cameraShake-.1, 0);
cameraKick=max(cameraKick-.33, 0);
drawXOffset=cameraX;
drawYOffset=cameraY;

event_inherited();

var xo=4,
yo=10;
setWindowSize(self, -xo, -yo, GAME_WIDTH+xo*2+4, GAME_HEIGHT+yo+3);