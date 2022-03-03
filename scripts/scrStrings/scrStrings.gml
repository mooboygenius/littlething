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