extends Control
@onready var Mira = $Mira/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Mira.play("default")
	pass # Replace with function body.
