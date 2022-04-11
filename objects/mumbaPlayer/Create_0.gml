if live_call() return live_result;

event_inherited();

myGunObject=noone;
myGunInstance=noone;
myUI=instance_create_depth(0, 0, 0, mumbaUIController);
with myUI {
	visible=false;
}
setCameraFocus(self);

die=function() {
	
}

getHurt=function(amt) {
	grace=amt*30;
}

walkingTime=0;
jumpingTime=0;