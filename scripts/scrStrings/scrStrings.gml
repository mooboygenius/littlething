function concat() {
	/// @function concat(string1, string2, string3...)
	var str="";
	for (var i=0; i<argument_count; i++) {
		str+=string(argument[i]);
	}
	return str;
}