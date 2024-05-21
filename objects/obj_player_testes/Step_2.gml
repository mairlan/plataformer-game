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

x += velh;
y += velv;





