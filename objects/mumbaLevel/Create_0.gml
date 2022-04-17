if live_call() return live_result;

separationWidth=sprite_get_width(sprMumbaWall);
separationHeight=sprite_get_height(sprMumbaWall);

generateLevelMapArray=function(arr) {
	/// @function generateLevelMapArray(arrayOfStrings)
	var xx=0,
	yy=0;
	for (var i=0; i<array_length(arr); i++) {
		var txt=arr[i];
		levelMap[yy]=[];
		for (var z=1; z<=string_length(txt); z++) {
			var char=string_char_at(txt, z);
			if string_length(string_digits(char))>0 {
				levelMap[yy][xx]=real(char);
				xx++;
			}
		}
		xx=0;
		show_debug_message(concat("parsed array ", yy));
		yy++;
	}
	
	// get longest array
	var l=0;
	for (var i=0; i<array_length(levelMap); i++) {
		var pl=l;
		l=max(l, array_length(levelMap[i]));
		if pl!=l show_debug_message(concat("new longest array is ", l));
	}
	
	show_debug_message(concat("longest array is ", l));
	
	// size up all arrays to be that long
	for (var i=0; i<array_length(levelMap); i++) {
		while (array_length(levelMap[i])<l) {
			levelMap[i][array_length(levelMap[i])]=0;
		}
		show_debug_message(concat("resized array ", i, " to ", array_length(levelMap[i])));
	}
}

event_inherited();

children=ds_list_create();

levelInstances=ds_list_create();

background=instance_create_depth(0, 0, 0, mumbaBackground);
ds_list_insert(children, 0, background);

generateMap=function() {
	/// @function generateMap()
	if ds_exists(levelInstances, ds_type_list) {
		for (var i=0; i<ds_list_size(levelInstances); i++) {
			with levelInstances[| i] instance_destroy();
		}
		ds_list_destroy(levelInstances);
		levelInstances=ds_list_create();
	}
	
	
	var height=array_length(levelMap)-1;
	for (var yy=0; yy<array_length(levelMap); yy++) {
		var width=array_length(levelMap[yy])-1;
		for (var xx=0; xx<array_length(levelMap[yy]); xx++) {
			var a=levelMap[yy][xx],
			inst=noone,
			tx=xx*separationWidth,
			ty=yy*separationHeight;
			
			switch a {
				// nothing
				case 0: break;
				
				// wall
				case 1:
					var left=xx>0 && levelMap[yy][xx-1]==1,
					up=yy>0 && levelMap[yy-1][xx]==1,
					right=xx<width && levelMap[yy][xx+1]==1,
					down=yy<height && levelMap[yy+1][xx]==1;
					if !(left && up && right && down) {
						inst=instance_create_depth(tx, ty, -10, mumbaWall);
					}
				break;
				
				// player
				case 2:
					player=instance_create_depth(tx, ty, -20, mumbaPlayer);
					inst=player;
				break;
				
				// enemies
				case 3: inst=instance_create_depth(tx, ty, -20, mumbaEnemy) break;
			}
			
			if instance_exists(inst) {
				ds_list_insert(children, 0, inst);
				ds_list_insert(levelInstances, 0, inst);
			}
		}
	}
	
	tileMapHeight=array_length(levelMap);
	tileMapWidth=array_length(levelMap[0]);
	tileSize=16;
	tileSurfaceWidth=tileMapWidth*tileSize;
	tileSurfaceHeight=tileMapHeight*tileSize;
	if surface_exists(tileSurface) {
		surface_set_target(tileSurface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
		surface_free(tileSurface);
	}
	tileSurface=surface_create(tileSurfaceWidth, tileSurfaceHeight);

	surface_set_target(tileSurface);
	draw_clear_alpha(0, 0);
	var height=array_length(levelMap)-1;
	for (var yy=0; yy<array_length(levelMap); yy++) {
		var width=array_length(levelMap[yy])-1;
		for (var xx=0; xx<array_length(levelMap[yy]); xx++) {
			if levelMap[yy][xx]==1 {
				var in=14,
				left=xx>0 && levelMap[yy][xx-1]==1,
				up=yy>0 && levelMap[yy-1][xx]==1,
				right=xx<width && levelMap[yy][xx+1]==1,
				down=yy<height && levelMap[yy+1][xx]==1,
				leftUp=xx>0 && yy>0 && levelMap[yy-1][xx-1]==1,
				rightUp=xx<width && yy>0 && levelMap[yy-1][xx+1]==1,
				leftDown=xx>0 && yy<height && levelMap[yy+1][xx-1]==1,
				rightDown=xx<width && yy<height && levelMap[yy+1][xx+1]==1;
			
				if !left && !up && right && down {
					if rightDown {
						in=1;
					} else {
						in=5;
					}
				} else if left && !up && right && down {
					if rightDown && leftDown {
						in=2;
					} else if !rightDown && leftDown {
						in=6;
					} else if rightDown && !leftDown {
						in=7;
					} else {
						in=9;
					}
				} else if left && !up && !right && down {
					if leftDown {
						in=3;
					} else {
						in=8;
					}
				} else if !left && !right {
					if !up && down {
						in=4;
					} else if up && down {
						in=16;
					} else if up && !down {
						in=28;
					} else if !up && !down {
						in=40;
					}
				} else if !left && up && right && down {
					if rightUp && rightDown {
						in=13;
					} else if !rightUp && rightDown {
						in=29;
					} else if rightUp && !rightDown {
						in=17;
					} else if !rightUp && !rightDown {
						in=53;
					}
				} else if left && up && right && down {
					if leftUp && leftDown && rightUp && rightDown {
						in=14;
					} else if !leftUp && leftDown && rightUp && rightDown {
						in=31;
					} else if leftUp && !leftDown && rightUp && rightDown {
						in=19;
					} else if leftUp && leftDown && !rightUp && rightDown {
						in=30;
					} else if leftUp && leftDown && rightUp && !rightDown {
						in=18;
					} else if !leftUp && !leftDown && rightUp && rightDown {
						in=55;
					} else if !leftUp && leftDown && !rightUp && rightDown {
						in=33;
					} else if !leftUp && leftDown && rightUp && !rightDown {
						in=22;
					} else if leftUp && !leftDown && !rightUp && rightDown {
						in=10;
					} else if leftUp && !leftDown && rightUp && !rightDown {
						in=21;
					} else if leftUp && leftDown && !rightUp && !rightDown {
						in=54;
					} else if !leftUp && !leftDown && !rightUp && rightDown {
						in=34;
					} else if leftUp && !leftDown && !rightUp && !rightDown {
						in=47;
					} else if !leftUp && leftDown && !rightUp && !rightDown {
						in=35;
					} else if !leftUp && !leftDown && rightUp && !rightDown {
						in=46;
					} else if !leftUp && !leftDown && !rightUp && !rightDown {
						in=57;
					}
				} else if left && up && !right && down {
					if leftUp && leftDown {
						in=15;
					} else if !leftUp && leftDown {
						in=32;
					} else if leftUp && !leftDown {
						in=20;
					} else if !leftUp && !leftDown {
						in=56;
					}
				} else if !left && up && right && !down {
					if !rightUp {
						in=25;
					} else {
						in=41;
					}
				} else if left && up && right && !down {
					if leftUp && rightUp {
						in=26;
					} else if !leftUp && rightUp {
						in=43;
					} else if leftUp && !rightUp {
						in=42;
					} else if !leftUp && !rightUp {
						in=45;
					}
				} else if left && up && !right && !down {
					if leftUp {
						in=27;
					} else {
						in=44;
					}
				} else if !up && !down {
					if !left && right {
						in=37;
					} else if left && right {
						in=38;
					} else if left && !right {
						in=39;
					}
				}
			
				draw_tile(tileSet, in, 0, xx*tileSize, yy*tileSize);
			}
		}
	}
	surface_reset_target();
}

generateLevelMapArray(["0"]);

generateMap();

drawScript=function(x, y) {
	if surface_exists(tileSurface) draw_surface(tileSurface, x, y);
}
	
depth=-1000;