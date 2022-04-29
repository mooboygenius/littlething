if live_call() return live_result;

event_inherited();

var fnt=fntSystem;

with createMenuOption("MASTER GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
}

with createMenuOption("MUSIC GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
}


with createMenuOption("SOUND GAIN", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitleSwitchOption) {
	options=["100%", "75%", "50%", "25%", "0%"];
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
}

with createMenuOption("BACK", WHITE_COLOR, BLACK_COLOR, fnt, 1, mumbaTitlePressableOption) {
	pressScript=function() {
		with owner {
			throwOptions();
		}
		var inst=instance_create_depth(0, 0, owner.depth, mumbaTitleSettings),
		tx=owner.targetX,
		ty=owner.targetY;
		with inst {
			targetX=tx;
			targetY=ty;
			drawX=targetX+100;
			drawY=targetY;
		}
		with parentWindow {
			ds_list_insert(children, 0, inst);
		}
	}
}