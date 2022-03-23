if live_call() return live_result;

event_inherited();

playOrStopSong=function() {
	/// @function playOrStopSong()
	var inst=noone;
	with parentWindow {
		inst=player;
	}
	with inst {
		playing=!playing;
		if playing {
			other.sprite_index=sprStopButton;
		} else {
			other.sprite_index=sprPlayButton;
		}
	}
	squish=1;
}

clickFunction=function() {
	playOrStopSong();
}