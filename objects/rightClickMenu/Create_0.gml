if live_call() return live_result;

uniqueRightClickMenuOptions=-1;

options=-1;
enum optionData {label, selected, effect, funct, drawFunct}

defaultOptions=[
	createOption("Change BG", function() {
		with instance_create_depth(0, 0, 0, changeDesktopBackground) {
		
		}
		state=menuState.close;
		grace=5;
	}),

	createOption("Make new thing", function() {
		state=menuState.close;
		with instance_create_depth(x, y, depth-1, rightClickMenu) {
			var a=[
				createOption("Text doc", function() {
					with createNewFile(getMouseX(), getMouseY(), "", textDocument) state=fileState.rename;
					state=menuState.close;
				}),
				createOption("Pretty picture", function() {
					with createNewFile(getMouseX(), getMouseY(), "", paintDocument) state=fileState.rename;
					state=menuState.close;
				}),
				createOption("Shrimp")
			];
			setMenuOptions(a);
		}
	}),
	
	createOption("Close all", function() {
		state=menuState.close;
		with window state=windowStates.close;
	})
];

setMenuOptions(defaultOptions);

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

parent=noone;