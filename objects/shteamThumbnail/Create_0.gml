if live_call() return live_result;
event_inherited();

generateSprite=function() {
	var w=sprite_width, h=sprite_height;
	
	var surf=surface_create(w, h);
	
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_sprite(sprite_index, 0, 0, 0);
	var bx=0, by=h-sprite_get_height(sprShteamThumbnailBanner);
	draw_sprite(sprShteamThumbnailBanner, 0, bx, by);
	draw_set_font(fntSmaller);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var tc=make_color_rgb(76, 104, 133),
	tx=2,
	ty=by+2;
	draw_text_color(tx, ty, name, tc, tc, tc, tc, 1);
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf, 0, 0, w, h, false, false, w div 2, h div 2);
	
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	setSwapAmountShader(c_white, c_white, 1, .1);
	draw_sprite(sprite_index, 0, 0, 0);
	shader_reset();
	draw_sprite(sprShteamThumbnailBanner, 0, bx, by);
	draw_text_color(tx, ty, name, tc, tc, tc, tc, 1);
	surface_reset_target();
	
	sprite_add_from_surface(sprite, surf, 0, 0, w, h, false, false);
	
	sprite_set_speed(sprite, 0, 0);
	
	sprite_index=sprite;
	
	surface_free(surf);
}

generateSprite();

clickFunction=function() {
	squish=.8;
	url_open_ext(link, "_blank");
}