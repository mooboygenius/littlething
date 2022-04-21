if live_call() return live_result;

event_inherited();

var l=.05;
xScale=lerp(xScale, 1, l);
yScale=lerp(yScale, 1, l);

var gx=64, gy=GAME_HEIGHT div 2;

switch state {
	case 0:
		turnSpeed=lerp(turnSpeed, 5, .02);
		angle+=turnSpeed;
		if point_distance(drawX, drawY, gx, gy)<=4 {
			drawX=gx;
			drawY=gy;
			state=1;
			angle=angle%360;
			squish=.1;
			grace=2;
			x+=random_range(-3, 3);
			y+=random_range(-3, 3);
		}
	break;
	
	case 1:
		angle=lerp(angle, 0, .1);
		if point_distance(0, angle, 0, 0)<=1 {
			angle=0;
			state=2;
			squish=-.025;
		}
	break;
	
	case 2:
		turnSpeed=wave(.1, .4, 10);
		angle+=turnSpeed;
		var l=8, t=gameFrame;
		gx+=lengthdir_x(l, t);
		gy+=lengthdir_y(l, t);
		squish=wave(-1, 1, 3)*.05;
	break;
}

var l=.03;
drawX=lerp(drawX, gx, l);
drawY=lerp(drawY, gy, l);