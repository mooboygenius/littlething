if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	var m=3;
	setWaveShader(sprite_width*m, sprite_height*m, 1, 0, gameFrame);
	var dx=drawX, dy=drawY;
	with parentWindow {
		dx+=cameraX*other.cameraXMultiplier;
		dy+=cameraY*other.cameraYMultiplier;
	}
	if loops {
		draw_sprite_tiled(sprite_index, image_index, dx, dy);
	} else {
		defaultDrawScript(dx, dy);
	}
	shader_reset();
}