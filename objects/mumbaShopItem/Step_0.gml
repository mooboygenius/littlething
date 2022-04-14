if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(drawX-sprite_xoffset+8, drawY+4, name);
}