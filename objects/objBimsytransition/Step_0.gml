if live_call() return live_result;

event_inherited();

if(timer>0){
	if(timer==240){
		
		manager.gamespeed+=addspeed;
		manager.gamespeed*=mulspeed;
		manager.deckpointer++;
		if(manager.deckpointer>=array_length(manager.minigamedeck)){
			manager.deckpointer=0;
			bimsyscrambledeck();
		}
		if(manager.wonlastminigame){
			if(manager.bimscore==0){
				playSound(manager.startv,1,1,0);
			}else{
				playSound(manager.winv[irandom_range(0,array_length(manager.winv)-1)],1,1,0);
			}
			
			manager.bimmusic=playSound(winmusic,1,manager.gamespeed,0);
		}else{
			manager.bimmusic=playSound(losemusic,1,manager.gamespeed,0);
			manager.hp--;
			if(manager.hp==1){
				playSound(manager.oneleftv,1,1,0);
			}else{
				playSound(manager.losev[irandom_range(0,array_length(manager.losev)-1)],1,1,0);
			}
		}		
	}
	timer-=manager.gamespeed;
	if(timer<=120 && !addedscore){
		if(manager.hp<=0){
			playSound(sndBimCuica,1,1,0);
			createWindowInstance(0,0,depth+1,objBimsygameover,parentWindow);
			instance_destroy(self);
		}else{
			manager.bimscore++;
			manager.bimmusic=playSound(nextmusic,1,manager.gamespeed,0);
			addedscore=1;
		}
		
	}
	
	if(timer<=30 && !splashed){
		var sp= instance_create_depth(64,64,depth+11,objBimsySplashtext);
		ds_list_add(parentWindow.children, sp);
		with(sp){
			splashtext=	bimsysplashtext(manager.minigamedeck[manager.deckpointer]);
		}
		splashed=1;
		
	}
	
	if(timer<=0){
		manager.wonlastminigame=0;
		createWindowInstance(0,0,depth+1,manager.minigamedeck[manager.deckpointer],parentWindow);
		instance_destroy(self);
	}
}
