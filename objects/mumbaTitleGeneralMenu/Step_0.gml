if live_call() return live_result;

event_inherited();

for (var i=0; i<ds_list_size(children); i++) {
	with children[| i] {
		drawX+=wave(-1, 1, 1, i*.15)*3;
	}
}