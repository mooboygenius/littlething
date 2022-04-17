if live_call() return live_result;

event_inherited();

cart=noone;

with myPlayer {
	horizontalSpeed=-1.5;
	xScale=-1;
	x=other.goalX+32;
	y=other.goalY;
	while !place_meeting(x, y+1, mumbaWall) {
		y++;
	}
}

goAwayTransition=noone;

doStateMachine=function() {
	switch state {
		case 0:
			timer++;
			if timer>180 {
				goAwayTransition=instance_create_depth(0, 0, -1000, mumbaCircleTransition);
				var w=1, h=1;
				with parentWindow {
					w=portWidth;
					h=portHeight;
					ds_list_add(children, other.goAwayTransition);
				}
				with goAwayTransition {
					circleX=w/2;
					circleY=h/2;
					circleSize=320;
					circleChange=-8;
				}
				timer=0;
				state=1;
			}
		break;
		
		case 1:
		break;
	}
}

timer=0;