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
	clickFunction=function() {
		if live_call() return live_result;
		var file=get_open_filename_ext("choose a .png or .jpg dude!!|*.png;*.jpg", "", "Downloads", "CHOOSE AN IMAGE!!");
		show_debug_message(file);
		if file!="" {
			//var newSprite=sprite_add(file )
		}
	}
}
ds_list_add(children, uploadButton);