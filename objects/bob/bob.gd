extends CharacterBody2D

const SPEED: float = 500.0

var rng = RandomNumberGenerator.new()

const BLINK_TIME_MIN: float = 2
const BLINK_TIME_MAX: float = 4
var BLINK_TIMER: float = rng.randf_range(BLINK_TIME_MIN, BLINK_TIME_MAX)
var BLINK_TIME: float = 0

var flipped = false  

enum moods {
	neutral,
	worried
}

func _init() -> void:
	pass

func _process(delta: float) -> void:
	
	var dist2Mouse: Vector2 = get_global_mouse_position() - self.position
	
	var angle = atan2(dist2Mouse.y, dist2Mouse.x)
	#$Body/Sprite2D.rotation = angle
	var upAngle: float = 1.4

	if angle > (-upAngle - PI/2) and angle < (upAngle - PI/2):
		$Head.showBack()	
	else:
		$Head.showFront()
		
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		dir.y -= 1
		
	if Input.is_action_pressed("down"):
		dir.y += 1
		
	if Input.is_action_pressed("left"):
		dir.x -= 1
		
	if Input.is_action_pressed("right"):
		dir.x += 1
	
	velocity = dir.normalized() * SPEED
	
	move_and_slide()

	if BLINK_TIME > BLINK_TIMER:
		BLINK_TIME = 0
		BLINK_TIMER = rng.randf_range(BLINK_TIME_MIN, BLINK_TIME_MAX)
		#play blink animation
	
	BLINK_TIME += delta
	
	var mouseX = get_global_mouse_position().x - self.global_position.x

	if mouseX < 0:
		$Head.scale.x = abs($Head.scale.x)
		$Body.scale.x = abs($Body.scale.x)
		flipped = false
	else:
		$Head.scale.x = -abs($Head.scale.x)
		$Body.scale.x = -abs($Body.scale.x)
		flipped = true
