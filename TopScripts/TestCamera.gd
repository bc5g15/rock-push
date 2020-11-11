extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var right = true
var myViewport: Viewport
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Camera2D.make_current()
	myViewport = get_viewport()
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func shift_screen(x, y):
	myViewport.set_canvas_transform(
		myViewport.get_canvas_transform().translated(Vector2(x,y)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = $Player.transform.get_origin()
	if player_pos.x < 0 and right:
		right = false
		var width = screen_size.x
		shift_screen(width, 0)
	elif player_pos.x > 0 and not right:
		right = true
		shift_screen(-screen_size.x, 0)
	pass
