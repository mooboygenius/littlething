if live_call() return live_result;

children=ds_list_create();

event_inherited();

targetX=0;
targetY=0;

createMenuOption=function(str, c=WHITE_COLOR, oc=BLACK_COLOR, fnt=mumbaLevelFont, thickness=1) {
	/// @function createMenuOption(string, [color], [outlineColor], [font], [thickness])
	var inst=instance_create_depth(0, 0, 0, mumbaTitleOption);
	with inst {
		sprite_index=generateSprite(str, c, oc, fnt, thickness);
	}
	ds_list_add(children, inst);
	show_debug_message(concat("options: ", ds_list_size(children)));
}

drawScript=function(x, y) {}

enum menuHAlign {center, left, right}
menuHorizontalAlignment=0;