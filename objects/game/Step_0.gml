if live_call() return live_result;

#region dev keybinds
if DEV_MODE {
	if input(vk_home, PRESS) game_restart();
}
#endregion

if input(vk_f2, PRESS) crtOn=!crtOn;

gameFrame++;