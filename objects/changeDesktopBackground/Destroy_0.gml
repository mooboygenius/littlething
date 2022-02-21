if live_call() return live_result;

event_inherited();

for (var i=0; i<ds_list_size(children); i++) {
	instance_destroy(children[| i]);
}
ds_list_destroy(children);