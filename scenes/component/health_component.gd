extends Node
class_name HealthComponent

signal died
signal health_changed


@export var max_health: float = 10
var current_health

func _ready() -> void:
	current_health = max_health


func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0)
	health_changed.emit()
	Callable(check_death).call_deferred()

func get_health_percent():
	if max_health <= 0:
		return 0
	return min(current_health / max_health,1)


func check_death():
	if(0 == current_health):
		died.emit()
		owner.queue_free()
