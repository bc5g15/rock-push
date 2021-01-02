extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = LevelUnlocker.all_complete()
	pass # Replace with function body.

func _pressed():
	FadeController.fade_to_scene("res://Prefabs/Menu/VictoryScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
