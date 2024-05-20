 /// @description Insert description here
// You can write your code in this editor

#region controles
var left, right, jump, dash;

var _chao = place_meeting(x,y+1, obj_parede); // colisão com o chão
var _walljump = place_meeting(x-5, y, obj_walljump) - place_meeting(x+5, y, obj_walljump); // direita

left = keyboard_check(ord("A")); // anda para a esquerda
right = keyboard_check(ord("D")); // anda para a direita
jump = keyboard_check_pressed(vk_space); // pula
dash = keyboard_check(vk_shift); // dash
down = keyboard_check(ord("S")); // Descer

mvtLocked = max(mvtLocked - 1, 0);

// aplicando a velocidade horizontal
x +=  hspd;
// aplicando a velocidade vertical
y += vspd;


xdirection = right - left;

hspd = xdirection * spd; // definindo para onde andar (esquerda ou direita)

if(_walljump !=0) {
	vspd = min(vspd + 1, 5)
}else {
	vspd++;
}


if(jump){
	if(_chao){
		vspd = -vel_jump;
	}
	if(_walljump != 0){
		vspd = -vel_jump;
		hspd = _walljump * vel_jump;
		mvtLocked = 10;
	}
}


#endregion

#region SE esta no chao ou não
if(_chao) // se esta no chao
{
	pode_pular = true;
}
else // se não estou no chão
{
	vspd ++; // aplicando a gravidade
	pode_pular = false;
	if(dash && (left or right)) // SE esta apertando o dash e a esquerda ou direita
	{
		// criando os rastros do player quando da o dash
		instance_create_layer(x,y,"player",obj_player_rastro);
		if(sign(hspd)){ 
			hspd +=10.5;
		}else {
			hspd -=10.5;
		}
	}
	if (down){
		grv += 0.22;
	} else {
		grv=0.45;
	}
}


#endregion

image_yscale = lerp(image_yscale, escala_inicial_y, 0.1);

#region colisão
	var _col = place_meeting(x - 2, y, obj_parede);
	// colisão com o obj_parede
	if (_col)
	{
		//se eu colidir não importando o lado eu paro
		hspd = 0;
	}
	
	var _col = place_meeting(x, y + vspd, obj_parede);
	if (_col)
	{
		//se eu colidir não importando o lado eu paro
		vspd = 0;
	}
	// colisão porta
	// colindo com horizontal
	var _col_door = place_meeting(x + hspd,y,obj_porta)
	if(_col_door)
	{
		if(!global.porta_aberta)
		{
			hspd = 0;
		}
	}
	//colidindo na vertical
	var _col_door = place_meeting(x,y+vspd, obj_porta)
	if(_col_door)
	{
		if(!global.porta_aberta)
		{
			vspd = 0;
		}
	}


	
	
#endregion



if(y > room_height){
	game_restart()
}







