if live_call() return live_result;

sprite_index=sprFilledWindowFrame;

event_inherited();

setWindowSize(self, 0, 0, 200, 160);
centerWindow(self);

globalvar mumbaRooms;
mumbaRooms=ds_list_create();

//level=instance_create_depth(0, 0, depth-irandom(10), mumbaTestLevel);
//ds_list_add(children, level);

title=instance_create_depth(0, 0, 0, mumbaTitleController);
ds_list_add(children, title);

//shop=instance_create_depth(0, 0, 0, mumbaShopController);
//ds_list_insert(children, 0, shop);

//levelSelect=instance_create_depth(0, 0, 0, mumbaLevelSelectController);
//ds_list_add(children, levelSelect);

playerData=instance_create_depth(0, 0, 0, mumbaPlayerData);
ds_list_insert(children, 0, playerData);

cameraX=0;
cameraY=0;
cameraTargetX=0;
cameraTargetY=0;
cameraSpeed=.3;
cameraShake=0;
cameraKick=0;
cameraKickDirection=0;
cameraFocus=noone;
cameraLeftLimit=9999;
cameraRightLimit=-9999;
cameraTopLimit=9999;
cameraBottomLimit=-9999;

particleSystem=part_system_create();
part_system_depth(particleSystem, 0);
part_system_automatic_draw(particleSystem, false);

globalvar mumbaDustParticle;
mumbaDustParticle=part_type_create();
part_type_sprite(mumbaDustParticle, sprMumbaDust, false, false, true);
part_type_orientation(mumbaDustParticle, 0, 360, 5, 0, false);
part_type_size(mumbaDustParticle, 1.2, 1.33, -.03, 0);
part_type_direction(mumbaDustParticle, 90, 90, 0, 10);
part_type_speed(mumbaDustParticle, .5, .6, -.01, 0);

globalvar mumbaExplosionParticle;
mumbaExplosionParticle=part_type_create();
part_type_sprite(mumbaExplosionParticle, sprMumbaExplosion, true, false, true);
part_type_size(mumbaExplosionParticle, .9, 1.3, -.1, .01);
part_type_life(mumbaExplosionParticle, 10, 15);

globalvar mumbaMagicParticle;
mumbaMagicParticle=part_type_create();
part_type_sprite(mumbaMagicParticle, sprMumbaMagicParticle, false, false, true);
part_type_life(mumbaMagicParticle, 10, 20);
part_type_size(mumbaMagicParticle, 1, 1, -.02, 0);
part_type_orientation(mumbaMagicParticle, 0, 360, 4, 0, false);
part_type_color_hsv(mumbaMagicParticle, 0, 255, 255, 255, 255, 255);

handleChildren=function() {
	/// @function handleChildren()
	if ds_exists(children, ds_type_list) {
		for (var i=0; i<ds_list_size(children); i++) {
			with children[| i] {
				visible=false;
				parentWindow=other;
			}
			if !instance_exists(children[| i]) {
				show_debug_message(concat("cleared #", i, " from children objects list, instance was deleted"));
				ds_list_delete(children, i);
			}
		}
	}
}