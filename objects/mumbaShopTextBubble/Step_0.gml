if live_call() return live_result;

event_inherited();

copy+=copySpeed;
if copy>=1 {
	copy=0;
	writtenAmount++;
	written=string_copy(text, 1, writtenAmount);
}

drawScript=function(x, y) {
	var m=.2,
	int=.004;
	setWaveShader(sprite_width*m, sprite_height*m, int, int, (gameFrame div 10)*100)
	defaultDrawScript(drawX, drawY);
	shader_reset();
	var txo=16,
	tx=drawX+txo,
	ty=drawY-sprite_height+12,
	sep=12,
	w=200,
	c=BLACK_COLOR;
	draw_set_font(mumbaShopFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed_color(tx, ty, written, sep, w, 1, 1, 0, c, c, c, c, 1);
	
	var w=sprite_get_width(sprite_index);
	image_xscale=lerp(image_xscale, (max(w, string_width(text)+txo*2))/w, .5);
}

with mumbaShopkeeper {
	other.targetX=targetX+sprite_xoffset*.6;
	other.targetY=targetY-sprite_yoffset*.66-myWave+wave(-1, 1, 2, .2);
}