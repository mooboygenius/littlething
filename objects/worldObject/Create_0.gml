if live_call() return live_result;

defaultDrawScript=function(x, y) {
	/// @function defaultDrawScript(x, y)
	var dx=ceil(x),
	dy=ceil(y),
	dxs=image_xscale*xScale+squish,
	dys=image_yscale*yScale-squish,
	dang=angle+image_angle;
	if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
	draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
	shader_reset();
}

drawScript=function(x, y) {
	/// @function drawScript(x, y)
	defaultDrawScript(x, y);
}

drawShadowScript=function(x, y) {
	/// @function drawShadowScript(x, y)
	drawScript(x, y);
}

uniqueRightClickMenuOptions=-1;