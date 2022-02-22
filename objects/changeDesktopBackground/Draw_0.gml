if live_call() return live_result;

event_inherited();

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_clear_alpha(c_white, 1);
	var t=current_time/30;
	draw_sprite_tiled(sprCoolBackground, 0, t, t);
	if surface_exists(childrenObjectSurf) draw_surface(childrenObjectSurf, 0, 0);
	draw_set_font(fntSystem);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var hx=portWidth div 2, hy=24, h="Change your\nShrimptop background";
	hx+=random_range(-1, 1);
	hy+=random_range(-1, 1);
	draw_set_color(BLACK_COLOR);
	draw_text(hx, hy, h);
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	var desc="Upload an image directly from ur\nIRL desktop to use as your\nShrimptop background!!",
	descx=portWidth div 2-string_width(desc) div 2-24,
	descy=56+wave(-2, 2, 2);
	draw_text(descx, descy, desc);
	draw_sprite(sprShrimpDance, current_time/100, portWidth div 2+56, 60+wave(-2, 2, 2, .5));
	surface_reset_target();
} else {
	finalSurf=surface_create(portWidth, portHeight);
}