if live_call() return live_result;

event_inherited();

if(timer>0){
	if(timer==240 && manager.playmusic){
		manager.bimmusic=playSound(music,1,manager.gamespeed,0);	
	}
	timer-=manager.gamespeed;
	
	if(timer<=0){
		createWindowInstance(0,0,depth+10,manager.transition,parentWindow);
		for(var i=0; i<ds_list_size(elements); i++){
			instance_destroy(ds_list_find_value(elements,i))	
		}
		instance_destroy(self);
	}
}

if(timer<90 && !ticks[0]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[0]=1;
}

if(timer<60 && !ticks[1]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[1]=1;
}

if(timer<30 && !ticks[2]){
	audio_play_sound(sndBimTimer,0,0);	
	ticks[2]=1;
}

