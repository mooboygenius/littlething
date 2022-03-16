if live_call() return live_result;
event_inherited();

var w=180,
h=3/4*w;
setWindowSize(self, x, y, w, h);

pauseButton=instance_create_depth(-100, -100, depth-1, shrimpifyPauseButton);
nextButton=instance_create_depth(-100, -100, depth-1, shrimpifyNextButton);
previousButton=instance_create_depth(-100, -100, depth-1, shrimpifyPreviousButton);
trackBar=instance_create_depth(-100, -100, depth-1, shrimpifyTrackBar);
trackPositionMarker=instance_create_depth(-100, -100, depth-1, shrimpifyTrackPositionMarker);

ds_list_add(children, pauseButton, nextButton, previousButton, trackBar, trackPositionMarker);

currentTrackLength=-1;
currentTrackPosition=0;

if currentMusic && audio_is_playing(currentMusic) {
	currentTrackLength=audio_sound_length(asset_get_index(audio_get_name(currentMusic)));
	currentTrackPosition=audio_sound_get_track_position(currentMusic);
}

tracks=ds_list_create();
for (var i=0; i<ds_list_size(songs); i++) {
	var inst=instance_create_depth(-100, -100, depth-1, shrimpifySong);
	with inst {
		audio=getSongAudio(i);
		name=getSongName(i);
		artist=getSongArtist(i);
		art=getSongArt(i);
	}
	ds_list_add(tracks, inst);
	ds_list_add(children, inst);
}