swap_up = keyboard_check_pressed(ord("1"));
swap_down = keyboard_check_pressed(ord("2"));
move_up = keyboard_check_pressed(ord("W"));
move_down = keyboard_check_pressed(ord("S"));
move_left = keyboard_check_pressed(ord("A"));
move_right = keyboard_check_pressed(ord("D"));
action = keyboard_check_pressed(vk_enter);
swap_move = swap_down - swap_up;
move_vert = move_down - move_up;
move_horiz = move_right - move_left;

if(keyboard_check_pressed(vk_escape))
	room_goto(global.newRoom);

script_execute(state);