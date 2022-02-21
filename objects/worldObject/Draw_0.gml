if live_call() return live_result;
var dx=ceil(x),
dy=ceil(y),
dxs=image_xscale*xScale,
dys=image_yscale*yScale,
dang=angle+image_angle;
if grace>0 setSwapAmountShader(c_white, c_white, 1, 1);
draw_sprite_ext(sprite_index, image_index, dx, dy, dxs, dys, dang, image_blend, image_alpha);
shader_reset();