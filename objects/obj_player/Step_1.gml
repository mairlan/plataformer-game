/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//checando se eu acabei de cair no chao
var temp = place_meeting(x, y + 1, obj_ground);

if(temp && !chao) // Acabei e tocar no chao
{
	xscale = 1.6;
	yscale = .5;
}


// reiniciando o jogo

if(keyboard_check_pressed(vk_enter)) room_restart();

