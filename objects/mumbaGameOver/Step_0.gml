if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		timer++;
		show=timer%2;
		if timer>30 {
			timer=0;
			state=1;
			show=true;
		}
	break;
	
	case 1:
	break;
}

if input(mumbaInputFire, PRESS) || input(mumbaInputJump, PRESS) {
	playMumbaSound(sfxMumbaLevelRestart, 100, 1);
	var obj=mumbaBeachLevel;
	with mumbaLevel {
		obj=object_index;
		instance_destroy();
	}
	with mumbaWorldObject instance_destroy();
	var inst=instance_create_depth(0, 0, 0, obj);
	with parentWindow {
		ds_list_add(children, inst);
	}
}

drawScript=function(x, y) {
	if show {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntSystem);
		drawTextOutlinedGeneral(round(GAME_WIDTH div 2), round(GAME_HEIGHT div 2)+wave(-2, 2, 1), text, 12, GAME_WIDTH);
	}
}