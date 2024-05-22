/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.porta_aberta == true)
{
	show_debug_message(global.porta_aberta);
	image_alpha -= 0.1
	if(image_alpha < 0.1)
	{
		instance_destroy();
	}
}





