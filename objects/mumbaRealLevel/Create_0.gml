if live_call() return live_result;

event_inherited();

eggSpawner=instance_create_depth(0, 0, 0, mumbaEggSpawner);
ds_list_add(children, eggSpawner);

state=0;
timer=0;