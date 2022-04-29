if live_call() return live_result;
if hp<=0 {
	with mumbaPlayer {
		coinCoolDown=30;
	}
	with mumbaRealLevel {
		coinsGrabbed++;
	}
	with mumbaPlayerData {
		money+=other.amount;
	}
	with createMumbaTextEffect(x, y-8, concat("+", amount), $83EEFF, BLACK_COLOR, 90, 0, -.3, .001) {
		squish=.5;
	}
}