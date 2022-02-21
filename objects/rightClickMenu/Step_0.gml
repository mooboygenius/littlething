if live_call() return live_result;

event_inherited();
enum menuState {appear, idle, close}
switch state {
	case menuState.appear:
		appeared=lerp(appeared, 1, .2);
		if appeared>.95 {
			appeared=1;
			state=1;
		}
	
	case menuState.idle:
		waveIntensity=lerp(waveIntensity, 0, .1);
		ditherIndex=max(0, ditherIndex-.3);
		
		if (input(mb_left, PRESS) || input(mb_right, PRESS)) && !mouseIsInMenu{
			grace=max(grace, 5);
			state=menuState.close;
		}
	break;
	break;
	
	case menuState.close:
		waveIntensity=lerp(waveIntensity, 5, .1);
		appeared=lerp(appeared, 0, .1);
		ditherIndex=min(4, ditherIndex+.3);
		if appeared<.05 {
			instance_destroy();
		}
	break;
}

mouseIsInMenu=false;