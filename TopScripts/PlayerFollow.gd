extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var viewport: Viewport
onready var camera = $Player/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.make_current()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var player_pos = $Player.transform
	
#	viewport.set_canvas_transform(player_pos)
	
#	pass
