/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _playerDerrotado = instance_exists(obj_player_death)

if(!_playerDerrotado)
{
	show_debug_message("não deletou")
	if(file_exists("checkpoint.ini"))
	{
		file_delete("checkpoint.ini");
	}	
}else {
	show_debug_message("não deletou")
}





