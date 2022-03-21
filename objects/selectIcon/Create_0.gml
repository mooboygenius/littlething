if live_call() return live_result;

event_inherited();

clickFunction=function() {
	playSound(sound, 0, 1);
	var spr=object_get_sprite(instrumentObject);
	with dragInstrument {
		sprite_index=spr;
		createObject=other.instrumentObject;
	}
}

drawScript=function(x, y) {
	if hoveringOver {
		setSwapAmountShader(c_white, c_white, 1, .5);
	}
	defaultDrawScript(x, y);
	shader_reset();
}