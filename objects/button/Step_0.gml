if live_call() return live_result;

event_inherited();
switch state {
	case 0:
		image_index=getMouseOverSelf();
		if getHighestInstanceUnderMouse()==id && input(mb_left, RELEASE) {
			clickFunction();
		}
	break;
	
	case 1:
		
	break;
}