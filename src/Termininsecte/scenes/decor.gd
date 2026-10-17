extends Node2D

@export var vitesse: float = 250.0

const LARGEUR: float = 1152.0

@onready var fond1: ColorRect = $Fond1
@onready var fond2: ColorRect = $Fond2


func _ready() -> void:
	fond1.position = Vector2.ZERO
	fond2.position = Vector2(LARGEUR, 0.0)


func _process(delta: float) -> void:
	fond1.position.x -= vitesse * delta
	fond2.position.x -= vitesse * delta

	if fond1.position.x <= -LARGEUR:
		fond1.position.x = fond2.position.x + LARGEUR

	if fond2.position.x <= -LARGEUR:
		fond2.position.x = fond1.position.x + LARGEUR
