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
		a=8,
		ad=distance/(a),
		ax=x,
		ay=y;
		
		show_debug_message(concat("distance: ", distance, "; direction: ", dir));
		
		var md=16;
		repeat(a) {
			ax+=lengthdir_x(ad, dir);
			ay+=lengthdir_y(ad, dir);
			if point_distance(ax, ay, x, y)>md && point_distance(ax, ay, nx, ny)>md {
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
	
if active {
	var playerIsOn=false;
	with mumbaLSMumba {
		if state==0 && point_distance(x, y, other.x, other.y)<16 playerIsOn=true;
	}
	if playerIsOn {
		timer++;
		if timer%20==0 grace=2;
		if !instance_exists(coolName) {
			coolName=instance_create_depth(0, 0, -1000, mumbaLSDetails);
			with coolName {
				sprite_index=generateSprite(other.name);
			}
			with parentWindow {
				if ds_list_find_index(children, other.coolName)<0 {
					ds_list_add(children, other.coolName);
				}
			}
		}
	}
} else {
	if instance_exists(coolName) {
		with coolName {
			if state<levelSelectDetailStates.destroy state=levelSelectDetailStates.destroy;
		}
	}
	timer=0;
}