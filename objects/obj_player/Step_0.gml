 /// @description Insert description here
// You can write your code in this editor

#region controles
	var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A")); // define a direção no X, retorna os valores(-1, 0, 1)
	var jump = keyboard_check_pressed(vk_space); // pula, retorna os valores(1 ou 0)
	var onTheGround = place_meeting(x, y + 1, obj_ground); // aperta f1 pra ver oq a função faz
	var onAWall = place_meeting(x-5, y, oWall) - place_meeting(x+5, y, oWall); // aperta f1 pra ver oq a função faz
	var onTheGround_Y = place_meeting(x-5, y, obj_ground) + place_meeting(x+5, y, obj_ground);
	
	show_debug_message(onTheGround_Y);
#endregion
mvtLocked = max(mvtLocked - 1, 0); // tradução da variavel = movimentação travada
if (onAWall != 0) { 
	ySpeed = min(ySpeed + 1, 5);
}	
else {
	ySpeed++;
}
if (mvtLocked <= 0) {
    xSpeed = xDirection * spd;
 
    if (jump) {
        if (onTheGround) {
            ySpeed = -15;
        } 
        if (onAWall != 0) {
            ySpeed = -15;
            xSpeed = onAWall * spd;
            mvtLocked = 10;
        }
    }
}
 		if(onTheGround_Y){
			xSpeed = 0;
			if(!onTheGround){
				ySpeed++
			}
		}

 
if (place_meeting(x + xSpeed, y, oWall)) { 
    
    while (!place_meeting(x + sign(xSpeed), y, oWall)) {
        x += sign(xSpeed);
    }
    xSpeed = 0; 
}
 
x += xSpeed;
 
 
if (place_meeting(x, y + ySpeed, obj_ground)) { 
    while (!place_meeting(x, y + sign(ySpeed), obj_ground)) {
        y += sign(ySpeed);
    }
    ySpeed = 0; 
}
 
y += ySpeed;
if(y > room_height){
	game_restart()
}







