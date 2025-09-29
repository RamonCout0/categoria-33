# npc.gd (Versão Corrigida e Completa)
extends Area3D

@onready var animacao = $AnimatedSprite3D

var falas: Array[String] = [
	"AU AU, Levei pickoff do malphite e morri."
]

# A função _ready() é chamada uma vez quando o nó entra na cena.
# É o lugar perfeito para definir o estado inicial.
func _ready():
	# Conectamos o sinal do DialogManager a uma função nossa.
	DialogManager.dialogo_terminado.connect(on_dialogo_terminado)
	# Definimos a animação inicial como "idle".
	animacao.play("idle")

# Função que o jogador chama ao interagir.
func interact():
	# AQUI é onde você coloca o "talking".
	# A animação de "falando" começa no momento da interação.
	animacao.play("talking")
	
	# Logo depois, iniciamos o diálogo.
	DialogManager.iniciar_dialogo(falas, "Pet <O dog Legit 1/>")

# Esta função é chamada automaticamente quando o diálogo termina, graças à conexão no _ready().
func on_dialogo_terminado():
	# Quando a conversa acaba, o NPC volta a ficar parado.
	animacao.play("idle")
