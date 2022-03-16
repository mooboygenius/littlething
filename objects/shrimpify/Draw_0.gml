if live_call() return live_result;
// Inherit the parent event
event_inherited();

var highlightColor=$53572F,
pw=portWidth,
ph=portHeight;

if surface_exists(finalSurf) {
	surface_set_target(finalSurf);
	draw_surface(childrenObjectSurf, 0, 0);
	
	var trackLeft=0,
	trackRight=portWidth,
	trackY=ph-6;
	with trackBar {
		xstart=pw div 2;
		ystart=trackY;
		image_xscale=1.5;
		trackLeft=xstart-sprite_xoffset;
		trackRight=xstart+sprite_xoffset;
	}
	
	with trackPositionMarker {
		ystart=trackY;
		leftMargin=trackLeft;
		rightMargin=trackRight;
		currentTrackPosition=other.currentTrackPosition;
		currentTrackLength=other.currentTrackLength;
	}
	
	with pauseButton {
		xstart=pw div 2;
		ystart=ph-28;
	}
	
	surface_reset_target();
}