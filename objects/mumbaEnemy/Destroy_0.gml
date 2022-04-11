if live_call() return live_result;

if hp<=0 {
	with mumbaPlayer {
		killCoolDown=60;
		show_debug_message("kill cooldown set");
	}
}