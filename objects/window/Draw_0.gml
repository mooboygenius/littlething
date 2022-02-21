if live_call() return live_result;

#region variable setup
var bx=border[borders.left][0],
by=border[borders.top][0],
portX=bx+3,
portY=floor(by+10);
#endregion

#region final surface
if surface_exists(finalSurf) {
	surface_resize(finalSurf, portWidth, portHeight);
	draw_surface(finalSurf, portX, portY);
	surface_set_target(finalSurf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
} else {
	finalSurf=surface_create(portWidth, portHeight);
}
#endregion

#region window frame
draw_sprite_stretched(sprite_index, 0, bx, by, windowWidth, windowHeight);
#endregion

#region children object surface
if surface_exists(childrenObjectSurf) {
	surface_resize(childrenObjectSurf, portWidth, portHeight);
	surface_set_target(childrenObjectSurf);
	draw_clear_alpha(0, 0);
	for (var i=0; i<ds_list_size(children); i++) {
		with children[| i] {
			drawScript(xstart, ystart);
		}
	}
	surface_reset_target();
	
} else {
	childrenObjectSurf=surface_create(portWidth, portHeight);
}
#endregion

#region background surface
if surface_exists(backgroundSurface) {
	surface_resize(backgroundSurface, portWidth, portHeight);
	surface_set_target(backgroundSurface);
	draw_clear_alpha(0, 0);
	var t=current_time/100;
	draw_sprite_tiled(sprWindowBackground, 0, t, t);
	surface_reset_target();
} else {
	backgroundSurface=surface_create(portWidth, portHeight);
}
#endregion

#region window name
draw_set_font(fntSmaller);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var tx=ceil(x+3), ty=ceil(y+1),
c=BLACK_COLOR;
draw_text_color(tx, ty, name, c, c, c, c, 1);
#endregion