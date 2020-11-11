extends Area2D

signal fall_in_hole
signal hit_by_rock
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_hole():
	emit_signal("fall_in_hole")

func on_rock(velocity):
	emit_signal("hit_by_rock", velocity)
