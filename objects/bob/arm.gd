extends Sprite2D

@onready var bob = get_parent().get_parent()
@onready var marker = $Marker2D
var bulletScene = preload("res://objects/bullet/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shoot() -> void:
	var instance = bulletScene.instantiate()
	instance.transform = marker.global_transform

	get_tree().root.add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dist2Mouse: Vector2 = self.global_position - get_global_mouse_position()
	var angle = atan2(dist2Mouse.y, dist2Mouse.x)
	if bob.flipped:
		rotation = PI - angle
	else:
		rotation = angle
	
	
