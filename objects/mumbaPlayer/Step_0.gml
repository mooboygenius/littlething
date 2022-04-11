if live_call() return live_result;

event_inherited();

#region movement
if canControl {
	var hin=input(mumbaInputRight)-input(mumbaInputLeft),
	spd=2.66*hin;
	horizontalSpeed=lerp(horizontalSpeed, spd, weight*2);
	
	var vin=input(mumbaInputJump);
	if vin && place_meeting(x, y+1, mumbaWall) {
		verticalSpeed=-4;
		squish=-.25;
	}
	
	if !vin && verticalSpeed<0 {
		verticalSpeed*=.6;
	}
}
#endregion

#region handle weapon
playerData=noone;
with parentWindow {
	other.playerData=playerData;
}
with playerData {
	//show_debug_message(concat("successfully accessing player data #", id, " from player object"));
	other.myGunObject=gunInventory[| currentGun];
}

var gunInstanceExists=instance_exists(myGunInstance);
if (myGunObject && !gunInstanceExists) || (myGunObject && gunInstanceExists && myGunObject!=myGunInstance.object_index) {
	show_debug_message(concat("my new gun: ", object_get_name(myGunObject)));
	myGunInstance=instance_create_depth(x, y, depth, myGunObject);
	with myGunInstance {
		owner=other;
		depth=other.depth-1;
	}
	with parentWindow {
		if ds_list_find_index(children, other.myGunInstance)<0 {
			ds_list_add(children, other.myGunInstance);
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

with myUI {
	playerReference=other;
	weaponReference=other.myGunInstance;
}
#endregion

#region sprites
if !place_meeting(x, y+1, mumbaWall) {
	if verticalSpeed>0 {
		show_debug_message(current_time);
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