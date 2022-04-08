#macro SETTINGS_FILE "settings.sav"
#macro SAVE_FILE "save.sav"

globalvar settingDataMap, saveDataMap;
settingDataMap=ds_map_secure_load(SETTINGS_FILE);
saveDataMap=ds_map_secure_load(SAVE_FILE);

//show_debug_message(concat("setting map: ", settingDataMap, "  does setting map exist? ", ds_exists(settingDataMap, ds_type_map)));

if !ds_exists(settingDataMap, ds_type_map) {
	settingDataMap=ds_map_create();
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
}

if !ds_exists(saveDataMap, ds_type_map) {
	saveDataMap=ds_map_create();
	ds_map_secure_save(saveDataMap, SAVE_FILE);
}

function loadSetting(name, defaultValue=0) {
	if ds_map_exists(settingDataMap, name) {
		return settingDataMap[? name];
	} else {
		return defaultValue;
	}
}

function updateSetting(name, value) {
	settingDataMap[? name]=value;
}

function saveGame() {
	ds_map_secure_save(settingDataMap, SETTINGS_FILE);
	ds_map_secure_save(saveDataMap, SAVE_FILE);
}

globalvar masterVolume;
masterVolume=loadSetting("masterVolume", 1);
audio_master_gain(masterVolume);