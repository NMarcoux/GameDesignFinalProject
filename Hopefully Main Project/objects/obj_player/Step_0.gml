//get player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

if(key_left) || (key_right) || (key_jump){
	controller = 0;
}

if(abs(gamepad_axis_value(0, gp_axislh)) > 0.2){
	key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
	key_right = max(gamepad_axis_value(0, gp_axislh), 0);
	controller = 1;
}

//calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if(place_meeting(x, y+1, obj_stone)) && (key_jump){
	vsp = -7;
	while(!place_meeting(x, y+1, obj_stone)) {
		hsp = hsp;
		vsp = vsp;
	}
}

//horizontal collision
if(place_meeting(x+hsp, y, obj_stone)){
	while(!place_meeting(x+sign(hsp), y, obj_stone)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertical collision
if(place_meeting(x, y+vsp, obj_stone)){
	while(!place_meeting(x, y+sign(vsp), obj_stone)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;