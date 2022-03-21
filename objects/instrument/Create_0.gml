if live_call() return live_result;

event_inherited();

show_debug_message(concat("ystart: ", ystart));

name="sfxCat";

pitch=1;

switch ystart {
	case 3: name+="D2" break;
	
	case 10: name+="C2" break;
	
	case 17: name+="B2" break;
	
	case 24: name+="A2" break;
	
	case 31: name+="G2" break;
	
	case 38: name+="F2" break;
	
	case 45: name+="E2" break;
	
	case 52: name+="D1" break;
	
	case 59: name+="C1" break;
	
	case 66: name+="B1" break;
	
	case 73: name+="A1" break;
	
	case 80: name+="G1" break;
	
	case 87: name+="F1" break;
	
	case 94: name+="E1" break;
}
squish=.5;
asset=asset_get_index(name);
if !audio_exists(asset) {
	asset=sfxCatD1;
}
playSound(asset, 0, pitch);