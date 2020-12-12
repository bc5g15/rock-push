extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var level = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	_check_locked()

func _check_locked():
	if text:
		disabled = LevelUnlocker.isLocked(text)

func _pressed():
	if text:
		FadeController.fade_to_scene("res://Levels/" + text + ".tscn")


func refresh():
	_check_locked()
	pass # Replace with function body.

func disable_focus():
	focus_mode = Control.FOCUS_NONE

func enable_focus():
	focus_mode = Control.FOCUS_ALL
