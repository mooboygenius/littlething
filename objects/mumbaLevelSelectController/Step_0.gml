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
with mumba if state==0 canMove=true;
if hin!=0 || vin!=0 && canMove {
	
	if hin>0 {
		currentLevelA++;
		currentLevelB++;
	} else if hin<0 && currentLevelA>0 {
		currentLevelA--;
		currentLevelB--;
	} else if vin>0 {
		if currentLevelA<=0 {
			currentLevelA++;
		} else {
			currentLevelA--;
		}
		currentLevelB++;
	} else if vin<0 {
		currentLevelA++;
		currentLevelB--;
	}
	
	currentLevelA=clamp(currentLevelA, 0, array_length(levels)-1);
	currentLevelB=clamp(currentLevelB, 0, array_length(levels[currentLevelA])-1);
	
	
	var gx=0,
	gy=0;
	with levels[currentLevelA][currentLevelB][mumbaLevelData.mapObject] {
		gx=x;
		gy=y;
	}

	with mumba {
		timer=0;
		gotoX=gx;
		gotoY=gy;
	}
}