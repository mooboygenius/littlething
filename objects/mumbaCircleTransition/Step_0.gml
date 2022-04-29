if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	var width=1, height=1;
	with parentWindow {
		width=portWidth;
		height=portHeight;
	}
	
	if !surface_exists(darkSurf) {
		darkSurf=surface_create(width, height);
	}
	if surface_get_width(darkSurf)!=width || surface_get_height(darkSurf)!=height surface_resize(darkSurf, width, height);
	
	surface_set_target(darkSurf);
	
	draw_clear_alpha(BLACK_COLOR, 1);
	
	gpu_set_blendmode(bm_subtract);
	if circleSize>0 {
		draw_circle(circleX, circleY, circleSize, false);
	}
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_surface(darkSurf, 0, 0);
}

circleSize+=circleChange;
circleSize=max(circleSize, 0);

depth=-9999;

if destroyAtSize!=-1 {
	if (circleChange<0 && circleSize<destroyAtSize) || (circleChange>0 && circleSize>destroyAtSize) instance_destroy();
}