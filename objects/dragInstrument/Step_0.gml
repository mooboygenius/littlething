if live_call() return live_result;

event_inherited();

var l=.8;
xstart=lerp(xstart, lerpX, l);
ystart=lerp(ystart, lerpY, l);
var inst=instance_position(getMouseX(), getMouseY(), instrument);
if input(mb_left, PRESS) {
	if !inst {
		if lerpX>0 && lerpY>0 {
			var ox=0, oy=0;
			with parentWindow {
				ox=portX;
				oy=portY;
			}
			if !inst {
				var d=depth-1;
				with parentWindow {
					d=depth+10;
					show_debug_message("huhh");
				}
				var inst=instance_create_depth(lerpX, lerpY, d, createObject);
				with parentWindow {
					ds_list_add(children, inst);
					ds_list_add(notes, inst);
				}
			}
		}
	} else {
		squish=-.5;
		instance_destroy(inst);
	}
}