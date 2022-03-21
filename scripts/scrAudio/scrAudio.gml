function playSound(sound, priority=0, pitch=1, loops=false) {
	audio_sound_pitch(sound, pitch);
	return audio_play_sound(sound, priority, loops);
}

globalvar currentMusic, currentMusicIndex;
currentMusic=noone;
currentMusicIndex=-10000;

function playMusic(music) {
	audio_group_stop_all(bgm);
	currentMusic=playSound(music, 100, 1, true);
	return currentMusic;
}

function playMusicFromIndex(index) {
	var music=getSongAudio(index);
	currentMusicIndex=index;
	return playMusic(music);
}

#region songs
globalvar songs;
songs=ds_list_create();

function createSong(audio=bgmShrimpOS, name="???", artist="???", art=sprDefaultSongArt) {
	var n=ds_list_size(songs);
	songs[| n]=ds_map_create();
	songs[| n][? "audio"]=audio;
	songs[| n][? "name"]=name;
	songs[| n][? "artist"]=artist;
	songs[| n][? "art"]=art;
}

function getSongAudio(index) {
	return songs[| index][? "audio"];
}

function getSongName(index) {
	return songs[| index][? "name"];
}

function getSongArtist(index) {
	return songs[| index][? "artist"];
}

function getSongArt(index) {
	return songs[| index][? "art"];
}

createSong(bgmShrimpOS, "Shrimpos", "HeyOPC & Droid");
createSong(bgmShrimpSong, "Jeff Rosenshrimp", "studionokoi");
createSong(bgmBrandySong, "Shrimp Hacker", "BrandyBuizel");
createSong(bgmSponge, "Big Boy Rumble Tumble", "HeyOPC & Droid");
createSong(bgmShrimpBattle1, "Shrimp Battle #1", "HeyOPC");
createSong(bgmShrimpBattle2, "Shrimp Battle #2", "HeyOPC");
createSong(bgmShrimpOS, "test", "test");
createSong(bgmShrimpOS, "placeholder", "jack");
createSong(bgmShrimpOS, "placeholder", "ConnorGrail");
createSong(bgmShrimpOS, "placeholder", "DefaultLabs");
createSong();
#endregion