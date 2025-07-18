extends Sprite2D

@export var enemyScenes: Array[PackedScene] = [
	preload("res://objects/mobs/one/one.tscn"),
	preload("res://objects/mobs/two/two.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var mobType = enemyScenes[Global.rng.randi_range(0, len(enemyScenes) - 1)]
	var instance = mobType.instantiate()
	instance.position = position
	instance.scale = Global.globalScale
	get_tree().root.add_child(instance)
	#$Timer.stop()
	#$Timer.start()
