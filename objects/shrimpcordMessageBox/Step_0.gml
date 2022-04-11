if live_call() return live_result;

event_inherited();

enum messageState {idle, typing, sending}

switch state {
	case messageState.idle:
		if HIGHEST_INSTANCE_UNDER_MOUSE==id && input(mb_left, PRESS) {
			state=messageState.typing;
		}
	break;
	
	case messageState.typing:
		if (HIGHEST_INSTANCE_UNDER_MOUSE!=id && input(mb_left, PRESS)) || getActiveWindow()!=parentWindow {
			state=messageState.idle;
		}
		if keyboard_check_pressed(vk_anykey) && getActiveWindow()==parentWindow {
			var current=string_length(in);
			switch keyboard_lastkey {
				case vk_backspace:
					in=string_delete(in, current, 1); 
				break;
				
				case vk_shift:
					// do nothing
				break;
				
				case vk_enter:
					if input(vk_shift) {
						in+="\n";
					} else {
						state=messageState.sending;
					}
				break;
				
				default:
					var cin=keyboard_lastchar;
					if characterIsReal(cin) in+=cin;
				break;
			}
		}
	break;
	
	case messageState.sending:
		with shrimpcordMessageManager {
			createMessage("shrimpguy51", other.in);
			with owner moveToTop=true;
		}
		var n="bot", pp=sprShrimpcordDefaultIcon,
		md=.5,
		agg=.5,
		quir=.5,
		sen=.5,
		gram=.5,
		emo=.5;
		with owner {
			md=mood;
			agg=aggression;
			quir=quirky;
			sen=sensitivity;
			gram=grammarCorrectness;
			emo=usesEmojis;
			n=name;
			pp=profileImage;
		}
		with instance_create_depth(0, 0, 0, shrimpcordAutomessenger) {
			mood=md;
			aggression=agg;
			quirky=quir;
			sensitivity=sen;
			usesEmojis=emo;
			grammarCorrectness=gram;
			inString=other.in;
			name=n;
			profileImage=pp;
		}
		in="";
		state=messageState.typing;
	break;
}

drawScript=function(x, y) {
	draw_set_font(fntSystem);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	defaultDrawScript(x, y);
	var c=c_white,
	t=in,
	tx=x+4,
	ty=y+4;
	if state==messageState.typing {
		if t=="" {
			c=$734940;
			t="start typing about shrimps!!";
			ty+=wave(-1, 1, .5);
		} else {
			var time=1000;
			if current_time%time<(time/2) {
				t+="|";
			}
		}
	}
	var sep=12,
	w=sprite_width-8;
	draw_text_ext_color(tx, ty, t, sep, w, c, c, c, c, 1);
}

