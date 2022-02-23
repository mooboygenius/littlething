if live_call() return live_result;
for (var i=0; i<array_length(butt); i++) {
	instance_destroy(butt[i]);
}
for (var i=0; i<ds_list_size(children); i++) {
	instance_destroy(children[| i]);
}
ds_list_destroy(children);