if live_call() return live_result;

event_inherited();

var md=noteMode.normal;
if input(vk_shift) {
	md=noteMode.sharp;
} else if input(vk_control) {
	md=noteMode.flat;
}

var l=.8;
xstart=lerp(xstart, lerpX, l);
ystart=lerp(ystart, lerpY, l);
if point_in_rectangle(xstart, ystart, leftBorder, topBorder, rightBorder, bottomBorder) {
	switch md {
		case noteMode.normal:
			drawScript=function(x, y) {
				defaultDrawScript(x, y);
			}
		break;
	
		case noteMode.sharp:
			drawScript=function(x, y) {
				defaultDrawScript(x, y);
				draw_sprite(sprInstSharpIcon, 0, x+sprite_xoffset, y-sprite_yoffset);
			}
		break;
	
		case noteMode.flat:
			drawScript=function(x, y) {
				defaultDrawScript(x, y);
				draw_sprite(sprInstFlatIcon, 0, x+sprite_xoffset, y-sprite_yoffset);
			}
		break;
	}
	
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
					var sx=lerpX-scrollX;
					var inst=instance_create_depth(sx, lerpY, d, createObject);
					with inst {
						mode=md;
						startX=sx;
						scrollX=other.scrollX;
						show_debug_message(concat("startx ", startY, "  scrollx ", scrollX));
						xstart=startX;
						event_perform(ev_create, 0);
						playSound(asset, 100);
					}
					with parentWindow {
						ds_list_add(children, inst);
						ds_list_add(notes, inst);
					}
					grace=2;
					squish+=.5;
				}
			}
		} else {
			squish=-.5;
			instance_destroy(inst);
		}
	}
} else {
	drawScript=function(x, y) {}
}