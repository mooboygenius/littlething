if live_call() return live_result;

event_inherited();

getHurt=function(amt) {
	/// @function getHurt(amount)
	grace=amt*10;
}

hurt=function(in, amt) {
	/// @function hurt(instance, amount)
	with in {
		hp-=amt;
		getHurt(amt);
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