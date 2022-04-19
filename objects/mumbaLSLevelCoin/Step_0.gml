if live_call() return live_result;

event_inherited();

with decor {
	x=other.x;
	y=other.y-other.sprite_yoffset-sprite_yoffset;
	z=other.z
}

for (var i=0; i<array_length(nextCoins); i++) {
	if is_undefined(ds_list_find_value(dots, i)) {
		show_debug_message(concat(id, " added new list to dots: ", i));
		ds_list_add(dots, ds_list_create());
		
		var nx=x, ny=y;
		with nextCoins[i] {
			show_debug_message(concat("next coin: ", id));
			nx=x;
			ny=y;
			show_debug_message(concat("next x: ", nx, ", next y: ", ny));
		}
		var distance=point_distance(x, y, nx, ny),
		dir=point_direction(x, y, nx, ny),
		n=0,
		a=6,
		ad=distance/(a+1),
		ax=x,
		ay=y;
		
		show_debug_message(concat("distance: ", distance, "; direction: ", dir));
		
		repeat(a) {
			ax+=lengthdir_x(ad, dir);
			ay+=lengthdir_y(ad, dir);
			ds_list_add(dots[| i], instance_create_depth(ax, ay, depth+10, mumbaLSDot));
			with dots[| i][| n] {
				gotoX=ax;
				gotoY=ay;
				show_debug_message(concat(id, ": ", gotoX, ", ", gotoY));
			}
			if !instance_exists(parentWindow) parentWindow=instance_nearest(0, 0, mumbaWindow);
			with parentWindow {
				show_debug_message("GAAAAAA");
				ds_list_add(children, other.dots[| i][| n]);
			}
			n++;
		}
	}
}

for (var i=0; i<ds_list_size(dots); i++) {
	for (var q=0; q<ds_list_size(dots[| i]); q++) {
		//show_debug_message(concat("[", i, ", ", z, "] ", instance_exists(dots[| i][| z])));
		var inst=dots[| i][| q];
		with inst {
			z=other.z+wave(-2, 2, 1, x/2+y/100);
		}
	}
}