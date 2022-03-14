function concat() {
	/// @function concat(string1, string2, string3...)
	var str="";
	for (var i=0; i<argument_count; i++) {
		str+=string(argument[i]);
	}
	return str;
}

function characterIsReal(str) {
	return string_pos(str, "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890-=`~!@#$%^&*()_+[]\\{}|;':\",./<>? ");
}

function getStringInput(text, allowLinebreaks=true, backSpeed=2, backMinimum=20) {
	static backing=0;
	
	var current=string_length(text);
	
	if input(vk_backspace) {
		if (backing>backMinimum && backing%backSpeed==0) || backing==0 {
			text=string_delete(text, current, 1); 
		}
		backing++;
	}
	
	if input(vk_backspace, RELEASE) {
		backing=0;
	}
	
	if keyboard_check_pressed(vk_anykey) {
		switch keyboard_lastkey {
			case vk_backspace:
				// do nothing
			break;
				
			case vk_shift:
				// do nothing
			break;
				
			case vk_enter:
				if allowLinebreaks {
					text+="\n";
				}
			break;
				
			default:
				var cin=keyboard_lastchar;
				if characterIsReal(cin) text+=cin;
			break;
		}
	}
	return text;
}