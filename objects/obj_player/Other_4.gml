/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(file_exists("checkpoint.ini"))
{
	ini_open("checkpoint.ini")
	
	x = ini_read_real("player", "x", x);
	y = ini_read_real("player", "y", y);
	
	
	ini_close()
	
}






