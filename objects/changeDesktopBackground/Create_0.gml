if live_call() return live_result;

event_inherited();

var w=200,
h=ceil(200/16*9);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);

var inst=instance_create_depth(150, 20, depth-1, promptButton);
var inst2=instance_create_depth(100, 40, depth-1, promptButton);
var inst3=instance_create_depth(50, 80, depth-1, windowCloseButton);
with inst {
	text="Change desktop BG";
}
with inst2 text="uhhh";
ds_list_add(children, inst);
ds_list_add(children, inst2);
ds_list_add(children, inst3);
lockSize=false;