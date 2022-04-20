if live_call() return live_result;

event_inherited();

var minDistance=4;
switch state {
	case 0:
		if point_distance(x, y, gotoX, gotoY)>4 {
			squish=.2;
			//show_debug_message(concat("distance: ", point_distance(x, y, gotoX, gotoY)));
			state=1;
			sprite_index=sprMumbaWalk;
		}
	break;
	
	case 1:
		var d=point_direction(x, y, gotoX, gotoY),
		spd=4;
		horizontalSpeed=lengthdir_x(spd, d);
		verticalSpeed=lengthdir_y(spd, d);
		timer++;
		var dist=point_distance(x, y, gotoX, gotoY);
		if dist<=6 || timer>60 {
			timer=0;
			horizontalSpeed=0;
			verticalSpeed=0;
			x=gotoX;
			y=gotoY;
			sprite_index=sprMumba;
			state=0;
			squish=-.2;
		}
	break;
}

xScale=lerp(xScale, targetXScale, .3);

depth-=20;