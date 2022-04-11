if live_call() return live_result;

event_inherited();

xScale=1;
life--;
if coolOff<=0 {
	var list=ds_list_create(),
	instances=instance_place_list(x, y, mumbaLivingObject, list, false);
	for (var i=0; i<instances; i++) {
		if list[| i].object_index!=mumbaPlayer {
			hurt(list[| i], damage);
			with list[| i] {
				var m=.2;
				horizontalKnockback=other.horizontalSpeed*m;
				verticalKnockback=other.verticalSpeed*m;
			}
			if penetrates {
				coolOff=10;
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