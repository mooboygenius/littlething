if live_call() return live_result;

if place_meeting(x, y+1, mumbaWall) && place_meeting(x+horizontalSpeed*8, y, mumbaWall) {
	createMumbaParticle(x-8, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x+8, y+sprite_yoffset, mumbaDustParticle);
	verticalSpeed=-3;
	squish=-.1;
}

if place_meeting(x+horizontalSpeed, y, mumbaWall) {
	horizontalSpeed*=-1;
}

if abs(horizontalSpeed)<moveSpeed {
	horizontalSpeed=moveSpeed;
}

event_inherited();

