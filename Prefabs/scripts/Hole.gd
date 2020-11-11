extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _fill_hole():
	$AnimatedSprite.play("full")
	$HoleFill.queue_free()
	$PlayerBlock.queue_free()


func _on_HoleFill_area_entered(area):
	_fill_hole()
	if area.has_method("on_hole"):
		area.call("on_hole")
