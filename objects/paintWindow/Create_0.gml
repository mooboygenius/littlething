if live_call() return live_result;

event_inherited();

var w=180, h=3/4*w;
setWindowSize(self, x, y, w, h);

var colors=[make_color_rgb(33, 24, 27),
make_color_rgb(59, 32, 39),
make_color_rgb(125, 56, 51),
make_color_rgb(171, 81, 48),
make_color_rgb(207, 117, 43),
make_color_rgb(240, 181, 65),
make_color_rgb(255, 238, 131),
make_color_rgb(200, 212, 93),
make_color_rgb(99, 171, 63),
make_color_rgb(59, 125, 79),
make_color_rgb(47, 87, 43),
make_color_rgb(40, 53, 64),
make_color_rgb(27, 31, 33),
make_color_rgb(43, 43, 69),
make_color_rgb(43, 43, 69),
make_color_rgb(58, 63, 94),
make_color_rgb(58, 63, 94),
make_color_rgb(76, 104, 133),
make_color_rgb(40, 53, 64),
make_color_rgb(40, 53, 64),
make_color_rgb(27, 31, 33),
make_color_rgb(43, 43, 69),
make_color_rgb(58, 63, 94),
make_color_rgb(76, 104, 133),
make_color_rgb(79, 164, 184),
make_color_rgb(146, 232, 192),
make_color_rgb(245, 255, 232),
make_color_rgb(223, 224, 232),
make_color_rgb(163, 167, 194),
make_color_rgb(104, 111, 153),
make_color_rgb(64, 73, 115),
make_color_rgb(44, 53, 77),
make_color_rgb(20, 24, 46),
make_color_rgb(75, 29, 82),
make_color_rgb(105, 36, 100),
make_color_rgb(156, 42, 112),
make_color_rgb(204, 47, 123),
make_color_rgb(255, 82, 119),
make_color_rgb(255, 194, 161),
make_color_rgb(255, 137, 51),
make_color_rgb(230, 69, 57),
make_color_rgb(173, 47, 69),
make_color_rgb(120, 29, 79),
make_color_rgb(79, 29, 76),
make_color_rgb(41, 29, 43),
make_color_rgb(61, 41, 54),
make_color_rgb(82, 51, 63),
make_color_rgb(143, 77, 87),
make_color_rgb(189, 106, 98),
make_color_rgb(255, 174, 112),
c_white
];

var sx=3, sy=10,
xx=sx, yy=sy,
o=8;

barWidth=32;
for (var i=0; i<array_length(colors); i++) {
	var inst=instance_create_depth(xx, yy, depth-1, colorButton);
	with inst {
		parent=other;
		image_blend=colors[i];
	}
	ds_list_add(children, inst);
	xx+=o;
	if xx>barWidth {
		xx=sx;
		yy+=o;
	}
}

drawCanvasWidth=150;
drawCanvasHeight=drawCanvasWidth;
drawSurf=surface_create(drawCanvasWidth, drawCanvasHeight);
surface_set_target(drawSurf);
draw_clear_alpha(c_white, 1);
surface_reset_target();
drawColor=BLACK_COLOR;
drawSize=2;
drawX=getMouseX();
drawY=getMouseY();
drawPreviousX=-999;
drawPreviousY=-999;
timeSinceLiftingPencil=999;