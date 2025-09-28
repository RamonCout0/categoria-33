# npc.gd
extends Area3D

# Esta função será chamada pelo RayCast do jogador
func interact():
	# A linha abaixo é a que "chama" o diálogo.
	# Nós acessamos nosso Autoload global 'DialogManager' e chamamos a função dele.
	Dialogos.show_dialog("Olá, viajante! Fico feliz em te ver.")

	# Você pode manter o print para testar, se quiser.
	print("Você interagiu comigo, o NPC!")
