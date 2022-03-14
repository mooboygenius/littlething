if live_call() return live_result;

event_inherited();

var w=180,
h=ceil(w/4*3);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);
refreshPortSize();

substate=0;
image=sprShrimpDance;

backgrounds=-1;

addBackground=function(sprite) {
	/// @function addBackground(sprite)
	var n=0;
	if is_array(backgrounds) n=array_length(backgrounds);
	var inst=instance_create_depth(0, 0, depth-10, backgroundButton);
	with inst {
		sprite_index=sprite;
	}
	backgrounds[n]=inst;
	ds_list_add(children, inst);
}

addBackground(sprDesktopBackground3);
addBackground(sprDesktopBackground1);
addBackground(sprDesktopBackground2);