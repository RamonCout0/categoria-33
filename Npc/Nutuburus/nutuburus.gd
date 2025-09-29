extends Area3D

@onready var animacao = $AnimatedSprite3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animacao.play("default")
	pass # Replace with function body.
