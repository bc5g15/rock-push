extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var menuBox = $MenuBox
onready var menuButton = $HBoxContainer/MenuButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuButton_toggled(button_pressed):
	menuBox.visible = button_pressed
	pass # Replace with function body.


func _on_CloseMenuButton_pressed():
	menuButton.pressed = false
	menuBox.visible = false
	pass # Replace with function body.

func _on_CloseButton_pressed():
	pass # Replace with function body.


func _on_ResetButton_pressed():
	Global.reset_current_scene()
	pass # Replace with function body.


func _on_HomeButton_pressed():
	Global.goto_scene('res://Debug.tscn')	
	pass # Replace with function body.
