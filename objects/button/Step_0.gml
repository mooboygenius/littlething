if live_call() return live_result;

event_inherited();
switch state {
	case 0:
		image_index=hoveringOver;
		if getHighestInstanceUnderMouse()==id {
			hoveringOver=true;
			if input(mb_left, RELEASE) {
				clickFunction();
			}
		} else {
			hoveringOver=false;
		}
	break;
}