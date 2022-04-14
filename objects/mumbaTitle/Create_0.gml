if live_call() return live_result;

event_inherited();

drawX=0;
drawY=0;

drawScript=function(x, y) {
	defaultDrawScript(drawX, drawY);
}

timer=0;

state=0;