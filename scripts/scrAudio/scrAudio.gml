function playSound(sound, priority=0, loops=false) {
	return audio_play_sound(sound, priority, loops);
}

globalvar currentMusic, currentMusicIndex;
currentMusic=noone;
currentMusicIndex=0;

function playMusic(music) {
	if !audio_is_playing(music) {
		currentMusic=playSound(music, 100, true);
	}
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

createSong(bgmShrimpOS, "Shrimpos", "HeyOPC");
createSong(bgmShrimpOS, "test", "test");
createSong(bgmShrimpSong, "Jeff Rosenshrimp", "studionokoi");
createSong();
#endregion