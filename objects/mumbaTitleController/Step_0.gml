if live_call() return live_result;

event_inherited();

var w=0, h=0;
with parentWindow {
	//show_debug_message("huhhh");
	if !ds_list_find_index(children, other.title) {
		ds_list_add(children, other.title);
	}
	w=portWidth;
	h=portHeight;
}

drawScript=function(x, y) {
	var w=1, h=1;
	with parentWindow {
		//show_debug_message("huhhh");
		if !ds_list_find_index(children, other.title) {
			ds_list_add(children, other.title);
		}
		w=portWidth;
		h=portHeight;
	}
	
	if !surface_exists(surf1) surf1=surface_create(w, h);
	if !surface_exists(surf2) surf2=surface_create(w, h);
	if surface_exists(surf1) && surface_exists(surf2) {
		if surface_get_width(surf1)!=w || surface_get_width(surf1)!=h surface_resize(surf1, w, h);
		if surface_get_width(surf2)!=w || surface_get_width(surf2)!=h surface_resize(surf2, w, h);
		
		var c1=$E8FFF5,
		c2=$70AEFF,
		c3=BLACK_COLOR,
		c=c3;
		draw_clear_alpha(c, 1);
		
		surface_set_target(surf1);
		draw_clear_alpha(0, 0);
		surface_reset_target();
		surface_set_target(surf2);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	
		var tx1=w div 2,
		ty1=h div 2,
		a=360 div 12,
		a2=a-3,
		l=200,
		d=2,
		s=0,
		gf=gameFrame*.7;
		
		for (var i=0; i<360; i+=a) {
			if s%2==0 && surface_exists(surf1) {
				surface_set_target(surf1);
			} else if surface_exists(surf2) {
				surface_set_target(surf2);
			}
			var ma=(i-gf);
			show_debug_message(i);
			var mtx1=tx1+lengthdir_x(d, ma),
			mty1=ty1+lengthdir_y(d, ma),
			tx2=mtx1+lengthdir_x(l, ma),
			ty2=mty1+lengthdir_y(l, ma),
			tx3=mtx1+lengthdir_x(l, ma+a2),
			ty3=mty1+lengthdir_y(l, ma+a2);
			draw_triangle(mtx1, mty1, tx2, ty2, tx3, ty3, false);
			s++;
			surface_reset_target();
		}
		
		gpu_set_colorwriteenable(true, true, true, false);
		setWaveShader(w, h, .1, .1, gameFrame*2);
		surface_set_target(surf1);
		draw_sprite(sprMumbaTitleBackground1, 0, 0, 0);
		surface_reset_target();
		
		surface_set_target(surf2);
		draw_sprite(sprMumbaTitleBackground2, 0, 0, 0);
		surface_reset_target();
		shader_reset();
		gpu_set_colorwriteenable(true, true, true, true);
		
		draw_surface(surf1, 0, 0);
		draw_surface(surf2, 0, 0);
	}
}