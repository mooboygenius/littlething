function wave(from, to, duration, offset=0, time=current_time) {
	var a4=(to-from)/2;
	return from+a4+sin((((time*0.001)+duration*offset)/duration)*(pi*2))*a4;
}

function chance(probability) {
	return random(1)<=probability;
}

function lerpAngle(from, to, amount) {
	var diff=angle_difference(from, to),
	next=from-diff;
	return lerp(from, next, amount);
}