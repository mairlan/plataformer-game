 /// @description Insert description here
// You can write your code in this editor

#region controles
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var down = keyboard_check(ord("S"));
	var xDirection = right - left; // define a direção no X, retorna os valores(-1, 0, 1)
	var jump = keyboard_check_pressed(vk_space); // pula, retorna os valores(1 ou 0)
	var onTheGround = place_meeting(x, y + 1, obj_ground); // 
	var onAWall = place_meeting(x-5, y, obj_jump_wall) - place_meeting(x+5, y, obj_jump_wall); // 
	var onTheGround_Y = place_meeting(x-5, y, obj_ground) + place_meeting(x+5, y, obj_ground); //retorna os valores 1 e 0, 0 para quando não estiver colidindo e 1 para quando estiver 
	var dash = keyboard_check(vk_shift);
	show_debug_message(onAWall);
#endregion

//proibe o jogador de mudar de direção 
mvtLocked = max(mvtLocked - 1, 0); // a função max retorna o maior valor dos colocado entre ()


if (onAWall != 0) { //quando a variavel onAWall retornar um valor diferente de 0, ou seja,quando estiver encostando no obj_jump_wall
	ySpeed = min(ySpeed + 1, 5); // ira diminuir a velocidade de queda
}	
else { // se não 
	ySpeed += 0.6; // irá definir a gravidade para o valor normal
	// ir para baixo mais rapido
	if (down){
		 ySpeed += 8; 
    } else {
        ySpeed += .6;
    }
}

if (mvtLocked <= 0) { // se a variavel mvtLocked for menor ou igual a 0
    xSpeed = xDirection * spd; // vai poder mudar a direção do player
	// e vai poder executar o seguinte if
    if (jump) { // se a variavel jump retornar 1, ou seja, quando espaço ou outra tecla for apertada
        // e vai poder executar os seguintes ifs
		if (onTheGround) { // se a variavel onTheGround estiver retornando 1, ou seja, o player estiver colidindo com a parte superior do obj_ground
            ySpeed = -15; // vai definir o valor da variavel ySpeed como -15
        } 
        if (onAWall != 0) { // se o valor retornado da variavel onAWall for diferente de 0
            ySpeed = -15; // vai definir o valor da variavel ySpeed como -15
            xSpeed = onAWall * spd; // dependendo do lado da parede em que estiver pular para o lado oposto
            mvtLocked = 10; // define a variavel mvtLocked = 10, ou seja, trava a movimentação por um periodo
        }
    }
}
 		if(onTheGround_Y){ 
			xSpeed = 0;
			if(!onTheGround){
				ySpeed++
			}
		}

 // pulo na parede
if (place_meeting(x + xSpeed, y, obj_jump_wall)) { 
    
    while (!place_meeting(x + sign(xSpeed), y, obj_jump_wall)) {
        x += sign(xSpeed);
    }
    xSpeed = 0;
}
 
if (place_meeting(x, y + ySpeed, obj_jump_wall)) { 
    
    while (!place_meeting(x , y + sign(ySpeed), obj_jump_wall)) {
        y += sign(ySpeed);
    }
    ySpeed = 0;
}
 
 
 
 // chao
if (place_meeting(x, y + ySpeed, obj_ground)) { 
    
    while (!place_meeting(x, y + sign(ySpeed), obj_ground)) {
        y += sign(ySpeed);
    }
    
    ySpeed = 0; 
}

 if (place_meeting(x + xSpeed, y, obj_ground)) { 
    
    while (!place_meeting(x + sign(xSpeed), y, obj_ground)) {
        x += sign(xSpeed);
    }
    xSpeed = 0.2;
}

/*
	var _col = place_meeting(x + xSpeed, y, obj_ground);
	// se colidir grudo em quem colidir
	if (_col)
	{
		//se eu colidir não importando o lado eu paro
		xSpeed = 0;
	}
	*/
if(y > room_height){
	game_restart()
}


#region codigos anteriores para arrumar

if(dash && (left or right)) // SE esta apertando o dash e a esquerda ou direita
	{

		if(!onTheGround) {
			instance_create_layer(x,y,"player",obj_player_rastro);// criando os rastros do player quando da o dash
			if(sign(xDirection)){ 
				xSpeed +=10.5;
				show_debug_message("passou")
			}else {
				xSpeed -=10.5;
			}
		}
	}
	
y += ySpeed; // adiciona constantemente o valor armazenado na variavel ySpeed ao y, criando a 'gravidade'
x += xSpeed; // adiciona constantemente o valor armazenado na variavel xSpeed ao x





#endregion




