if live_call() return live_result;

event_inherited();

copy+=copySpeed;
if copy>=1 {
	copy=0;
	writtenAmount++;
	written=string_copy(text, 1, writtenAmount);
}

with mumbaShopkeeper {
	other.targetX=ceil(targetX+sprite_xoffset*.65);
	other.targetY=max(52, targetY-sprite_yoffset*.66-myWave+wave(-1, 1, 2, .2))+wave(-1, 1, 3)*3;
}