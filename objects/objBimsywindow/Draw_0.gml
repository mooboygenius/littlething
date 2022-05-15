if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	draw_sprite_tiled(sprBimbg,0,current_time*0.01,current_time*0.01);
	
	draw_surface(childrenObjectSurf, 0, 0)
	surface_reset_target();
}
