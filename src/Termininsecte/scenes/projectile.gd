extends Area2D

@export var vitesse: float = 700.0
var temps_de_vie: float = 2.0

func _physics_process(delta: float) -> void:
	position.x += vitesse * delta

	temps_de_vie -= delta
	if temps_de_vie <= 0.0:
		queue_free()
