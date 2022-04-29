if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(BLACK_COLOR, 1);
	if surface_exists(childrenObjectSurf) {
		draw_surface_ext(childrenObjectSurf, childrenSurfaceX, childrenSurfaceY, 1, 1, 0, c_white, 1);
	}
	part_system_position(particleSystem, childrenSurfaceX+cameraX, childrenSurfaceY+cameraY);
	part_system_position(uiParticleSystem, childrenSurfaceX, childrenSurfaceY);
	part_system_drawit(particleSystem);
	part_system_drawit(uiParticleSystem);
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var tc=BLACK_COLOR;
	//draw_text_color(1, 1, concat("instances: ", instance_count, "\nlist size: ", ds_list_size(children)), tc, tc, tc, tc, 1);
	surface_reset_target();
}