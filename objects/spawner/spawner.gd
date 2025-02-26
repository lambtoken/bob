extends Sprite2D

var oneScene = preload("res://objects/one/one.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var instance = oneScene.instantiate()
	instance.position = position
	instance.scale = Global.globalScale
	get_tree().root.add_child(instance)
	#$Timer.stop()
	#$Timer.start()
