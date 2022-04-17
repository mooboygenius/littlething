if live_call() return live_result;

if hp<=0 {
	with mumbaPlayer {
		killCoolDown=60;
		show_debug_message("kill cooldown set");
	}
	repeat(value) {
		var inst=instance_create_depth(x, y, depth-10, mumbaCoin);
		with inst {
			horizontalSpeed=other.horizontalKnockback*random_range(1.5, 2);
			verticalSpeed=-abs(horizontalSpeed)*random_range(2, 3);
			grace=5;
			squish=.5;
		}
		with parentWindow {
			ds_list_add(children, inst);
		}
	}
}