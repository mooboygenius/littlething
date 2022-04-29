if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	setSwapAmountShader(c_red, c_white, 1, min(anger, .5));
	defaultDrawScript(x, y);
}