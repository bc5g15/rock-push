extends KinematicBody2D

export (int) var speed = 100
export (float) var maxTimer = 0.3
var currentTimer = maxTimer
var pushing = false
var direction = ""
var can_move = 1

onready var collider = $CollisionShape2D
#var velocity = Vector2()

onready var footstep = $Footstep
onready var timer = $FootTimer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_input():
	var velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		direction = 'right'
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		direction = 'left'
		velocity.x -= 1
	if Input.is_action_pressed('ui_up'):
		direction = 'up'
		velocity.y -= 1
	if Input.is_action_pressed('ui_down'):
		direction = 'down'
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	pushing = velocity.length() > 0
	
	# Cheat for ghost mode
	if Global.DEBUG:
		if Input.is_action_just_pressed("ui_accept"):
			# Toggle collider
			collider.disabled = !collider.disabled
	
	return velocity

func _physics_process(delta):
	var velocity = (get_input() * can_move)
	var new_velocity = move_and_slide(velocity)
	# Trigger footsteps
	if new_velocity.length() > 0:
		start_timer()
	else:
		timer.stop()
		
	var cols = get_slide_count()
	animate(velocity, cols)
	if cols > 0 && pushing && new_velocity == Vector2.ZERO:
		currentTimer -= delta
		if currentTimer <= 0:
			var collisionObject = get_slide_collision(0).collider
			if collisionObject.has_method("push"):
				collisionObject.call("push", direction)
			currentTimer = maxTimer
	else:
		currentTimer = maxTimer
	velocity = new_velocity
	
func animate(vel, collisions):
	var currentAnimation = "down"
	if vel.x != 0:
		currentAnimation = "right"
		$AnimatedSprite.flip_h = vel.x < 0
	elif vel.y > 0:
		currentAnimation = "down"
	elif vel.y < 0:
		currentAnimation = "up"
	
	if collisions > 0 && vel.length() > 0:
		currentAnimation = "push-" + currentAnimation
	elif vel.length() > 0:
		currentAnimation = "walk-" + currentAnimation
		
	$AnimatedSprite.animation = currentAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit_by_rock():
	can_move = 0
	rock_animation()
	pass

func rock_animation():
	FadeController.fade_reset()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_timer():
	if timer.is_stopped():
		footstep.play()
		timer.start()

func _on_FootTimer_timeout():
	footstep.play()
	pass # Replace with function body.
