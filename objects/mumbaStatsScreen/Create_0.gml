if live_call() return live_result;

event_inherited();
bonusLevel=mumbaBonusLevel;
statsDisplay=instance_create_depth(0, 0, -100, mumbaStatsDisplay);
circleTransition=noone;
shopIntro=noone;
with statsDisplay {
	drawX=16;
	drawY=76;
}
ds_list_add(children, statsDisplay);

state=0;
timer=0;
current=0;

text=[
"EGGS: ", concat(eggs, "\n"),
"TIME: ", concat(minutes, ":", seconds, "\n"), 
"ENEMIES BLAMMED: ", concat(enemiesKilled, "\n"), 
"COINS ACQUIESCED: ", concat(coins, "\n"), 
concat("\n\n",
choose(
"HAVE A GREAT DAY! :)",
"EAT YOUR GREENS",
"GET PLENTY OF SLEEP",
"TAKE A 15 MINUTE BREAK",
"DRINK WATER"
)
)
];