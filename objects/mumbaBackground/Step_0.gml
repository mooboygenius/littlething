if live_call() return live_result;

event_inherited();

with parentWindow {
	other.xstart=floor(-cameraX+other.sprite_xoffset)+1;
	other.ystart=floor(-cameraY+other.sprite_yoffset);
}