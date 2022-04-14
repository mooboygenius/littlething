if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	var textColor=active ? BLACK_COLOR : WHITE_COLOR,
	backColor=active ? WHITE_COLOR : color;
	setSwapAmountShader(backColor, defaultColor, .2, 1);
	defaultDrawScript(drawX, drawY);
	shader_reset();
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_color(drawX-sprite_xoffset+3, drawY, name, textColor, textColor, textColor, textColor, 1);
	draw_set_halign(fa_right);
	var mx=drawX+sprite_xoffset;
	draw_text_color(mx-3, drawY, concat("O*", price), textColor, textColor, textColor, textColor, 1);
	active=false;
}