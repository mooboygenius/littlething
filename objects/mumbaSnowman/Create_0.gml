if live_call() return live_result;

event_inherited();

state=0;
timer=0;
moveSpeed=.8;
makeDust=function() {
	/// @function makeDust()
	createMumbaParticle(x-sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
	createMumbaParticle(x+sprite_xoffset, y+sprite_yoffset, mumbaDustParticle);
}

gotHurt=false;
getHurt=function(amt) {
	/// @function getHurt(amount)
	grace=amt*10;
	hp-=amt;
	gotHurt=true;
}

halfway=false;

maximumHp=hp;