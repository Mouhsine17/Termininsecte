extends Node2D

const PLANTE = preload("res://scenes/plante.tscn")

var distance: float = 0.0
var score: int = 0
var niveau: int = 1
var delai_plante: float = 1.0
var nombre_plantes: int = 0

@onready var texte_distance: Label = $Interface/Distance


func _process(delta: float) -> void:
	# La progression accélère avec les niveaux.
	distance += (15.0 + (niveau - 1) * 2.0) * delta
	niveau = int(distance / 200.0) + 1

	texte_distance.text = "Distance : %d m | Niveau %d" % [
		int(distance), niveau
	]

	# Le décor défile de plus en plus vite.
	$Decor.vitesse = minf(
		180.0 + (niveau - 1) * 30.0, 420.0
	)

	delai_plante -= delta

	if delai_plante <= 0.0:
		creer_plante()
		delai_plante = maxf(
			0.65, 1.6 - (niveau - 1) * 0.15
		)


func creer_plante() -> void:
	var plante = PLANTE.instantiate()
	var taille: Vector2 = get_viewport_rect().size

	nombre_plantes += 1

	# Toute la hauteur est maintenant accessible aux plantes.
	var hauteur: float = randf_range(20.0, taille.y - 20.0)

	# Une plante sur deux arrive à la hauteur du joueur.
	if nombre_plantes % 2 == 0:
		hauteur = clampf(
			$Insecte.position.y, 20.0, taille.y - 20.0
		)

	plante.position = Vector2(taille.x + 60.0, hauteur)
	plante.vitesse = minf(
		360.0 + (niveau - 1) * 45.0, 720.0
	)

	add_child(plante)


func ajouter_points(points: int) -> void:
	score += points
	$Interface/Score.text = "Score : " + str(score)
	
func _ready() -> void:
	$Interface/Defaite.hide()
	$Interface/Defaite.process_mode = Node.PROCESS_MODE_ALWAYS
	$Interface/Defaite/Rejouer.pressed.connect(rejouer)


func terminer_partie() -> void:
	$Interface/Defaite/Titre.text = (
		"Partie terminée !\nScore : %d\nDistance : %d m"
		% [score, int(distance)]
	)

	$Interface/Defaite.show()
	$Interface/Defaite/Rejouer.grab_focus()
	get_tree().paused = true

func rejouer() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
