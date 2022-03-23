if live_call() return live_result;

event_inherited();

var passed=false;
with shrimposerPlayer {
	if xstart>=other.xstart && playing {
		passed=true;
	} else {
		other.played=false;
	}
}

if passed && !played {
	squish=.2;
	played=true;
	scrollY=-2;
	playSound(asset, 100, 1);
}

life++;

with parentWindow {
	other.x=other.xstart+portX;
	other.y=other.ystart+portY;
}

xstart=startX+scrollX;
ystart=startY+scrollY;
scrollY=lerp(scrollY, 0, .5);