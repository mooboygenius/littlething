if live_call() return live_result;

event_inherited();

switch masterVolume {
	case 0:
		buttonSprite=sprMutedVolume;
	break;
	
	case .5:
		buttonSprite=sprHalfVolume;
	break;
	
	case 1:
		buttonSprite=sprMaxVolume;
	break;
}