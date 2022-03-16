if live_call() return live_result;

event_inherited();

var mouseIsInArea=true;
if parentWindow!=noone && instance_exists(parentWindow) && !visible {
	mouseIsInArea=false;
	var left=bbox_left,
	top=bbox_top,
	right=bbox_right,
	bottom=bbox_bottom,
	portLeft=0,
	portTop=0,
	portRight=0,
	portBottom=0;
	with parentWindow {
		portLeft=portX;
		portTop=portY;
		portRight=portX+portWidth;
		portBottom=portY+portHeight;
	}
	left=max(left, portLeft);
	top=max(top, portTop);
	right=min(right, portRight);
	bottom=min(bottom, portBottom);
	mouseIsInArea=point_in_rectangle(getMouseX(), getMouseY(), left, top, right, bottom);
}

switch state {
	case 0:
		image_index=hoveringOver;
		if getHighestInstanceUnderMouse()==id && mouseIsInArea {
			setMouseHoveringOver();
			hoveringOver=true;
			if input(mb_left, clickType) {
				clickFunction();
			}
		} else {
			hoveringOver=false;
		}
	break;
}