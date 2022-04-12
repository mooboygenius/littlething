if live_call() return live_result;

event_inherited();

getHurt=function(amt) {
	/// @function getHurt(amount)
	if object_is_ancestor(object_index, mumbaLivingObject) {
		grace=amt*10;
	}
}

hurt=function(in, amt) {
	/// @function hurt(instance, amount)
	with in {
		hp-=amt;
		getHurt(amt);
	}
}

doScreenWrap=function() {
	/// @function doScreenWrap()
	var w=0;
	with mumbaLevel {
		w=tileSurfaceWidth;
	}
	if w>0 {
		if x<0 {
			x=w;
		} else if x>w {
			x=0;
		}
	}
}

useMumbaPhysics=function() {
	/// @function useMumbaPhysics()
	
	if canMove { 
		var h=horizontalSpeed+horizontalKnockback;
		if canCollide && place_meeting(x+h, y, mumbaWall) {
			while !place_meeting(x+sign(h), y, mumbaWall) {
				x+=sign(h);
			}
			h=0;
			horizontalSpeed=0;
			horizontalKnockback=0;
		}
		horizontalKnockback=lerp(horizontalKnockback, 0, weight);
		x+=h;
	
		var v=verticalSpeed+verticalKnockback;
		if canCollide && place_meeting(x, y+v, mumbaWall) {
			if v>2 squish=.2;
			
			while !place_meeting(x, y+sign(v), mumbaWall) {
				y+=sign(v);
			}
			v=0;
			verticalSpeed=0;
			verticalKnockback=0;
		}
		verticalSpeed+=weight;
		verticalKnockback=lerp(verticalKnockback, 0, weight);
		y+=v;
	}
	
	if wrapAroundScreen {
		doScreenWrap();
	}
}

setCameraFocus=function(object) {
	/// @function setCameraFocus(object)
	with parentWindow {
		cameraFocus=object;
	}
}

setCameraShake=function(amount) {
	/// @function setCameraShake(amount)
	with parentWindow {
		cameraShake=amount;
	}
}

setCameraKick=function(amount, d) {
	/// @function setCameraKick(amount, direction)
	with parentWindow {
		cameraKick+=amount;
		cameraKickDirection=d;
	}
}

createMumbaParticle=function(x, y, particle) {
	/// @function createMumbaParticle(x, y, particle)
	with parentWindow {
		part_particles_create(particleSystem, x, y, particle, 1);
	}
}

createMumbaTextEffect=function(x, y, str, c=c_white, oc=BLACK_COLOR, l=120, hor=0, ver=0, w=0, cc=false, fnt=fntSystem) {
	/// @function createMumbaTextEffect(x, y, string, [color], [outlineColor], [life], [horizontalSpeed], [verticalSpeed], [weight], [canCollide], [font])
	var te=instance_create_depth(x, y, -100, mumbaTextEffect);
	with te {
		generateText(str, c, oc, fnt);
		life=l;
		horizontalSpeed=hor;
		verticalSpeed=ver;
		weight=w;
		canCollide=cc;
	}
	with parentWindow {
		ds_list_add(children, te);
	}
	return te;
}