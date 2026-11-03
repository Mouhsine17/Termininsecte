extends Area2D

@export var vitesse: float = 300.0


func _physics_process(delta: float) -> void:
	position.x -= vitesse * delta

	# Supprimer la plante lorsqu'elle quitte l'écran
	if position.x < -100.0:
		queue_free()
