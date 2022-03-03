if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	draw_sprite_stretched(sprPaintBar, 0, 0, 0, 25, portHeight);
	
	surface_reset_target();
}