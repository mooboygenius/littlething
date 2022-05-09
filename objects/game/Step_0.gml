if live_call() return live_result;

#region dev keybinds
if DEV_MODE {
	if input(vk_home, PRESS) game_restart();
	if input(vk_delete, PRESS) {
		if show_question("delete save data?") {
			file_delete(SAVE_FILE);
			ds_map_destroy(saveDataMap);
			game_restart();
		}
	}
}
#endregion

if input(vk_f2, PRESS) crtOn=!crtOn;

gameFrame++;

audio_master_gain(masterVolume);

if gameFrame%120==0 {
	for (var i=0; i<audioNameLength; i++) {
		var n=audioNames[i],
		gain=audioBaseGains[i];
		if string_pos("sfxMumba", n) {
			audio_sound_gain(i, gain*mumbaMasterVolume*mumbaSoundVolume, 0);
		} else if string_pos("bgmMumba", n) {
			audio_sound_gain(i, gain*mumbaMasterVolume*mumbaMusicVolume, 0);
		} else if string_pos("sfx", n) {
			audio_sound_gain(i, gain*soundVolume, 0);
		} else if string_pos("bgm", n) {
			audio_sound_gain(i, gain*musicVolume, 0);
		}
	}
}