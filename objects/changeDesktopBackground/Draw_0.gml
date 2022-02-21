if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(1, 1);
	surface_reset_target();
} else {
	finalSurf=surface_create(portWidth, portHeight);
}