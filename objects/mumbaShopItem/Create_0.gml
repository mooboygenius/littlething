if live_call() return live_result;

#macro WHITE_COLOR $E8FFF5

event_inherited();

purchaseScript=function() {
	/// @function purchaseScript()
	/// do nothing
}

active=false;

defaultColor=$B8A44F;

itemXScale=1;

textYOffset=0;

buyText="";
cantBuyText="";
outOfStockText="";

buyWeapon=function() {
	/// @function buyWeapon(name)
	var obj=getMumbaItemObject(longName);
	with mumbaShopController {
		boughtSomething=true;
	}
	with mumbaPlayerData {
		if obj { 
			ds_list_add(gunInventory, obj);
		}
	}
}

leaveShop=function() {
	/// @function leaveShop()
	with mumbaShopController {
		leaving=true;
	}
}

buyScript=function() {
	/// @function buyScript()
}