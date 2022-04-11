if live_call() return live_result;

event_inherited();

var w=sprite_get_width(sprDefaultShteamThumbnail),
h=sprite_get_height(sprDefaultShteamThumbnail),
xs=w div 2+4,
ys=h div 2+4+12,
xx=xs,
yy=ys;
for (var i=0; i<ds_list_size(games); i++) {
	with games[| i] {
		var l=1;
		xstart=lerp(xstart, xx, l);
		ystart=lerp(ystart, yy, l);
		depth=other.depth-10;
		xx+=70;
		//visible=true
	}
	
	if xx+w/2>portWidth {
		xx=xs;
		yy+=54;
	}
}