if live_call() return live_result;

event_inherited();

var w=180,
h=ceil(w/4*3);
setWindowSize(self, 0, 0, w, h);
centerWindow(self);
refreshPortSize();

urlInput="";
substate=0;
defaultDescriptionText="paste a url (CTRL+V) for an\nimage below to use as\nur Shrimptop Background!:";
descriptionText=defaultDescriptionText;
image=sprShrimpDance;
loadImage=noone;