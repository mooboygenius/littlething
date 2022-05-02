if live_call() return live_result;

event_inherited();

life=30*60;
glowScale=4;

drawScript=function(x, y) {
	draw_sprite_ext(sprMumbaEggGlow, 0, x, y+drawYOffset, glowScale, glowScale, gameFrame, c_white, 1);
	defaultDrawScript(x, y+drawYOffset);
}