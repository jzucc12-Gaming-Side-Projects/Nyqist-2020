//Set up Camera
camera = view_camera[0];
follow = oPlayerMain;
view_width_half = camera_get_view_width(camera) * 0.5;
view_height_half = camera_get_view_height(camera) * 0.5;

//Positioning and movement
xTo = xstart;
yTo = ystart;
move_spd = FRAME_RATE/4;