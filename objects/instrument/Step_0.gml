if live_call() return live_result;

event_inherited();

var passed=false;
with shrimposerPlayer {
	if xstart>=other.xstart {
		passed=true;
	} else {
		other.played=false;
	}
}

if passed && !played {
	squish=1;
	played=true;
	playSound(asset, 100, pitch);
}

life++;

with parentWindow {
	other.x=other.xstart+portX;
	other.y=other.ystart+portY;
}