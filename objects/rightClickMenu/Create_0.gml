if live_call() return live_result;

options=-1;
enum optionData {label, selected, effect, funct, drawFunct}
createOption=function(label, func=function() {}, drawFunction=function() {}) {
	/// @function createOption(label, [function], [drawFunction])
	var n=0;
	if is_array(options) n=array_length(options);
	options[n]=[label, false, 0, func, drawFunction];
}

createOption("Change BG", function() {
	instance_create_depth(0, 0, 0, changeDesktopBackground);
	state=menuState.close;
	grace=5;
});
createOption("Donkey");
createOption("Diaper man");

draw_set_font(fntSystem);
numberOfOptions=array_length(options);
lineBreakHeight=14;
windowPadHeight=4;
windowPadWidth=ceil(windowPadHeight*1.25);
windowHeight=windowPadHeight*2+lineBreakHeight*numberOfOptions;
var maxWidth=32;
for (var i=0; i<array_length(options); i++) {
	maxWidth=max(string_width(options[i][optionData.label]));
}
windowWidth=windowPadWidth*2+maxWidth;
state=0;
appeared=0;
grace=8;
waveIntensity=4;
ditherIndex=sprite_get_number(sprDither);

windowSurface=-1;
passSurface1=-1;
passSurface2=-1;
passSurface3=-1;
mouseIsInMenu=false;

x=floor(x);
y=floor(y);

life=0;