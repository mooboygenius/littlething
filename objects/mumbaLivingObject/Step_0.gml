if live_call() return live_result;

event_inherited();

if hp<=0 {
	die();
}

if place_meeting(x, y, mumbaPlayer) hurt(mumbaPlayer, 1);