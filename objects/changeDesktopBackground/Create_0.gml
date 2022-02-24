if live_call() return live_result;

event_inherited();

var w=180,
h=ceil(w/4*3);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);
refreshPortSize();

substate=0;
image=sprShrimpDance;