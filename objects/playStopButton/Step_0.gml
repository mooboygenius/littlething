if live_call() return live_result;

event_inherited();

if getActiveWindow()==parentWindow && input(vk_space, PRESS) {
	playOrStopSong();
}

var inst=noone,
p=false;
with parentWindow {
	inst=player;
}
with inst {
	p=playing;
}

var sq=.5;
if sprite_index==sprPlayButton && p {
	sprite_index=sprStopButton;
	squish=sq;
} else if sprite_index==sprStopButton && !p {
	sprite_index=sprPlayButton;
	squish=sq;
}