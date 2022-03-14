if live_call() return live_result;
if pauseTime>0 && percentLoaded>pauseAtAmount {
	percentLoaded+=.025;
	pauseTime--;
} else {
	percentLoaded+=.5;
}
if percentLoaded>100 {
	percentLoaded=100;
	goTimer++;
	if goTimer>120 {
		doDraw=false;
		if goTimer>240 {
			room_goto(rmTest);
		}
	}
} else {
	loadBlock+=.2;
}