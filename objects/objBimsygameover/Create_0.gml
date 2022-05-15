if live_call() return live_result;

event_inherited();


xpos=x;
ypos=y;

tity=-30;

qtimer=30;

quote="";
switch(irandom_range(0,5)){
	default: quote="er..."; break;
	case 0: quote="You did alright."; break;
	case 1: quote="Try not to squander your lives."; break;
	case 2: quote="Keep it up, just keep it up!"; break;
	case 3: quote="Life doesn't last forever."; break;
	case 4: quote="Don't stop praying."; break;
	case 5: quote="Amen."; break;
}




drawScript=function(x,y){
	draw_sprite_tiled(sprBimsygameoverbg,0,current_time*0.001,0);
	draw_sprite_ext(sprBImsygameovertext,0,0,tity+sin(current_time*0.0013),1,1,0,-1,1);
	draw_sprite_ext(objBimsymanager.gameoverhead,0,64,26+cos(current_time*0.003)*2,1,1,0,-1,1);
	
	draw_set_font(fntSilver);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour($e8fff5);
	draw_text_ext(64,64,"Score: "+string(objBimsymanager.bimscore),14,96);
	draw_text_ext(64,80,quote,14,96);
	
	draw_text_ext(64,112,"Press Z.",6,96);
}
