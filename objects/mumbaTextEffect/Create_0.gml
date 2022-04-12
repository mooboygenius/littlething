if live_call() return live_result;

event_inherited();

generateText=function(str, c=c_white, oc=BLACK_COLOR, f=fntSystem) {
	/// @function generateText(string, color, outlineColor, [font])
	draw_set_font(f);
	var width=string_width(str)+2,
	height=string_height(str)+2;
	
	var surf=surface_create(width, height);
	surface_set_target(surf);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	drawTextOutlinedBasic(1, 1, str, c, oc);
	surface_reset_target();
	
	sprite=sprite_create_from_surface(surf, 0, 0, width, height, false, false, width div 2, height div 2);
	sprite_index=sprite;
	
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	surface_free(surf);
}

generateText("test", c_white, BLACK_COLOR);

drawScript=function(x, y) {
	if life>minimumLife || life%4<2 {
		defaultDrawScript(x, y);
	}
}