if live_call() return live_result;

if place_meeting(x, y+verticalSpeed, mumbaWall) && verticalSpeed>1 {
	verticalSpeed*=-.7;
	if verticalSpeed<-1 grace=2;
}
if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
	grace=5;
}
event_inherited();

if gameFrame%5==0 {
	xScale=wave(-1, 1, 1.2);
}

life--;
var t=120;
if (life%60==0 && life>t) || (life%5==0 && life<=t) {
	grace=2;
}
if life<=0 {
	instance_destroy();
}
if place_meeting(x, y, mumbaPlayer) hp=0;