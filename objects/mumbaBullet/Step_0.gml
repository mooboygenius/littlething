if live_call() return live_result;

hitEnemy=false;

event_inherited();

xScale=1;
life--;
if coolOff<=0 {
	var list=ds_list_create(),
	instances=instance_place_list(x, y, mumbaLivingObject, list, false);
	for (var i=0; i<instances; i++) {
		if list[| i].object_index!=mumbaPlayer {
			hitEnemy=true;
			hurt(list[| i], damage);
			if list[| i].maximumHp>1 {
				var d=90+random_range(-1, 1)*30,
				spd=2,
				h=lengthdir_x(spd, d),
				v=lengthdir_y(spd, d);
				with createMumbaTextEffect(x, y, concat("-", damage), $7B2FCC, BLACK_COLOR, 30, h, v, .1) {
					squish=-.5;
					grace=3;
					minimumLife=10;
					angle=random_range(-1, 1)*10;
				}
			}
			with list[| i] {
				var m=.2;
				horizontalKnockback=other.horizontalSpeed*m;
				verticalKnockback=other.verticalSpeed*m;
			}
			if penetrates || list[| i].passThrough {
				coolOff=5;
			} else {
				life=-1;
			}
		}
	}
}

coolOff--;

if place_meeting(x, y, mumbaWall) || life<0 {
	instance_destroy();
}