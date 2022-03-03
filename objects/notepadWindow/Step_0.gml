if live_call() return live_result;

event_inherited();

switch substate {
	case 0:
		if keyboard_check_pressed(vk_anykey) && getActiveWindow()==self {
			var current=string_length(text);
			switch keyboard_lastkey {
				case vk_backspace:
					text=string_delete(text, current, 1); 
				break;
				
				case vk_shift:
					// do nothing
				break;
				
				case vk_enter:
					text+="\n";
				break;
				
				default:
					var cin=keyboard_lastchar;
					if characterIsReal(cin) text+=cin;
				break;
			}
		}
	break;
}