/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// colisão horizontal
if(place_meeting(x+velh, y, obj_ground)){
	while(!place_meeting(x+sign(velh), y, obj_ground)){
		x += sign(velh);
	}
	velh = 0;
}




// colisão vertical
if(place_meeting(x, y + velv, obj_ground)){
	while(!place_meeting(x, y + sign(velv), obj_ground)){
		y += sign(velv);
	}
	velv = 0;
}

// colisão com a parede de wall jump

// colisão horizontal
if(place_meeting(x+velh, y, obj_jump_wall)){
	while(!place_meeting(x+sign(velh), y, obj_jump_wall)){
		x += sign(velh);
	}
	velh = 0;
}




// colisão vertical
/*
if(place_meeting(x, y + velv, obj_jump_wall)){
	while(!place_meeting(x, y + sign(velv), obj_jump_wall)){
		y += sign(velv);
	}
	velv = 0;
}
*/

//colisão com a porta
if(place_meeting(x+velh, y, obj_porta)){
	while(!place_meeting(x+sign(velh), y, obj_porta)){
		x += sign(velh);
	}
	velh = 0;
}

// colisão vertical com a porta
if(place_meeting(x, y+velv, obj_porta))
{
	while(!place_meeting(x, y +sign(velv), obj_porta))
	{
		y += sign(velv);
	}
	velv = 0;
}

var jump, jump_s;
jump = keyboard_check_pressed(ord("W"));
jump_s = keyboard_check_released(ord("W"));

//pulando
if(jump && (chao or timer_pulo > 0) && !place_meeting(x, y+velv, obj_porta)) 
{
	velv = -max_velv;
			
	//alterando a escala
	xscale = .5;
	yscale = 1.5;
	// criando a "poeira"
	for(var i = 0; i < irandom_range(4, 10); i++)
	{
		var xx = random_range(x - sprite_width/2, x + sprite_width/2);
		instance_create_depth(xx, y, depth - 1000, obj_vel);
	}		
			
}


x += velh;
y += velv;





