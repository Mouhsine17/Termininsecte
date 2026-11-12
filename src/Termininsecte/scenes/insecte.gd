extends CharacterBody2D

const PROJECTILE = preload("res://scenes/projectile.tscn")
const MARGE: float = 85.0

@export var gravite: float = 900.0
@export var force_montee: float = 1400.0
@export var vitesse_max: float = 350.0

var vies: int = 3
var invincible: bool = false
var delai_tir: float = 0.0

func _physics_process(delta: float) -> void:
	# Vol de l'insecte
	velocity.y += gravite * delta

	if Input.is_action_pressed("voler"):
		velocity.y -= force_montee * delta

	velocity.y = clampf(velocity.y, -vitesse_max, vitesse_max)
	velocity.x = 0.0

	# Un tir à chaque pression sur X
	delai_tir = maxf(0.0, delai_tir - delta)

	if Input.is_action_pressed("tirer") and delai_tir <= 0.0:
		tirer()
		delai_tir = 0.25

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
	projectile.global_position = $SortieTir.global_position
	

func recevoir_degats() -> void:
	if invincible:
		return

	invincible = true
	vies -= 1

	var affichage = get_parent().get_node("Interface/Vies")
	affichage.text = "Vies : " + str(vies)

	if vies <= 0:
		get_parent().call_deferred("terminer_partie")
		return

	for i in range(6):
		modulate.a = 0.3
		await get_tree().create_timer(0.1).timeout
		modulate.a = 1.0
		await get_tree().create_timer(0.1).timeout

	invincible = false
