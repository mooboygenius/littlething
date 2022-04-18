if live_call() return live_result;

var previousDepth=-9999,
previous=noone,
inst=noone;

repeat(20) {
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
}

if input(vk_f3, PRESS) && DEV_MODE {
	show_debug_message("instances from lowest to highest rendering:");
	for (var i=0; i<ds_list_size(children); i++) {
		var inst=children[| i];
		with inst {
			show_debug_message(concat("[", i, "] ", object_get_name(object_index), " ", id));
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
			other.cameraTargetY+=16;
		break;
	}
}
cameraSpeed=.2;
var ctx=clamp(cameraTargetX+portWidth div 2, cameraRightLimit+min(GAME_WIDTH, portWidth), cameraLeftLimit),
cty=clamp(cameraTargetY+portHeight div 2, cameraBottomLimit+min(GAME_HEIGHT, portHeight), cameraTopLimit);
cameraX=lerp(cameraX, ctx, cameraSpeed)+irandom_range(-cameraShake, cameraShake)+lengthdir_x(cameraKick, cameraKickDirection);
cameraY=lerp(cameraY, cty, cameraSpeed)+irandom_range(-cameraShake, cameraShake)+lengthdir_y(cameraKick, cameraKickDirection);
cameraShake=max(cameraShake-.1, 0);
cameraKick=max(cameraKick-.33, 0);
drawXOffset=cameraX;
drawYOffset=cameraY;

event_inherited();

var xo=4,
yo=10;
setWindowSize(self, -xo, -yo, GAME_WIDTH+xo*2+4, GAME_HEIGHT+yo+3);