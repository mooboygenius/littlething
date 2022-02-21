function setSwapAmountShader(color, baseColor, threshold, amount) {
	shader_set(shSwapAmount);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapColor"), color_get_red(color) / 255, color_get_green(color) / 255, color_get_blue(color) / 255);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapBaseColor"), color_get_red(baseColor) / 255, color_get_green(baseColor) / 255, color_get_blue(baseColor) / 255);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapThreshold"), threshold);
	shader_set_uniform_f(shader_get_uniform(shSwapAmount, "swapAmount"), amount);
}

function setWaveShader(textureWidth, textureHeight, horizontalIntensity, verticalIntensity, time) {
	shader_set(shWave);
	shader_set_uniform_f(shader_get_uniform(shWave, "textureWidth"), textureWidth);
	shader_set_uniform_f(shader_get_uniform(shWave, "textureHeight"), textureHeight);
	shader_set_uniform_f(shader_get_uniform(shWave, "waveIntensity"), horizontalIntensity, verticalIntensity);
	shader_set_uniform_f(shader_get_uniform(shWave, "time"), time);
}

function sleep(milliseconds) {
	var gt=current_time+milliseconds;
	while current_time<gt {}
}