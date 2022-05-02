function playMumbaSound(sound, priority=0, pitch=1, loops=false) {
	audio_sound_pitch(sound, pitch);
	return audio_play_sound(sound, priority, loops);
}

globalvar currentMumbaMusic;
currentMumbaMusic=noone;

function playMumbaMusic(music, loops=true) {
	audio_group_stop_all(mumbaBGM);
	currentMumbaMusic=playSound(music, 100, 1, loops);
	return currentMumbaMusic;
}