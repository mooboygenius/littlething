if live_call() return live_result;

if hoveringOver {
	draw_sprite_ext(sprDesktopHover, 0, nearestAcceptableX, nearestAcceptableY, 1-squish, 1+squish, 0, c_white, 1);
}

if visible {
	var dx=x,
	dy=y;
	if hoveringOver dy+=wave(-2, 2, .5);
	drawScript(dx, dy);
}