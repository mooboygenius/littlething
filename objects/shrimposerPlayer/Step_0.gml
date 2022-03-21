if live_call() return live_result;

event_inherited();

if playing {
	xstart++;
} else {
	xstart=0;
}

if input(vk_space, PRESS) playing=!playing;

drawScript=function(x, y) {
	
	draw_line_color(x, y, x, y+200, c_red, c_red);
}