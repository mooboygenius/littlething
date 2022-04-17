if live_call() return live_result;

var xsc=xScale;

event_inherited();

#region strafe
if input(mumbaInputFire) {
	turnTowardsMovementDirection=false;
	xScale=lerp(xScale, sign(xsc), .5);
} else {
	turnTowardsMovementDirection=true;
}
#endregion

#region movement
if canControl {
	var hin=input(mumbaInputRight)-input(mumbaInputLeft),
	spd=2.66*hin;
	if hin!=0 && abs(horizontalSpeed)<.3 {
		squish=-.05;
	}
	horizontalSpeed=lerp(horizontalSpeed, spd, weight*2);
	
	if place_meeting(x, y+1, mumbaWall) {
		if abs(horizontalSpeed)>.5 {
			walkingTime++;
			if walkingTime%10==0 {
				createMumbaParticle(x-(sprite_xoffset-4)*sign(xScale), y+sprite_yoffset, mumbaDustParticle);
			}
		} else {
			walkingTime=0;
		}
		if jumpingTime>10 {
			for (var i=-1; i<=1; i++) {
				if i!=0 {
					createMumbaParticle(x+sprite_xoffset*i, y+sprite_yoffset, mumbaDustParticle);
				}
			}
		}
		jumpingTime=0;
	} else {
		jumpingTime++;
		var t=15;
		if verticalSpeed>0 t=8;
		if jumpingTime%t==0 {
			createMumbaParticle(x, y+sprite_yoffset, mumbaDustParticle);
		}
	}
	
	var vin=input(mumbaInputJump);
	if vin && place_meeting(x, y+1, mumbaWall) {
		verticalSpeed=-4;
		squish=-.25;
		for (var i=-1; i<=1; i++) {
			if i!=0 {
				createMumbaParticle(x+sprite_xoffset*i, y+sprite_yoffset, mumbaDustParticle);
			}
		}
	}
	
	if !vin && verticalSpeed<0 {
		verticalSpeed*=.6;
	}
}
#endregion

#region handle weapon
if canControl {
	playerData=noone;
	with parentWindow {
		other.playerData=playerData;
	}

	var swap=false;
	with playerData {
		//show_debug_message(concat("successfully accessing player data #", id, " from player object"));
		var in=input(mumbaInputWeaponDown, PRESS)-input(mumbaInputWeaponUp, PRESS);
		if in!=0 {
			currentGun+=in;
			var s=ds_list_size(gunInventory)-1;
			if currentGun<0 currentGun=s else if currentGun>s currentGun=0;
			swap=true;
		}
		other.myGunObject=gunInventory[| currentGun];
	}
	if swap {
		instance_destroy(myGunInstance);
	}

	var gunInstanceExists=instance_exists(myGunInstance);
	if (myGunObject && !gunInstanceExists) || (myGunObject && gunInstanceExists && myGunObject!=myGunInstance.object_index) {
		show_debug_message(concat("my new gun: ", object_get_name(myGunObject)));
		myGunInstance=instance_create_depth(x, y, depth, myGunObject);
		with myGunInstance {
			owner=other;
			depth=other.depth-1;
			grace=3;
			squish=-.3;
			angle=-20;
		}
		with parentWindow {
			if ds_list_find_index(children, other.myGunInstance)<0 {
				ds_list_add(children, other.myGunInstance);
			}
		}
	}
}
#endregion

#region handle UI
with parentWindow {
	if ds_list_find_index(children, other.myUI)<0 {
		ds_list_add(children, other.myUI);
	}
}

showUILerp=lerp(showUILerp, showUI, .2);

if DEV_MODE && input(vk_f2, PRESS) showUI=!showUI;

with myUI {
	showUI=other.showUILerp;
	playerReference=other;
	weaponReference=other.myGunInstance;
}

#region ui face sprite
var spr=uiSprite;
if grace>0 {
	uiSprite=sprMumbaUISad;
} else if killCoolDown>0 {
	if uiSprite!=sprMumbaUIKill && uiSprite!=sprMumbaUIPeter && uiSprite!=sprMumbaUICat && uiSprite!=sprMumbaUIConfused {
		if chance(.1) {
			uiSprite=choose(sprMumbaUIPeter, sprMumbaUICat, sprMumbaUIConfused);
		} else {
			uiSprite=sprMumbaUIKill
		}
	}
} else if coinCoolDown>0 {
	uiSprite=sprMumbaUIGetMoney;
} else {
	uiSprite=sprMumbaUINormal;
}
if uiSprite!=spr {
	with myUI {
		grace=2;
		bounceY=-8;
	}
}
#endregion

#endregion

#region sprites
if !place_meeting(x, y+1, mumbaWall) {
	if verticalSpeed>0 {
		if sprite_index==sprMumbaJump {
			show_debug_message("huh");
			setSprite(self, sprMumbaSwitchToFall);
		} else if sprite_index!=sprMumbaSwitchToFall {
			setSprite(self, sprMumbaFall);
		}
	} else {
		if sprite_index!=sprMumbaJump && sprite_index!=sprMumbaStartJump {
			setSprite(self, sprMumbaStartJump);
		}
	}
} else {
	if sprite_index=sprMumbaFall {
		setSprite(self, sprMumbaLand);
	} else if sprite_index!=sprMumbaLand {
		if abs(horizontalSpeed)>.5 {
			if sprite_index!=sprMumbaWalk {
				setSprite(self, sprMumbaStartWalk);
			}
		} else if sprite_index==sprMumbaWalk {
			setSprite(self, sprMumbaStopWalk);
		}
	}
}
#endregion

setCameraFocus(self);

killCoolDown--;
coinCoolDown--;