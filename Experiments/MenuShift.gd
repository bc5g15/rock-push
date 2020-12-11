extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var heightShift = 312

onready var animation = $AnimationPlayer
onready var startButton = $TitleScreen/ScrollUpBtn
onready var level1 = $LevelSelect/LevelSelect/VBoxContainer/GridContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	print("Hello")


func _on_ScrollUpBtn_pressed():
	animation.play("ScrollUp")
	startButton.disabled = true
	level1.grab_focus()
	
	pass # Replace with function body.


func _on_ScrollDownBtn_pressed():
	animation.play("ScrollDown")
	startButton.disabled = false
	startButton.grab_focus()
	pass # Replace with function body.
