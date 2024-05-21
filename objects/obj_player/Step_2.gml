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





x += velh;
y += velv;





