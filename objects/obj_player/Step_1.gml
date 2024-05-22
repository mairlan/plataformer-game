/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//checando se eu acabei de cair no chao
var temp = place_meeting(x, y + 1, obj_ground);

if(temp && !chao) // Acabei e tocar no chao
{
	
	xscale = 1.6;
	yscale = .5;
	max_velv = 8;
	grav = .3;
	
	// criando a "poeira"
	for(var i = 0; i < irandom_range(4, 10); i++)
	{
		var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		instance_create_depth(xx, y, depth - 1000, obj_vel);
	}
}


// reiniciando o jogo

if(keyboard_check_pressed(vk_enter)) game_restart();

