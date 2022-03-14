function playSound(sound, priority=0, loops=false) {
	return audio_play_sound(sound, priority, loops);
}

function playMusic(music) {
	if !audio_is_playing(music) {
		currentMusic=playSound(music, 100, true);
	}
}