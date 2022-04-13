if live_call() return live_result;

event_inherited();

var w=0, h=0;
with parentWindow {
	show_debug_message("huhhh");
	if !ds_list_find_index(children, other.title) {
		ds_list_add(children, other.title);
	}
	w=portWidth;
	h=portHeight;
}

with title {
	drawX=w div 2;
	drawY=h div 2;
	depth=-1000;
}