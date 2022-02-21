if live_call() return live_result;
#macro DEV_MODE false
#macro dev:DEV_MODE true

#macro GAME_WIDTH 320
#macro GAME_HEIGHT 180
#macro GAME_RATIO GAME_WIDTH/GAME_HEIGHT
#macro WINDOW_SCALE 3
#macro WINDOW_WIDTH GAME_WIDTH*WINDOW_SCALE
#macro WINDOW_HEIGHT GAME_HEIGHT*WINDOW_SCALE
#macro BLACK_COLOR $FF211F1B

view_camera[0]=camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
view_enabled=true;
view_set_visible(0, true);
view_set_camera(0, view_camera[0]);
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);

#macro START_ROOM rmTest
room_goto(START_ROOM);

globalvar previousMouseX, previousMouseY;
previousMouseX=getMouseX();
previousMouseY=getMouseY();