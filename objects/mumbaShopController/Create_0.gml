if live_call() return live_result;

event_inherited();

children=ds_list_create();

background=instance_create_depth(0, 0, 100, mumbaBackground);
with background {
	sprite_index=sprMumbaPlaceholderShopBackground;
}

keeper=instance_create_depth(0, 0, -100, mumbaShopkeeper);
with keeper {
	
}

mumber=instance_create_depth(0, 0, -100, mumbaInShop);
with mumber {
	
}

generateShopList=function() {
	/// @function generateShopList([str1], [str2], [str3]...)
	for (var i=0; i<argument_count; i++) {
		if ds_map_exists(mumbaItems, argument[i]) {
			
		} else {
			show_debug_message(concat(argument[i], " is not a real item"));
		}
	}
}

menuItems=ds_list_create();
repeat(5) { 
	thingy=instance_create_depth(0, 0, 0, mumbaShopItem);
	ds_list_add(menuItems, thingy);
	ds_list_add(children, thingy);
}

ds_list_add(children, background, keeper, mumber);

state=0;

currentSelection=-1;