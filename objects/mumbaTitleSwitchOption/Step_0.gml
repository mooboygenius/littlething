if live_call() return live_result;

event_inherited();

defaultSwitchOptionScript=function() {
	/// @function defaultSwitchOptionScript()
	show_debug_message("aaa");
	current++;
	if current>=array_length(options) current=0;
	sprite_index=generateSprite(concat(name, ": ", options[current]), col, outlineCol, font, thick);
}

pressScript=function() {
	defaultSwitchOptionScript();
}