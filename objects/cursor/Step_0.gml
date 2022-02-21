if live_call() return live_result;
event_inherited();
var l=.5;
x=lerp(x, getMouseX(), l);
y=lerp(y, getMouseY(), l);
var lx=(previousX-x)*1;
angle=lerp(angle, lx, .25);
previousX=x;

if input(mb_right, PRESS) {
	with rightClickMenu {
		grace=max(grace, 5);
		state=menuState.close;
	}
	instance_create_depth(x, y, depth+1, rightClickMenu);
}

if pullHorizontal {
	sprite_index=sprCursorStretchHorizontal;
} else if pullVertical {
	sprite_index=sprCursorStretchVertical;
} else if hoveringOver {
	sprite_index=sprCursorFinger;
} else {
	sprite_index=sprCursor;
}

hoveringOver=false;
pullHorizontal=false;
pullVertical=false;