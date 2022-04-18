if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(BLACK_COLOR, 1);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	part_system_position(particleSystem, cameraX, cameraY);
	part_system_drawit(particleSystem);
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var tc=BLACK_COLOR;
	//draw_text_color(1, 1, concat("instances: ", instance_count, "\nlist size: ", ds_list_size(children)), tc, tc, tc, tc, 1);
	surface_reset_target();
}