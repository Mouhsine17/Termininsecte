extends CharacterBody2D

@export var gravite: float = 900.0
@export var force_montee: float = 1400.0
@export var vitesse_max: float = 350.0

const MARGE: float = 20.0


func _physics_process(delta: float) -> void:
	# La gravité accélère l’insecte vers le bas.
	velocity.y += gravite * delta

	# Maintenir Espace applique une accélération vers le haut.
	if Input.is_action_pressed("voler"):
		velocity.y -= force_montee * delta

	# Limiter la vitesse de montée et de descente.
	velocity.y = clampf(velocity.y, -vitesse_max, vitesse_max)
	velocity.x = 0.0

	move_and_slide()

	# Garder l’insecte dans la fenêtre.
	var hauteur: float = get_viewport_rect().size.y

	if position.y < MARGE:
		position.y = MARGE
		velocity.y = 0.0
	elif position.y > hauteur - MARGE:
		position.y = hauteur - MARGE
		velocity.y = 0.0