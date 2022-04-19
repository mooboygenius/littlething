if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	var xx=gameFrame/20;
	draw_sprite_tiled_ext(sprite_index, image_index, xx, 0, 1, 1, c_white, 1);
}