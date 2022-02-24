if live_call() return live_result;

// Inherit the parent event
event_inherited();

previousHovering=false;
fileName="shrimp.txt";

fileDrawScript=function(x, y) {
	/// @function fileDrawScript(x, y)
	draw_set_font(fntSmaller);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	var tx=x, ty=y+16;
	var c=BLACK_COLOR;
	draw_text_color(tx, ty, fileName, c, c, c, c, 1);
}

drawScript=function(x, y) {
	defaultDrawScript(x, y);
	fileDrawScript(x, y);
}

holdTimer=0;

nearestAcceptableX=x;
nearestAcceptableY=y;

#macro DESKTOP_FILE_OFFSET_X -8
#macro DESKTOP_FILE_OFFSET_Y -16
#macro DESKTOP_FILE_SHIFT_X 32
#macro DESKTOP_FILE_SHIFT_Y 40