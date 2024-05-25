// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

#region variaveis
// variavel para porta aberta ou não
global.porta_aberta = false;

// checkpoint
global.xATUAL = 0;
global.yATUAL = 0;



#endregion

#region funções

function jogo_acaba()
{
	global.porta_aberta = false;
	x = global.xATUAL;
	y = global.yATUAL;
	
	room_restart();

}





#endregion

