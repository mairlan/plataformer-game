/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// chacando se estou tocando no chao
chao = place_meeting(x, y+1, obj_ground)


var left, right, jump,

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);

//--------------------------------STATE MACHINE ------------------
switch(estado)
{
	case state.parado:
		velh = 0;
		velv = 0;
		
		// posso mudar minha velocidade
		
		//pulando
		if(jump && chao){
			velv = -max_velv;
		}
		
		//Saindo do estado
		if(abs(velh ) > 0 or abs(velv ) > 0 or left or right or jump){
			estado = state.movendo;
		}
		break;
		
	case state.movendo:
		
		// gravidade
		if(!chao) velv += grav
		
		break;
	case state.dash:
	
		break;
}

// debug do estado
show_debug_message(estado);


// limitando as velocidades
velv = clamp(velv, -max_velv, max_velv)





