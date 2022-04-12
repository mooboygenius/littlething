function drawTextOutlinedBasic(x, y, str, color=c_white, outlineColor=BLACK_COLOR, xScale=1, yScale=1, angle=0) {
	draw_set_color(outlineColor);
	draw_text_transformed(x-1, y, str, xScale, yScale, angle);
	draw_text_transformed(x, y-1, str, xScale, yScale, angle);
	draw_text_transformed(x+1, y, str, xScale, yScale, angle);
	draw_text_transformed(x, y+1, str, xScale, yScale, angle);
	draw_set_color(color);
	draw_text_transformed(x, y, str, xScale, yScale, angle);
	draw_set_color(c_white);
}