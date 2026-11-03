extends Node2D

const PLANTE = preload("res://scenes/plante.tscn")

var delai_plante: float = 2.0


func _process(delta: float) -> void:
	delai_plante -= delta

	if delai_plante <= 0.0:
		creer_plante()
		delai_plante = 2.0


func creer_plante() -> void:
	var plante = PLANTE.instantiate()
	var taille: Vector2 = get_viewport_rect().size

	add_child(plante)
	plante.position = Vector2(
		taille.x + 60.0,
		randf_range(60.0, taille.y - 60.0)
	)
