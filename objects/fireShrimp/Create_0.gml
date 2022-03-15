if live_call() return live_result;

event_inherited();

var w=170,
h=w div 4*3;
setWindowSize(self, x, y, w, h);
urlBar=instance_create_depth(-100, -100, depth-1, fireShrimpAddressBar);
homeButton=instance_create_depth(-100, -100, depth-1, fireShrimpHomeButton);
with homeButton {
	parentWindow=other;
}
with urlBar {
	parentWindow=other;
}

createNewPage=function(object) {
	/// @function createNewPage(object)
	with instance_create_depth(x, y, depth, object) {
		depth=other.depth;
		setWindowSize(self, x, y, other.windowWidth, other.windowHeight);
		windowScale=1;
		state=windowStates.idle;
	}
	instance_destroy();
}