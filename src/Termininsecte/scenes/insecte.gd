extends CharacterBody2D

const PROJECTILE = preload("res://scenes/projectile.tscn")
const MARGE: float = 20.0

@export var gravite: float = 900.0
@export var force_montee: float = 1400.0
@export var vitesse_max: float = 350.0


func _physics_process(delta: float) -> void:
	# Vol de l'insecte
	velocity.y += gravite * delta

	if Input.is_action_pressed("voler"):
		velocity.y -= force_montee * delta

	velocity.y = clampf(velocity.y, -vitesse_max, vitesse_max)
	velocity.x = 0.0

	# Un tir à chaque pression sur X
	if Input.is_action_just_pressed("tirer"):
		tirer()

	move_and_slide()

	# Garder l'insecte dans l'écran
	var hauteur: float = get_viewport_rect().size.y

	if position.y < MARGE:
		position.y = MARGE
		velocity.y = 0.0
	elif position.y > hauteur - MARGE:
		position.y = hauteur - MARGE
		velocity.y = 0.0


func tirer() -> void:
	var projectile = PROJECTILE.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position + Vector2(35, 0)
