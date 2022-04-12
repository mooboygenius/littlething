if live_call() return live_result;
justFired=false;

event_inherited();

var canFire=false;

with owner {
	other.parentWindow=parentWindow;
	other.xScale=xScale;
	var l=.5,
	tx=x+(1+sprite_xoffset+other.sprite_xoffset)*other.xScale,
	ty=y;
	if abs(horizontalSpeed)>.5 ty+=wave(-1, 1, .5)*1;
	other.x=lerp(other.x, tx, l);
	other.y=lerp(other.y, ty, l);
	canFire=canMove && canControl;
	if point_distance(x, y, other.x, other.y)>48 {
		other.x=x;
		other.y=y;
	}
}

fireTimer--;

if canFire && input(mumbaInputFire) && fireTimer<=0 {
	fireTimer=fireRate;
	var sprite=object_get_sprite(bulletObject),
	xo=sprite_get_xoffset(sprite),
	bx=x+xo*xScale,
	by=y;
	x+=-sign(xScale)*8;
	justFired=true;
	repeat(bulletNumber) {
		with owner {
			horizontalKnockback=-other.bulletSpeed*sign(other.xScale)*.1;
		}
		var bullet=instance_create_depth(bx, by, depth-1, bulletObject);
		var dam=bulletDamageMultiplier,
		dir=0;
		createMumbaParticle(bx, by-4, mumbaDustParticle);
		with bullet {
			var a=90-sign(other.xScale)*90+random_range(-other.inaccuracy, other.inaccuracy),
			spd=other.bulletSpeed*random_range(.95, 1.05);
			angle=a;
			horizontalSpeed=lengthdir_x(spd, a);
			verticalSpeed=lengthdir_y(spd, a);
			dir=a+180;
			grace=2*dam+random_range(-1, 2);
			squish=-.5;
		}
		squish=-.25;
		grace=2*dam;
		angle=30*sign(xScale);
		setCameraShake(dam);
		setCameraKick(dam, dir);
		with parentWindow {
			if ds_list_find_index(children, bullet)<0 {
				ds_list_add(children, bullet);
			}
		}
		var casing=instance_create_depth(x, y, depth-1, mumbaBulletCasing);
		with casing {
			angle=irandom(360);
			grace=irandom_range(2, 5);
			var m=.33;
			horizontalSpeed=other.bulletSpeed*m*-other.xScale*random_range(.5, 1.2);
			verticalSpeed=-other.bulletSpeed*m*random_range(.5, 1.2);
		}
		with parentWindow {
			ds_list_add(children, casing);
		}
	}
}

angle=lerp(angle, 0, .2);