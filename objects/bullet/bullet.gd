extends Area2D

var speed: float = 700.0

func _init() -> void:
	add_to_group("bullet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position += transform.x * speed * delta

	# speed decreases gradually
	speed = lerp(speed, 0.0, 2 * delta)

# Called when the Timer times out
func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	var target = area.get_parent()
	if target.is_in_group("enemies"):
		var enemy = area.get_parent()
		enemy.stats.CURRENT_HP -= 5
		enemy.hit()
		
		var dir = (enemy.position - Global.player.position).normalized()
		enemy.knockbackVelocity += dir * 500


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		return
		
	queue_free()
