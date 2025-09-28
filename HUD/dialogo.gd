# dialogo.gd (Versão "Forçar Visibilidade")
extends CanvasLayer

# Pegamos uma referência tanto ao Panel quanto ao Label
@onready var panel = $Panel
@onready var label = $Panel/Label

func _ready():
	# Garante que tudo comece escondido
	hide()
	if is_instance_valid(panel):
		panel.hide()

func show_dialog(text: String):
	print("--- INICIANDO PROCESSO DE EXIBIÇÃO ---")

	# PASSO 1: Forçar o CanvasLayer (o próprio nó) a ser visível
	show()
	print("CanvasLayer 'Dialogos' definido como visível.")

	# PASSO 2: Forçar o Panel a ser visível
	if is_instance_valid(panel):
		panel.show()
		print("Nó 'Panel' forçado a ser visível.")
	else:
		print("!!! ERRO CRÍTICO: Não foi possível encontrar o nó 'Panel'. Verifique o nome na cena. !!!")
		return # Interrompe a função se o Panel não for encontrado

	# PASSO 3: Forçar o Label a ser visível e definir o texto
	if is_instance_valid(label):
		label.show() # Força o Label a ser visível, só por garantia
		label.text = text
		print("Nó 'Label' forçado a ser visível com o texto: '", text, "'")
	else:
		print("!!! ERRO CRÍTICO: Não foi possível encontrar o nó 'Label' dentro do Panel. Verifique o nome na cena. !!!")

	print("--- FIM DO PROCESSO DE EXIBIÇÃO ---")


# --- Funções para esconder o diálogo (sem o pause por enquanto) ---
func hide_dialog():
	if is_instance_valid(panel):
		panel.hide()
	hide()

func _unhandled_input(event):
	if visible and panel.visible: # Verifica se ambos estão visíveis
		if event.is_action_pressed("interagir"):
			hide_dialog()
			get_tree().get_root().set_input_as_handled()
