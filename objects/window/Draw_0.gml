if live_call() return live_result;

var bx=border[borders.left][0],
by=border[borders.top][0],
portX=bx+3,
portY=floor(by+10);
draw_sprite_stretched(sprite_index, 0, bx, by, windowWidth, windowHeight);

if surface_exists(backgroundSurface) {
	surface_resize(backgroundSurface, portWidth, portHeight);
	surface_set_target(backgroundSurface);
	draw_clear_alpha(0, 0);
	var t=current_time/100;
	draw_sprite_tiled(sprWindowBackground, 0, t, t);
	for (var i=0; i<ds_list_size(children); i++) {
		with children[| i] {
			x=xstart;
			y=ystart;
			event_perform(ev_draw, 0);
			x=xstart+other.x;
			y=ystart+other.y;
			visible=false;
		}
	}
	surface_reset_target();
	draw_surface(backgroundSurface, portX, portY);
} else {
	backgroundSurface=surface_create(portWidth, portHeight);
}

draw_set_font(fntSmaller);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var tx=ceil(x+3), ty=ceil(y+1),
c=BLACK_COLOR;
draw_text_color(tx, ty, name, c, c, c, c, 1);