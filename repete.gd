extends Area3D



# Aqui você escreve o diálogo específico deste NPC.
# Cada string no array é uma "página" da conversa.
var falas: Array[String] = [
	"Olá, viajante! O dia está lindo hoje, não acha?",
	"Se estiver procurando por aventura, ouvi dizer que a velha mina está emitindo sons estranhos...",
	"Tenha cuidado por lá."
]

# Função que o jogador chama ao interagir.
func interact():
	# Simplesmente chamamos nosso serviço global de diálogo.
	DialogManager.iniciar_dialogo(falas, "Aldeão Simpático")
