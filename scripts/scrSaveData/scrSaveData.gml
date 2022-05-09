#macro SETTINGS_FILE "settings.sav"
#macro SAVE_FILE "save.sav"

globalvar settingDataMap, saveDataMap;
settingDataMap=ds_map_secure_load(SETTINGS_FILE);
saveDataMap=ds_map_secure_load(SAVE_FILE);

show_debug_message(concat("setting map: ", settingDataMap, "  does setting map exist? ", ds_exists(settingDataMap, ds_type_map)));

if !ds_exists(settingDataMap, ds_type_map) {
	settingDataMap=ds_map_create();
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
}

if !ds_exists(saveDataMap, ds_type_map) {
	saveDataMap=ds_map_create();
	ds_map_secure_save(saveDataMap, SAVE_FILE);
}

function loadSetting(name, defaultValue=0) {
	var d=defaultValue;
	if ds_map_exists(settingDataMap, name) {
		d=settingDataMap[? name];
	}
	show_debug_message(concat("loaded ", name, " as ", d));
	return d;
}

function loadData(name, defaultValue=0) {
	var d=defaultValue;
	if ds_map_exists(saveDataMap, name) {
		d=saveDataMap[? name];
	}
	show_debug_message(concat("loaded ", name, " as ", d));
	return d;
}

function updateSetting(name, value) {
	settingDataMap[? name]=value;
	show_debug_message(concat("updated \"", name, "\": ", value));
}

function updateData(name, value) {
	saveDataMap[? name]=value;
	show_debug_message(concat("updated \"", name, "\": ", value));
}

function saveGame() {
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
	ds_map_secure_save(saveDataMap, SAVE_FILE);
	show_debug_message("GAME SAVED");
}

globalvar musicVolume, soundVolume, masterVolume, mumbaGraphicsOn, mumbaParticlesOn, mumbaMasterVolume, mumbaMusicVolume, mumbaSoundVolume;
musicVolume=loadSetting("musicVolume", 1);
soundVolume=loadSetting("soundVolume", 1);
masterVolume=loadSetting("masterVolume", 1);
mumbaGraphicsOn=loadSetting("mumbaGraphicsOn", 1);
mumbaParticlesOn=loadSetting("mumbaParticlesOn", 1);
mumbaMasterVolume=loadSetting("mumbaMasterVolume", 1);
mumbaMusicVolume=loadSetting("mumbaMusicVolume", 1);
mumbaSoundVolume=loadSetting("mumbaSoundVolume", 1);
audio_master_gain(masterVolume);