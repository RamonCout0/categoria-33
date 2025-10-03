# VERSÃO FINAL PARA GODOT 4
extends SpotLight3D

# --- Variáveis para ajustar no Inspetor ---
@export var sway_amount: float = 0.2
@export var sway_speed: float = 2.0
@export var player_node_path: NodePath

# --- Variáveis internas ---
var player: CharacterBody3D
var noise = FastNoiseLite.new() # <-- MUDANÇA PRINCIPAL AQUI
var noise_time: float = 0.0

func _ready():
	if player_node_path:
		player = get_node(player_node_path)

	# --- Configurando o FastNoiseLite (um pouco diferente do OpenSimplexNoise) ---
	noise.seed = randi()
	# Define o tipo de ruído. O Simplex Suave é o mais parecido com o OpenSimplex antigo.
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	# Frequência controla o "zoom" do ruído. Valores menores deixam as ondas mais longas.
	noise.frequency = 0.5
	# Octaves agora se chama "fractal_octaves". Controla os detalhes do ruído.
	noise.fractal_octaves = 2


func _process(delta: float):
	if not is_instance_valid(player):
		return

	if player.get_real_velocity().length() > 0.1:
		noise_time += delta * sway_speed
		
		# Felizmente, o método de pegar o ruído continua o mesmo!
		var noise_x = noise.get_noise_1d(noise_time)
		var noise_y = noise.get_noise_1d(noise_time + 100)
		
		self.rotation_degrees.x = noise_x * sway_amount
		self.rotation_degrees.y = noise_y * sway_amount
		
	else:
		self.rotation_degrees = lerp(self.rotation_degrees, Vector3.ZERO, delta * 5.0)
