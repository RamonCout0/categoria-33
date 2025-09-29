# dialogo.gd (Versão Final Completa)
extends CanvasLayer

signal dialogo_terminado

# dialogo.gd - CORREÇÃO DOS CAMINHOS @onready

# Como todos os nós abaixo são filhos diretos de "Dialogos" (onde o script está),
# o caminho para cada um deles é simplesmente o seu nome precedido por "$".

@onready var caixa_de_dialogo = $CaixaDeDialogo
@onready var nome_label = $CaixaDeDialogo/NomeLabel
@onready var texto_label = $CaixaDeDialogo/TextoLabel
@onready var indicador_proximo = $CaixaDeDialogo/IndicadorProximo

@onready var letra_timer = $LetraTimer

# O resto do seu script (iniciar_dialogo, _on_letra_timer_timeout, etc.) está perfeito e não precisa mudar.
# Variáveis para controlar o estado do diálogo
var linhas_de_dialogo: Array[String] = []
var linha_atual: int = 0
var dialogo_ativo: bool = false
var texto_completo: bool = false

func _ready():
	caixa_de_dialogo.hide()

func iniciar_dialogo(linhas: Array[String], nome_personagem: String = ""):
	if dialogo_ativo: return
	
	linhas_de_dialogo = linhas
	linha_atual = 0
	dialogo_ativo = true
	nome_label.text = nome_personagem
	caixa_de_dialogo.show()
	get_tree().paused = true # Pausa o jogo
	
	mostrar_proxima_linha()

func mostrar_proxima_linha():
	if linha_atual >= linhas_de_dialogo.size():
		terminar_dialogo()
		return
	
	texto_label.text = ""
	texto_completo = false
	indicador_proximo.hide()
	letra_timer.start()
	linha_atual += 1

func _on_letra_timer_timeout():
	if texto_label.text.length() < linhas_de_dialogo[linha_atual - 1].length():
		texto_label.text += linhas_de_dialogo[linha_atual - 1][texto_label.text.length()]
	else:
		letra_timer.stop()
		texto_completo = true
		indicador_proximo.show()

# --- ESTA É A FUNÇÃO QUE PRECISA ESTAR CORRETA ---
func _unhandled_input(event):
	# A função correta para checar o input do evento é "is_action_pressed"
	if dialogo_ativo and event.is_action_pressed("interagir"):
		if texto_completo:
			mostrar_proxima_linha()
		else:
			letra_timer.stop()
			texto_label.text = linhas_de_dialogo[linha_atual - 1]
			texto_completo = true
			indicador_proximo.show()

func terminar_dialogo():
	dialogo_ativo = false
	caixa_de_dialogo.hide()
	get_tree().paused = false # Despausa o jogo
	emit_signal("dialogo_terminado")
