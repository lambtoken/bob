extends Resource
class_name Mob_stats

@export var MAX_HP: float = 10.0
var CURRENT_HP:float = 0
@export var ATK: float = 10.0
@export var SPEED: float = 200.0

func _init() -> void:
	CURRENT_HP = MAX_HP
