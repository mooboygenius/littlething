if live_call() return live_result;

event_inherited();

var w=180,
h=ceil(w/4*3);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);
refreshPortSize();

var cx=portWidth div 2,
cy=portHeight div 2+40;
uploadButton=instance_create_depth(cx, cy, depth-1, promptButton);
with uploadButton {
	text="Select BG";
}
ds_list_add(children, uploadButton);