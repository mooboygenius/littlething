if live_call() return live_result;

#region dev keybinds
if DEV_MODE {
	if input(vk_home, PRESS) game_restart();
}
#endregion

if input(vk_f2, PRESS) crtOn=!crtOn;

gameFrame++;

audio_master_gain(masterVolume);
if gameFrame%120==0 {
	for (var i=0; i<audioNameLength; i++) {
		var n=audioNames[i];
		if string_pos("sfxMumba", n) {
			audio_sound_gain(i, mumbaMasterVolume*mumbaSoundVolume, 0);
		} else if string_pos("bgmMumba", n) {
			audio_sound_gain(i, mumbaMasterVolume*mumbaMusicVolume, 0);
		} else if string_pos("sfx", n) {
			audio_sound_gain(i, soundVolume, 0);
		} else if string_pos("bgm", n) {
			audio_sound_gain(i, musicVolume, 0);
		}
	}
}