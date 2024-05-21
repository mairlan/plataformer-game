/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;

//-------------------- velocidades
velh = 0;
velv = 0;

//-------------------- limites das velocidades
max_velh = 6;
max_velv = 8;


//------------------- variaveis de controle
chao = false;

enum state {
	parado, movendo, dash
}

estado = state.parado;



