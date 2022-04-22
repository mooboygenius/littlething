if live_call() return live_result;

var l=.2;

drawX=lerp(drawX, targetX, l);
drawY=lerp(drawY, targetY, l);

event_inherited();

depth=-300;

var yy=drawY,
xx=drawX;

menuHorizontalAlignment=menuHAlign.right;

for (var i=0; i<ds_list_size(children); i++) {
	if instance_exists(children[| i]) {
		with parentWindow {
			if ds_list_find_index(children, other.children[| i])<0 {
				ds_list_add(children, other.children[| i]);
				show_debug_message("added");
			}
		}
		with children[| i] {
			depth=-300;
			drawX=xx;
			if other.menuHorizontalAlignment==menuHAlign.left drawX+=sprite_xoffset
			else if other.menuHorizontalAlignment==menuHAlign.right drawX-=sprite_xoffset;
			drawY=yy;
			yy+=sprite_height;
		}
	} else {
		ds_list_delete(children, i);
	}
}