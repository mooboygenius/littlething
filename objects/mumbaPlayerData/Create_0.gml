if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {}

gunInventory=ds_list_create();
var gi=loadData("mumbaGunInventory", 0);
if gi!=0 {
	show_debug_message("gun inventory found");
	ds_list_read(gunInventory, gi);
} else {
	show_debug_message("gun inventory not previously saved");
}

if ds_list_size(gunInventory)<=0 ds_list_add(gunInventory, mumbaGun);

hatInventory=ds_list_create();
var hi=loadData("mumbaHatInventory", 0);
if hi!=0 {
	show_debug_message("hat inventory found");
	ds_list_read(hatInventory, hi);
} else {
	show_debug_message("hat inventory not previously saved");
}

if ds_list_size(hatInventory)<=0 ds_list_add(hatInventory, mumbaNoHat);

currentGun=0;
currentHat=0;

money=loadData("mumbaMoney", 0);
show_debug_message(concat("loaded money as ", money));

levelA=loadData("mumbaLevelA", 0);
levelB=loadData("mumbaLevelB", 0);