extends Node
class_name HealthComponent

signal died

@export var max_health: float = 10
var current_health

func _ready() -> void:
	current_health = max_health


func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0)
	Callable(check_death).call_deferred()

func check_death():
	if(0 == current_health):
		died.emit()
		owner.queue_free()
