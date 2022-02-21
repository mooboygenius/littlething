if live_call() return live_result;

event_inherited();

var c=image_index==0 ? c_white : BLACK_COLOR;
draw_set_font(fntSystem);
buttonWidth=(string_width(text)+8)/sprite_get_width(sprite_index);
image_xscale=buttonWidth;
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_color(x, y, text, c, c, c, c, 1);