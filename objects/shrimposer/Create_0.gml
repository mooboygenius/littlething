if live_call() return live_result;

event_inherited();

setWindowSize(self, x, y, 200, 140);
notes=ds_list_create();
selections=ds_list_create();
var array=[selectBaby, selectDog, selectCoin, selectBuzz, selectClock, selectCrow, selectBell, selectDodgeBall, selectGiggle, selectKitty, selectKnife, selectPuppy, selectPig, selectRecordScratch, selectWhistle, selectBurp];
for (var i=0; i<array_length(array); i++) {
	var inst=instance_create_depth(-100, -100, depth+4, array[i]);
	ds_list_add(selections, inst);
	ds_list_add(children, inst);
}

mouseInstrument=instance_create_depth(-100, -100, depth+1, dragInstrument);
ds_list_add(children, mouseInstrument);

player=instance_create_depth(-100, -100, depth+1, shrimposerPlayer);
ds_list_add(children, player);

playButton=instance_create_depth(-100, -100, depth+4, playStopButton);
ds_list_add(children, playButton);

audio_pause_sound(currentMusic);

substate=0;

scrollAmount=0;
scrollAmountLerp=0;