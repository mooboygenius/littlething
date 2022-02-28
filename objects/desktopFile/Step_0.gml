if live_call() return live_result;

event_inherited();

switch state {
	case 0:
		var l=.8;
		x=lerp(x, nearestAcceptableX, l);
		y=lerp(y, nearestAcceptableY, l);
		if hoveringOver && input(mb_left) {
			if holdTimer==0 grace=4;
			holdTimer++;
			if holdTimer>2 && (previousMouseX!=getMouseX() || previousMouseY!=getMouseY()) {
				state=100;
				grace=2;
			}
		} else {
			holdTimer=0;
		}
	break;
	
	case 100:
		if input(mb_left) {
			var l=.25;
			x=lerp(x, getMouseX(), l);
			y=lerp(y, getMouseY(), l);
		}
		if input(mb_left, RELEASE) {
			hoveringOver=false;
			state=0;
			holdTimer=-20;
			squish=2;
			grace=4;
		}
	break;
}

if previousHovering!=hoveringOver {
	var sq=.5;
	if hoveringOver {
		squish=sq;
	} else {
		squish=-sq;
	}
	grace=2;
	previousHovering=hoveringOver;
}

var xsc=1,
ang=0;
if hoveringOver {
	xsc=wave(-1, 1, 1);
	ang=wave(-1, 1, .5)*5;
}
xScale=lerp(xScale, xsc, .2);
angle=lerp(angle, ang, .2);

offsetX=20;
offsetY=16;
shiftX=40;
shiftY=40;
nearestAcceptableX=round((x-offsetX)/shiftX)*shiftX+offsetX;
nearestAcceptableY=round((y-offsetY)/shiftY)*shiftY+offsetY;