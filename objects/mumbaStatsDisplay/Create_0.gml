if live_call() return live_result;

event_inherited();

fullText="";
drawScript=function(x, y) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntSystem);
	drawTextOutlinedGeneral(drawX, drawY, fullText, 16, GAME_WIDTH)
}