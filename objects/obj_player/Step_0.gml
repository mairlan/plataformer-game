/// @description Insert description here
// You can write your code in this editor

#region controles
var left, right, jump, dash;

var _chao = place_meeting(x,y+1, obj_parede); // colisão com o chão
left = keyboard_check(ord("A")); // anda para a esquerda
right = keyboard_check(ord("D")); // anda para a direita
jump = keyboard_check_pressed(vk_space); // pula
dash = keyboard_check(vk_shift); // dash

hspd = (right - left) * spd; // definindo para onde andar (esquerda ou direita)

#endregion

#region SE esta no chao ou não
if(_chao) // se esta no chao
{
	if(jump) // se apertou para pular
	{
		vspd -= vel_jump;
	}
}
else // se não estou no chão
{
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
	vspd += grv; // aplicando a gravidade
}
#endregion

#region colisão
	var _col = place_meeting(x + hspd, y, obj_parede);
	// se colidir grudo em quem colidir
	if (_col)
	{
		// checando se estou indo para a direita
		if(hspd > 0){
			// grudando na parte esquerda
			x = _col.bbox_left + (x - bbox_right);
		}
	
		// checando se estou indo para a esquerda
		if(hspd < 0){
			x = _col.bbox_right + (x - bbox_left);

		}
		//se eu colidir não importando o lado eu paro
		hspd = 0;
	}
	
	var _col = place_meeting(x, y + vspd, obj_parede);
	if (_col)
	{

		// checando se estou indo para a baixo
		if(vspd > 0){
			y = _col.bbox_top +(y - bbox_bottom);
		}
	
		// checando se estou indo para a cima
		if(vspd < 0){
			y = _col.bbox_bottom + (y - bbox_top);
		}

		//se eu colidir não importando o lado eu paro
		vspd = 0;
	}
	// colisão porta
	var _col_door = place_meeting(x + hspd,y,obj_porta)
	if(_col_door)
	{
		if(!global.porta_aberta)
		{
			hspd = 0;
		}
	}
	var _col_door = place_meeting(x,y+vspd, obj_porta)
	if(_col_door)
	{
		if(!global.porta_aberta)
		{
			vspd = 0;
		}
	}
	// aplicando a velocidade horizontal
	x +=  hspd;
	// aplicando a velocidade vertical
	y += vspd;
	
	
#endregion











