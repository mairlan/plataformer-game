/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// chacando se estou tocando no chao
chao = place_meeting(x, y+1, obj_ground)
parede_dir = place_meeting(x+1, y, obj_jump_wall);
parede_esq = place_meeting(x-1, y, obj_jump_wall);


// configurando o meu timer do pulo
if(chao) 
{
	max_velv = 8;
	grav = .3;
	carga = 1;
	timer_pulo = limite_pulo;	
}else 
{
	if(timer_pulo > 0) timer_pulo--; 
}

if(parede_dir or parede_esq)
{
	if(parede_dir ) ultima_parede = 0
	else ultima_parede = 1;
	timer_parede = limite_parede;
}else
{
	if(timer_parede > 0) limite_parede--;
}



var left, right, up, down, jump, jump_s, avanco_h, dash;

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
//down = keyboard_check(ord("F"));
jump = keyboard_check_pressed(vk_space);
jump_s = keyboard_check_released(vk_space);
dash = keyboard_check_pressed(vk_shift);


// configurando informações da movimentação
avanco_h = (right - left) * max_velh;
// valor da aceleração
if(chao) acel = acel_chao;
else acel = acel_ar;

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
		
		//Aplicando a gravidade tambem
		if(!chao) velv += grav
		
		
		//Saindo do estado
		//movendo
		if(abs(velh) > 0 or abs(velv) > 0 or left or right or jump){
			estado = state.movendo;
		}
		
		// DASH
		if(dash && carga > 0)
		{
			//Decidindo a direção
			dir = point_direction(0,0,(right-left),(down - up));
			
			
			estado = state.dash;
			carga = 0;
		}	
		
		break;
		
	case state.movendo:
		
		//Aplicando a movimentação
		velh = lerp(velh, avanco_h, acel);
		
		
		// gravidade e parede
		if(!chao && (parede_dir or parede_esq or timer_parede))
		{
			// não estou no chao, mas estou tocando na parede
			if(velh > 0) //estou na parede e estou caindo
			{
				velv = lerp(velv, deslize, acel);
			}else
			{
				velv += grav;
			}
			
			// pulando pelas paredes
			if(!ultima_parede && jump ) //Estou na parede e tentei pular
			{
				velv = -max_velv 
				velh = -max_velh
				xscale = .5;
				yscale = 1.5;
				carga = 1;
			}else if (ultima_parede && jump)
			{
				velv = -max_velv 
				velh = max_velh
				xscale = .5;
				yscale = 1.5;
				carga = 1;
				
			}
		}else if (!chao) // não estou no chao nem na parede
		{

			velv += grav;
			if(down)
			{
				max_velv = 12;
				grav = 12;
			}else {
				grav = .3;
			}
		}
		
		
		//pulando
		if(jump && (chao or timer_pulo > 0)) 
		{
			velv = -max_velv;
			
			//alterando a escala
			xscale = .5;
			yscale = 1.5;
		}
		
		//buffer pulo
		if(jump) timer_queda = limite_buffer;
		
		if(timer_queda > 0) buffer_pulo = true;
		else buffer_pulo = false;
		
		if(buffer_pulo) // Eu posso pular
		{
			if(chao or timer_pulo) // as demais condições para o pulo são verdadeiras também
			{
				velv = -max_velv;
				//alterando a escala
				xscale = .5;
				yscale = 1.5;
				
				timer_pulo = 0;
				timer_queda = 0;
			}
			timer_queda--;
			
		}
		
		// Controlando a altura do pulo
		if(jump_s && velv < 0) velv *= .7;
		
		//Dash
		if(dash && carga > 0)
		{
			//Decidindo a direção
			dir = point_direction(0,0,(right-left),(down - up));
			
			
			estado = state.dash;
			carga = 0;
		}		
		
		// limitando as velocidades
		velv = clamp(velv, -max_velv, max_velv)		
		
		break;
	case state.dash:

		dura--
		
		velh = lengthdir_x(len, dir);
		velv = lengthdir_y(len, dir)
		
		//Deformando o player
		if(dir == 90 or dir == 270)
		{
			yscale = 1.5;
			xscale = .5;
		}else
		{
			yscale = .5;
			xscale = 1.6;
		}
		
		
		
		//criando o rastro
		var rastro = instance_create_layer(x,y, layer, obj_player_rastro)
		rastro.xscale = xscale;
		rastro.yscale = yscale;
		
		
		
		
		
		//Saindo do estado
		if(dura <= 0)
		{
			estado = state.movendo;
			dura = room_speed/4;
			
			//Diminuindo a velocidade
			velh = (max_velh * sign(velh) * .5);
			velv = (max_velv * sign(velv) * .5);
			
		}
	
	
		break;
}

// debug do estado
show_debug_message(estado);

switch (carga)
{
	case 0:
		sat = lerp(sat, 50, .05);
		break;
	case 1:
		sat = lerp(sat, 255, .05);
		break;	
}

// definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);


// voltando para a escala original
xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);








