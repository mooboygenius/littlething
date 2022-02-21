if live_call() return live_result;

event_inherited();

if sprite_exists(buttonSprite) {
	var dx=x,
	dy=y+image_index;
	draw_sprite(buttonSprite, 0, dx, dy);
}