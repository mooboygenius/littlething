if live_call() return live_result;

event_inherited();

var w=170,
h=w div 4*3;
setWindowSize(self, x, y, w, h);
urlBar=instance_create_depth(-100, -100, depth-1, fireShrimpAddressBar)