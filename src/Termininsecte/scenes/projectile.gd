extends Area2D

@export var vitesse: float = 700.0
var temps_de_vie: float = 2.0


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _physics_process(delta: float) -> void:
	position.x += vitesse * delta

	temps_de_vie -= delta
	if temps_de_vie <= 0.0:
		queue_free()


func _on_area_entered(zone: Area2D) -> void:
	if zone.is_in_group("plantes") and not zone.is_queued_for_deletion():
		get_parent().ajouter_points(100)
		zone.queue_free()
		queue_free()
