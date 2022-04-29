if live_call() return live_result;

switch sprite_index {
	case sprMumbaSnowmanLand:
		setSprite(self, sprMumbaSnowmanIdle);
		state=0;
	break;
	
	case sprMumbaSnowmanStartJump:
		verticalSpeed=-4;
		horizontalSpeed=sign(other.xScale)*1;
		squish=-.2;
		makeDust();
		setSprite(self, sprMumbaSnowmanJump);
	break;
	
	case sprMumbaSnowmanSwitchToFall:
		squish=.2;
		setSprite(self, sprMumbaSnowmanJump);
	break;
}