if live_call() return live_result;

event_inherited();

text="test text woohoo. line break";
copy=0;
copySpeed=1;
writtenAmount=0;
written="";

parseText=function(str) {
	/// @function parseText(str)
	// insert breaks
	var char="", previousChar="",
	t="";
	for (var i=1; i<=string_length(str); i++) {
		char=string_char_at(str, i);
	
		if char==" " && (previousChar=="." || previousChar=="!" || previousChar=="?") {
			t+="\n";
		} else {
			t+=char;
		}
	
		previousChar=char;
	}
	return t;
}

text=parseText(text);