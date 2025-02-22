extends Sprite2D

@onready var bob = get_parent().get_parent()
@onready var marker = $Marker2D
@onready var cooldown = $cooldown
var can_shoot: bool = true

var bulletScene = preload("res://objects/bullet/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shoot() -> void:
	if can_shoot:
		var instance = bulletScene.instantiate()
		instance.transform = marker.global_transform
		get_tree().root.add_child(instance)
		cooldown.start()
		can_shoot = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dist2Mouse: Vector2 = self.global_position - get_global_mouse_position()
	var angle = atan2(dist2Mouse.y, dist2Mouse.x)
	if bob.flipped:
		rotation = PI - angle
	else:
		rotation = angle

func _on_cooldown_timeout() -> void:
	can_shoot = true
