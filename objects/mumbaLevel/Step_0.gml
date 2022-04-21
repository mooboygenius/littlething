if live_call() return live_result;

event_inherited();

for (var i=0; i<ds_list_size(children); i++) {
	if instance_exists(children[| i]) {
		var o=children[| i].id;
		with parentWindow {
			if ds_list_find_index(children, o)<0 {
				ds_list_add(children, o);
				show_debug_message(concat(ds_list_size(children), " added object to parent window: ", o, "  ", ds_list_find_index(children, o)));
			}
		}
	} else {
		ds_list_delete(children, i);
	}
}

var w=tileSurfaceWidth, h=tileSurfaceHeight;
with parentWindow {
	cameraLeftLimit=-16;
	cameraTopLimit=0;
	cameraRightLimit=-w+16;
	cameraBottomLimit=-h;
}