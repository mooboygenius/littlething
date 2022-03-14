if live_call() return live_result;

event_inherited();

with urlBar {
	var sw=sprite_get_width(sprite_index);
	image_xscale=other.portWidth/sw*other.windowScale;
	image_yscale=other.windowScale;
	depth=other.depth-1;
	x=other.x+3;
	y=other.y+10;
}