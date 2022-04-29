if live_call() return live_result;

event_inherited();

decor=instance_create_depth(x, y, depth+5, mumbaLSDecor);
with decor {
	z=other.z-4;
}

nextCoins=[];

dots=ds_list_create();

coolName=noone;

state=0;