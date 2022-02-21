if live_call() return live_result;

event_inherited();

var w=200,
h=ceil(200/16*9);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);

var inst=instance_create_depth(80, 80, depth-1, promptButton);
with inst {
	text="bongo";
}
ds_list_add(children, inst);