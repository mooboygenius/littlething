if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 134, 141);
centerWindow(self);
firesound=0;

if(instance_number(objBimsywindow)<=1){
	manager=instance_create_depth(-100, -100, depth+1, objBimsymanager);
	ds_list_add(children, manager);
	
	ds_list_add(children, instance_create_depth(1, 1, depth+1, objBimsymenu));

	

	

}else{
	ds_list_add(children, instance_create_depth(1, 1, depth+2, objBimsyerror));
	ds_list_add(children, instance_create_depth(64, 64, depth+1, objBimsyangel));
	firesound=playSound(musBimsyfire,1,1,1);
	playSound(sndVBimsyAwjeez,1,1,0);
}

instance_destroy(butt[1]);
instance_destroy(butt[2]);

random_set_seed(current_time);
randomize();
