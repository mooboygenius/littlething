if live_call() return live_result;

xstart=x;
ystart=y;

drawYOffset=wave(-2, 2, .5);
angle=lerp(angle, wave(-1, 1, 1)*25, .5);

if place_meeting(x, y, mumbaPlayer) {
	var e=0;
	with mumbaPlayer {
		eggs++;
		e=eggs;
	}
	with mumbaRealLevel {
		eggsGrabbed++;
	}
	with mumbaEnemySpawner {
		if e%10==0 {
			hardWaveFrequency--;
			hardWaveChance+=.05;
			if hardWaveFrequency<2 hardWaveFrequency=2;
			if hardWaveChance>.6 hardWaveChance=.6;
		}
	}
	show_debug_message("egg obtained");
	instance_destroy();
}

drawScript=function(x, y) {
	defaultDrawScript(x, y+drawYOffset);
}

if place_meeting(x, y, mumbaBullet) {
	grace=5;
}

var mx=0, my=0;
with mumbaPlayer {
	mx=x;
	my=y;
}
if collision_line(x, y, mx, my, mumbaWall, true, true) {
	life--;
	if life%120==0 show_debug_message(concat("wall between egg and player -- ", life));
}
if life<=0 {
	instance_destroy();
}