if live_call() return live_result;

event_inherited();

if(!dead){
	if(input(vk_left,HOLD)){
		sped=lerp(sped,-guyspd,0.7);
		facing=-1;
	}
	if(input(vk_right,HOLD)){
		sped=lerp(sped,guyspd,0.7);
		facing=1;
	}

	if(!input(vk_left,HOLD) && !input(vk_right,HOLD)){
		sped=lerp(sped,0,0.7);
	}
	image_speed=sped;
}else{
	image_speed=1;
	sped=lerp(sped,0,0.5);
}

flip=lerp(flip,facing,0.2);

xpos+=sped;

xpos=clamp(xpos,28,100);



x=xpos;
y=ypos;
