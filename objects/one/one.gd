extends CharacterBody2D

const SPEED: float = 200.0
const MAX_HP: float = 10.0
var CURRENT_HP: float = MAX_HP
var knockbackVelocity: Vector2 = Vector2.ZERO

func _init() -> void:
	add_to_group("enemies")

func _process(delta: float) -> void:
		
	var dir = (Global.player.position - position).normalized()
	velocity = dir * SPEED
	
	if CURRENT_HP <= 0:
		Global.score += 1
		queue_free()
		
	velocity += knockbackVelocity
	knockbackVelocity = lerp(knockbackVelocity, Vector2.ZERO, 0.9 * delta)
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
	
func hit() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hit")
