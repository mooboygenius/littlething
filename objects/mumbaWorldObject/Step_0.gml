if live_call() return live_result;

event_inherited();

useMumbaPhysics();

xstart=x;
ystart=y;

if horizontalSpeed!=0 {
	xScale=lerp(xScale, sign(horizontalSpeed), .25);
}