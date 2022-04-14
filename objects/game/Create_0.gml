if live_call() return live_result;

#macro DEV_MODE false
#macro dev:DEV_MODE true

#macro GAME_WIDTH 320
#macro GAME_HEIGHT 180
#macro GAME_RATIO GAME_WIDTH/GAME_HEIGHT
#macro WINDOW_SCALE 3
#macro WINDOW_WIDTH GAME_WIDTH*WINDOW_SCALE
#macro WINDOW_HEIGHT GAME_HEIGHT*WINDOW_SCALE
#macro BLACK_COLOR $211F1B
#macro WINDOW_COLOR $C2A7A3

view_camera[0]=camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
view_enabled=true;
view_set_visible(0, true);
view_set_camera(0, view_camera[0]);
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);
display_set_gui_size(WINDOW_WIDTH, WINDOW_HEIGHT);

#macro START_ROOM rmBootup
#macro dev:START_ROOM rmTest
room_goto(START_ROOM);

globalvar previousMouseX, previousMouseY;
previousMouseX=getMouseX();
previousMouseY=getMouseY();

#macro MAXIMUM_WINDOWS 6

application_surface_draw_enable(false);

crtOn=false;

passSurf1=-1;
passSurf2=-1

globalvar gameFrame;
gameFrame=0;

audio_group_load(bgm);
audio_group_load(sfx);

globalvar realWebsites;
realWebsites=ds_map_create();
ds_map_add(realWebsites, "www.fireshrimp.shrimp", fireShrimpHome);
ds_map_add(realWebsites, "www.shrimple.shrimp", shrimple);

globalvar masterVolume;
masterVolume=loadSetting("masterVolume", 1);

globalvar mumbaInputLeft, mumbaInputRight, mumbaInputJump, mumbaInputFire, mumbaInputWeaponUp, mumbaInputWeaponDown;
mumbaInputLeft=loadSetting("mumbaInputLeft", vk_left);
mumbaInputRight=loadSetting("mumbaInputRight", vk_right);
mumbaInputJump=loadSetting("mumbaInputJump", ord("Z"));
mumbaInputFire=loadSetting("mumbaInputFire", ord("X"));
mumbaInputWeaponUp=loadSetting("mumbaInputWeaponUp", vk_up);
mumbaInputWeaponDown=loadSetting("mumbaInputWeaponDown", vk_down);

globalvar mumbaShopFont;
mumbaShopFont=font_add_sprite_ext(sprMumbaShopFont, "abcdefghijklmnopqrstuvwxyz1234567890O*", true, 1);

globalvar mumbaItems;
mumbaItems=ds_map_create();
createMumbaItem=function(nm, ass, desc, skdesc, smallspr, bigspr, price) {
	/// @function createMumbaItem(name, associatedObject, description, shopKeeperDescription, smallSprite, bigSprite, price)
	ds_map_add(mumbaItems, nm, ds_map_create());
	var map=mumbaItems[? nm];
	ds_map_add(map, "name", nm);
	ds_map_add(map, "object", ass);
	ds_map_add(map, "description", desc);
	ds_map_add(map, "shopKeeperDescription", skdesc);
	ds_map_add(map, "smallSprite", smallspr);
	ds_map_add(map, "bigSprite", bigspr);
}
createMumbaItem("Gun", mumbaGun, "Mumba's iconic gun!", "Looks sexy.", sprMumbaGun, sprMumbaGunUI, 0);
createMumbaItem("Coconut Shotgun", mumbaCoconutShotgun, "Fires bouncy coconuts!", "Ooh -- the Coconut Shotgun! Do you like it?", sprMumbaCoconutShotgun, sprMumbaCoconutShotgunUI, 20);
createMumbaItem("Tiki Gun", mumbaTikiGun, "High fire rate!", "The world-famous Tiki Gun! I carved it myself, you know.", sprMumbaTikiGun, sprMumbaTikiGunUI, 20);
createMumbaItem("Burger Cannon", mumbaBurgerCannon, "Shoots heavy burger projectiles!", "Ugh... Do you REALLY want THAT?...", sprMumbaBurgerCannon, sprMumbaBurgerCannonUI, 30);
createMumbaItem("Fry Bow", mumbaFryCrossbow, "Fires penetrating fry arrows!", "Are you gonna something -- like -- edible?...", sprMumbaFryCrossbow, sprMumbaFryCrossbowUI, 30);

#macro HIGHEST_INSTANCE_UNDER_MOUSE getHighestInstanceUnderMouse()