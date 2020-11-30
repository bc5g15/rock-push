extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var menuBox = $MenuBox
onready var menuButton = $HBoxContainer/MenuButton

func _on_MenuButton_toggled(button_pressed):
	menuBox.visible = button_pressed
	Global.set_pause(button_pressed)

func _on_CloseButton_pressed():
	menuButton.pressed = false
	menuBox.visible = false	
	Global.set_pause(false)

func _on_ResetButton_pressed():
	Global.set_pause(false)
	FadeController.fade_reset()

func _on_HomeButton_pressed():
	Global.set_pause(false)
	FadeController.fade_to_scene('res://Debug.tscn')
