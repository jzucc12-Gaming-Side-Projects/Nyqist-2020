//inputs
move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
move_run = keyboard_check(vk_shift);
interact = keyboard_check_pressed(vk_space);

//Determine movement
moving = (move_right - move_left != 0) || (move_down - move_up != 0);
move_direction = point_direction(0,0,move_right - move_left, move_down - move_up);

//Determine walk speed
walk_mod = walk_mod_base + move_run * (run_mod - 1);
walk_spd = walk_spd_base * walk_mod;
animation_spd = animation_spd_base * walk_spd / walk_spd_base;

with(oPlayerFollow)
{
	walk_mod = walk_mod_base + other.move_run * (run_mod - 1);
	walk_spd = walk_spd_base * walk_mod;
	animation_spd = animation_spd_base * walk_spd / walk_spd_base;
}

//Execute state
if(!global.paused)
	script_execute(state);

depth = -bbox_bottom;