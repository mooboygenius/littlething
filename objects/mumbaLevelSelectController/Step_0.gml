if live_call() return live_result;

event_inherited();

for (var i=0; i<ds_list_size(children); i++) {
	var inst=children[| i];
	with inst {
		owner=other;
	}
	with parentWindow {
		if ds_list_find_index(children, inst)<0 {
			show_debug_message(concat("added #", i, " to parent window"));
			ds_list_insert(children, 0, inst);
		}
	}
}

positionLevels();

with mumba {
	setCameraFocus(self);
	z=-22;
}

var hin=input(mumbaInputRight, PRESS)-input(mumbaInputLeft, PRESS),
vin=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS),
canMove=false;
with mumba {
	if state==0 && horizontalSpeed==0 && verticalSpeed==0 {
		canMove=true;
	}
}

if (hin!=0 || vin!=0) && canMove {
	
	var move=true;
	if abs(hin)>0 && sign(hin)!=sign(mumba.xScale) {
		mumba.squish=-.2;
		mumba.targetXScale*=-1;
		move=false;
	}
	
	
	var xa=0;
	with mumba xa=sign(targetXScale);
	var prevA=currentLevelA;
	if move currentLevelA+=xa;
	currentLevelA=clamp(currentLevelA, 0, array_length(levels)-1);
	if prevA!=currentLevelA currentLevelB+=vin;
	currentLevelB=clamp(currentLevelB, 0, array_length(levels[currentLevelA])-1);
	
	
	var gx=0,
	gy=0;
	
	with mumbaLSLevelCoin {
		active=false;
	}
	
	with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
		gx=x;
		gy=y;
		active=true;
	}

	with mumba {
		timer=0;
		gotoX=gx;
		gotoY=gy;
	}
}