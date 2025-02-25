extends CharacterBody2D

const SPEED: float = 200.0

func _init() -> void:
	add_to_group("enemies")

func _process(delta: float) -> void:
		
	var dir = (Global.player.position - position).normalized()
	velocity = dir * SPEED
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
