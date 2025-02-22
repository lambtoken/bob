extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dist2Mouse: Vector2 = self.global_position - get_global_mouse_position()
	var angle = atan2(dist2Mouse.y, dist2Mouse.x)
	rotation = angle
