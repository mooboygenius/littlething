if live_call() return live_result;

event_inherited();

if playing {
	xstart++;
} else {
	xstart=0;
}

var over=true;
with instrument {
	if !played {
		over=false;
	}
}
if over playing=false;

drawScript=function(x, y) {
	draw_sprite_stretched(sprShrimposerPlayerBar, 0, x, 0, 1, 100);
}