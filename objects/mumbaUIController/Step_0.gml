if live_call() return live_result;

event_inherited();

drawScript=function(x, y) {
	if instance_exists(playerReference) {
		#region draw player
		var playerSpr=noone,
		playerSquish=0,
		playerSpeed=0,
		playerKnockback=0;
		with playerReference {
			playerSpr=uiSprite;
			playerSquish=squish;
			playerSpeed=min(1, abs(horizontalSpeed));
			playerKnockback=-abs(horizontalKnockback)*4;
			if grace || other.grace setSwapAmountShader(c_white, c_white, 1, 1);
		}
		var width=0, height=0;
		with parentWindow {
			width=portWidth;
			height=portHeight;
		}
		var playerX=36+playerKnockback, playerY=height-20+bounceY, playerYWave=playerY+wave(0, 2, 1)*!playerSpeed+wave(0, 3, .5)*playerSpeed, playerXScale=1+playerSquish, playerYScale=1-playerSquish, playerAngle=wave(-1, 5, 1)*playerSpeed;
		draw_sprite_ext(playerSpr, 0, playerX, playerYWave, playerXScale, playerYScale, playerAngle, c_white, 1);
		shader_reset();
		#endregion
		
		#region draw weapon
		if instance_exists(weaponReference) {
			var gunSpr=noone,
			gunSquish=0,
			gunAngle=0,
			gunFire=0,
			fired=false;
			with weaponReference {
				gunSpr=uiSprite;
				gunSquish=squish;
				gunAngle=abs(angle*2);
				if grace setSwapAmountShader(c_white, c_white, 1, 1);
				if justFired fired=true;
				gunFire=min(0, fireTimer/fireRate*-8)
			}
			var gunX=playerX+20+sprite_get_xoffset(gunSpr)+gunFire, gunY=playerY+wave(-1, 1, 1, .2)*!playerSpeed+wave(-2, 2, .75, .1)*playerSpeed, gunXScale=1+gunSquish, gunYScale=1-gunSquish;
			draw_sprite_ext(gunSpr, 0, gunX, gunY, gunXScale, gunYScale, gunAngle, c_white, 1);
			shader_reset();
			if fired {
				var dusty=instance_create_depth(0, 0, depth-10, mumbaUIDust);
				with dusty {
					drawX=gunX+sprite_width;
					drawY=gunY-sprite_yoffset;
				}
				with parentWindow {
					ds_list_add(children, dusty);
				}
			}
		}
		#endregion
		
		#region draw health bar
		var maximum=1,
		a=1;
		with playerReference {
			maximum=maximumHp;
			a=hp;
		}
		var healthX=playerX+40,
		healthY=playerY+12;
		for (var i=1; i<=maximum; i++) {
			var spr=sprHealthIcon,
			thisX=healthX,
			thisY=healthY,
			img=i+gameFrame/10;
			if i>a {
				thisY+=wave(-1, 1, 1, i/3);
				spr=sprEmptyHealthIcon;
			}
			thisY+=wave(-1, 1, 1, i/3);
			with parentWindow {
				var shake=cameraShake*2;
				thisX+=random_range(-shake, shake);
				thisY+=random_range(-shake, shake);
			}
			draw_sprite(spr, img, thisX, thisY);
			healthX+=12;
		}
		#endregion
		
		#region draw coins
		var coinImage=gameFrame/4, coinX=playerX-25, coinY=playerY+8+wave(-2, 1, 1, .2), coinXScale=1, coinYScale=1, coinAngle=0;
		draw_sprite_ext(sprMumbaUICoin, coinImage, coinX, coinY, coinXScale, coinYScale, coinAngle, c_white, 1);
		draw_set_font(fntBoot);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		var ctx=coinX+wave(3, 5, 1),
		cty=coinY+4,
		txt="x";
		with mumbaPlayerData {
			txt+=string(money);
		}
		drawTextOutlinedBasic(ctx, cty, txt)
		
		#endregion
	}
}

depth=-9999;

bounceY=lerp(bounceY, 0, .2);