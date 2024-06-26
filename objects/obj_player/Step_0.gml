/// @description Core Player Logic

//Get Player Inputs

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
	vsp = -jumpsp	
}

//Verical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp

//Animation
if (!place_meeting(x,y+1,obj_wall))
{
	sprite_index = spr_player_jumping;
	image_speed = 0;
	if(vsp > 0) image_index = 1; else image_index = 0;
}
else {
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player_idle;
	}
	else 
	{
		sprite_index = spr_player_walking;
	}
}

if (hsp != 0) image_xscale = sign(hsp);


