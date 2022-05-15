if live_call() return live_result;

event_inherited();

gamespeed=1;
playmusic=1;

minigamedeck=[
objBimsyminigameD3,
objBimsyminigameB2,
objBimsyminigameB3,
objBimsyminigameB4,
objBimsyminigameB5,
objBimsyminigameB6,
objBimsyminigameD1,
objBimsyminigameD2];

bimsyscrambledeck();

winv=[sndVBimsySocool,
sndVBimsyVerynice,
sndVBimsyWow1,
sndVBimsyWow2];
losev=[sndVBimsyAwjeez,
sndVBimsyAwshucks,
sndVBimsyNoway,
sndVBimsyThatsmarts];
oneleftv=sndVBimsyOneleft;
startv=sndVBimsyAmen;
gameoverv=sndVBimsyForgiveme;
gameoverhead=sprBimsygameoverbimsy;

deckpointer=-1;

bimscore=0;
hp=4;
wonlastminigame=1;
transition=objBimsyTrGotchi;

bimmusic=0;
