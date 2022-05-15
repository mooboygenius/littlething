if live_call() return live_result;

event_inherited();

if(!caught){
	ypos+=guyspd;
	guyspd+=objBimsymanager.gamespeed*0.02;
}

x=xpos;
y=ypos;

if(caught){
	xpos=objBimsyCatchguy.xpos+caughtoffset;
	ypos=objBimsyCatchguy.ypos-21;
}

if(!splatted){
	if(ypos>=120){
		splatted=1;
		playSound(sndBimSlimo,1,random_range(0.9,1.1),0);
		objBimsyCatchguy.guyfr=2;
	}
}
