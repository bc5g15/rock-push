extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()

var directions = {
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func push(fromDir):
	print("Pushed!:", fromDir)
	velocity = directions[fromDir]
	velocity = velocity * speed
	
# Called when one rock collides with this one
func rockPush(newVel):
	velocity = newVel

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision && velocity.length() > 0:
		if collision.collider.has_method("rockPush"):
			print("Hit a Rock!")
			collision.collider.call("rockPush", velocity)
		velocity = Vector2.ZERO
#		reposition()
			

func on_hole(_area):
	self.queue_free()


func _on_DoorCollide_fall_in_hole():
	self.queue_free()
	pass # Replace with function body.

#func grid_snap(pos):
#	var bySixteen = pos % 8
#	var smaller = bySixteen < 4
#	var larger = bySixteen >= 4
#	var value = (pos / 16) * 16
#	return (smaller * (value - 16)) + (larger * value)
#
#func reposition():
#	var current = transform.get_origin()
#	current.x = grid_snap(current.x)
#	current.y = grid_snap(current.y)
#	transform.origin = current

