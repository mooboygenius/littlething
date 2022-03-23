if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
		var spd=10,
		scroll=(mouse_wheel_down()-mouse_wheel_up())*spd;
		scrollAmount+=scroll;
		scrollAmount=clamp(scrollAmount, -GAME_WIDTH*20, 0);
		scrollAmountLerp=lerp(scrollAmountLerp, scrollAmount, .5);
		if getActiveWindow()!=self scroll=0;
		for (var i=0; i<ds_list_size(notes); i++) {
			with notes[| i] {
				scrollX=other.scrollAmountLerp;
			}
		}
		
		with mouseInstrument {
			scrollX=other.scrollAmountLerp;
		}
	break;
}