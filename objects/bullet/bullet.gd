extends Area2D

var speed: float = 700.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position += transform.x * speed * delta

	# speed decreases gradually
	speed = lerp(speed, 0.0, 2 * delta)

# Called when the Timer times out
func _on_timer_timeout() -> void:
	queue_free()
