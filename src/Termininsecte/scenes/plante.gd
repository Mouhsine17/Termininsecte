extends Area2D

@export var vitesse: float = 300.0


func _ready() -> void:
	add_to_group("plantes")
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	position.x -= vitesse * delta

	if position.x < -100.0:
		queue_free()


func _on_body_entered(corps: Node2D) -> void:
	if corps.has_method("recevoir_degats"):
		corps.recevoir_degats()
		queue_free()
