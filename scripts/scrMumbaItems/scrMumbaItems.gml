globalvar mumbaItems;
mumbaItems=ds_map_create();

function createMumbaItem(nm, ass, desc, skdesc, smallspr, bigspr, price, shortName="") {
	/// @function createMumbaItem(name, associatedObject, description, shopKeeperDescription, smallSprite, bigSprite, price, [shortName])
	if shortName=="" shortName=nm;
	ds_map_add(mumbaItems, nm, ds_map_create());
	var map=mumbaItems[? nm];
	ds_map_add(map, "name", nm);
	ds_map_add(map, "object", ass);
	ds_map_add(map, "description", desc);
	ds_map_add(map, "shopKeeperDescription", skdesc);
	ds_map_add(map, "smallSprite", smallspr);
	ds_map_add(map, "bigSprite", bigspr);
	ds_map_add(map, "price", price);
	ds_map_add(map, "shortName", shortName);
}

function getMumbaItemMap(name) {
	if ds_map_exists(mumbaItems, name) {
		return mumbaItems[? name];
	}
	return noone;
}

function getMumbaItemObject(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "object"];
}

function getMumbaItemDescription(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "description"];
}

function getMumbaItemShopKeeperDescription(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "shopKeeperDescription"];
}

function getMumbaItemSmallSprite(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "smallSprite"];
}

function getMumbaItemBigSprite(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "bigSprite"];
}

function getMumbaItemPrice(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "price"];
}

function getMumbaItemShortName(name) {
	var m=getMumbaItemMap(name);
	if m return m[? "shortName"];
}

createMumbaItem("Gun", mumbaGun, "Mumba's iconic gun!", "Looks sexy.", sprMumbaGun, sprMumbaGunUI, 0);
createMumbaItem("Coconut Shotgun", mumbaCoconutShotgun, "Fires bouncy coconuts!", "Ooh -- the Coconut Shotgun! Do you like it?", sprMumbaCoconutShotgun, sprMumbaCoconutShotgunUI, 20, "Coco. S.Gun");
createMumbaItem("Tiki Gun", mumbaTikiGun, "High fire rate!", "The world-famous Tiki Gun! I carved it myself, you know.", sprMumbaTikiGun, sprMumbaTikiGunUI, 20);
createMumbaItem("Burger Cannon", mumbaBurgerCannon, "Shoots heavy burger projectiles!", "Ugh... Do you REALLY want THAT?...", sprMumbaBurgerCannon, sprMumbaBurgerCannonUI, 30, "Burg Cannon");
createMumbaItem("Fry Crossbow", mumbaFryCrossbow, "Fires penetrating fry arrows!", "Are you gonna something -- like -- edible?...", sprMumbaFryCrossbow, sprMumbaFryCrossbowUI, 30, "Fry C.Bow");
createMumbaItem("Flamethrower", mumbaFlameThrower, "Blasts clouds of fire at enemies!", "Y'want it? Or is it too hot to handle for ya?", sprMumbaFlameThrower, sprMumbaFlameThrowerUI, 40);
createMumbaItem("Devil's Pitchfork", mumbaPitchfork, "Quickly stabs at a close range!", "Woah! Talk about SHARP, man!", sprMumbaPitchfork, sprMumbaPitchforkUI, 40, "Devil P.Fork");
createMumbaItem("Holy Bow", mumbaHolyBow, "Fires three arrows at once!", "Be careful where you point that thing, little dude.", sprMumbaHolyBow, sprMumbaHolyBowUI, 50);
createMumbaItem("Magic Harp", mumbaMagicHarp, "Shoots music notes in all directions!", "Good luck playing this without any fingers.", sprMumbaMagicHarp, sprMumbaMagicHarpUI, 50);
createMumbaItem("Flower", mumbaFlower, "Fires a barrage of low-damage seeds!", "", sprMumbaFlower, sprMumbaFlowerUI, 30);
createMumbaItem("Boomerang", mumbaBoomerang, "What goes around comes around!", "", sprMumbaBoomerang, sprMumbaBoomerangUI, 30);
createMumbaItem("Ice Axe", mumbaIceAxe, "Swings at enemies with a heavy force!", "Oh... You want t-that old t-thing?...", sprMumbaIceAxe, sprMumbaIceAxeUI, 40);
createMumbaItem("Snowman's Head", mumbaSnowman, "Vomits snowballs everywhere!", "H-He's cute once you g-get past the puking...", sprMumbaSnowman, sprMumbaSnowmanUI, 40, "S.Man Head");
createMumbaItem("Peter the Ant", mumbaPeter, "Peter the Ant!", "Cute, right?!", sprMumbaPeter, sprMumbaPeterUI, 50, "Peter");
createMumbaItem("The Fungus", mumbaMushroom, "A fungus among us.", "Eat it, it's really good!", sprMumbaMushroom, sprMumbaMushroomUI, 50, "Fungus");