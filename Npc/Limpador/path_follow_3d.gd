extends PathFollow3D # ou o tipo de nó que o "Limpador" for

# A partir do pai, podemos "enxergar" os filhos
@onready var animation_player = $AnimationPlayer
@onready var sprite_animado = $AnimatedSprite3D

func _ready():
	# Agora sim, a partir do pai, você dá play no filho
	sprite_animado.play("default")
	
	# E aproveita para dar play na animação de movimento também!
	animation_player.play("andando")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	# É uma boa prática verificar se a animação correta terminou,
	# caso você tenha outras animações no futuro.
	if anim_name == "andando":
		print("Animação 'andando' terminou. O limpador vai sumir!")
		# Esta linha remove o Limpador da cena. É o "teleporte"!
		queue_free()
	pass # Replace with function body.
