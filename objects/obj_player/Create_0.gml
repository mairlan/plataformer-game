/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
deslize = 2;

//-------------------- velocidades
velh = 0;
velv = 0;

//-------------------- limites das velocidades
max_velh = 6;
max_velv = 8;
len = 10;

// bonus para o pulo
limite_pulo = 6;
timer_pulo = 0;

limite_buffer = 6;
timer_queda = 0;
buffer_pulo = false;

limite_parede = 6;
timer_parede = 0;



//------------------- variaveis de controle
chao = false;
parede_dir = false;
parede_esq = false;

yscale = 1;
xscale = 1;
dura = room_speed/4;
dir = 0;
carga = 1;
ultima_parede = 0;



//controlando cor 
sat = 255;

// State machine
enum state {
	parado, movendo, dash
}

estado = state.parado;



