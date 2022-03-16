if live_call() return live_result;
// Inherit the parent event
event_inherited();

if currentMusic && audio_is_playing(currentMusic) {
	currentTrackLength=audio_sound_length(asset_get_index(audio_get_name(currentMusic)));
	currentTrackPosition=audio_sound_get_track_position(currentMusic);
} else {
	
}

var sx=0,
sy=24;
for (var i=0; i<ds_list_size(tracks); i++) {
	with tracks[| i] {
		xstart=sx+sprite_xoffset;
		ystart=sy;
	}
	sy+=24;
}