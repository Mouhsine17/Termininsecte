extends Node2D

@export var vitesse: float = 150.0

@onready var fond1: Sprite2D = $Fond1
@onready var fond2: Sprite2D = $Fond2

var largeur: float


func _ready() -> void:
	var taille_ecran: Vector2 = get_viewport_rect().size
	largeur = taille_ecran.x

	for fond in [fond1, fond2]:
		fond.centered = false
		fond.scale = taille_ecran / fond.texture.get_size()

	fond1.position = Vector2.ZERO
	fond2.position = Vector2(largeur, 0.0)


func _process(delta: float) -> void:
	fond1.position.x -= vitesse * delta
	fond2.position.x -= vitesse * delta

	if fond1.position.x <= -largeur:
		fond1.position.x = fond2.position.x + largeur

	if fond2.position.x <= -largeur:
		fond2.position.x = fond1.position.x + largeur
		# Transition du jour au crépuscule entre 500 et 600 mètres
		# Une ambiance différente tous les 200 mètres.
	var teintes: Array[Color] = [
		Color.WHITE,
		Color("#DAB18A"),
		Color("#9582BD"),
		Color("#729CB5")
	]

	var niveau: int = get_parent().niveau
	var indice: int = (niveau - 1) % teintes.size()
	var cible: Color = teintes[indice]

	fond1.modulate = fond1.modulate.lerp(
		cible, 1.0 - exp(-delta * 1.5)
	)
	fond2.modulate = fond1.modulate

	
