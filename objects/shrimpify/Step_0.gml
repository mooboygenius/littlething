if live_call() return live_result;
// Inherit the parent event
event_inherited();

if currentMusic && audio_is_playing(currentMusic) {
	currentTrackLength=audio_sound_length(asset_get_index(audio_get_name(currentMusic)));
	currentTrackPosition=audio_sound_get_track_position(currentMusic);
} else {
	
}

if ds_exists(tracks, ds_type_list) {
	var size=ds_list_size(tracks),
	start=4,
	sx=start,
	sy=trackScrollLerp,
	o=24;
	for (var i=0; i<size; i++) {
		with tracks[| i] {
			xstart=sx;
			ystart=sy;
		}
		sy+=o;
	}

	var in=(mouse_wheel_up()-mouse_wheel_down());
	in*=o;
	trackScroll=clamp(trackScroll+in, (-size+3.7)*o, start);
	trackScrollLerp=lerp(trackScrollLerp, trackScroll, .5);
}