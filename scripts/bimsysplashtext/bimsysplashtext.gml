// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bimsysplashtext(minigame){
	switch(minigame){
		default: return "WHAT!?"; break;	
		case objBimsyminigame: return "SHRIMPS!?"; break;	
		case objBimsyminigameB1: return "GOLF!"; break;	
		case objBimsyminigameB2: return "STOP!"; break;	
		case objBimsyminigameB3: return "REEL IT IN!"; break;	
		case objBimsyminigameB4: return "CHOW DOWN!"; break;	
		case objBimsyminigameB5: return "RUN!!!"; break;	
		case objBimsyminigameB6: return "ANSWER!"; break;	
		//case objBimsyminigameB7: return "STAY AFLOAT!"; break;	
		//case objBimsyminigameB8: return "WAIT..."; break;	
		
		case objBimsyminigameD1: return "CATCH!"; break;	
		case objBimsyminigameD2: return "AVOID!"; break;	
		case objBimsyminigameD3: return "INSERT!"; break;	
	}
}