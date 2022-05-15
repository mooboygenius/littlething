if live_call() return live_result;

event_inherited();

tity=lerp(tity,0,0.1);

if(input(ord("Z"),PRESS)){
	playSound(sndBimClick,1,random_range(0.9,1.1),0);
	createWindowInstance(0,0,depth+1,objBimsymenu,parentWindow);
	instance_destroy(self);
}

qtimer--;
if(qtimer==0){
	playSound(objBimsymanager.gameoverv,1,1,0);	
}
