if live_call() return live_result;

if surface_exists(passSurf1) {
	surface_set_target(passSurf1);
	var sc=WINDOW_SCALE;
	if os_browser==browser_not_a_browser {
		sc=WINDOW_SCALE;
	}

	if crtOn shader_set(shCRT);
	shader_set_uniform_f(shader_get_uniform(shCRT, "textureSize"), WINDOW_WIDTH, WINDOW_HEIGHT);
	shader_set_uniform_f(shader_get_uniform(shCRT, "lineDistance"), WINDOW_SCALE*2, WINDOW_SCALE);
	shader_set_uniform_f(shader_get_uniform(shCRT, "intensity"), .3+wave(0, .02, 5));
	draw_surface_ext(application_surface, 0, 0, sc, sc, 0, c_white, 1);
	shader_reset();
	surface_reset_target();
	
	draw_surface(passSurf1, 0, 0);
} else {
	passSurf1=surface_create(WINDOW_WIDTH, WINDOW_HEIGHT);
}