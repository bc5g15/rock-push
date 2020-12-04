extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var heightShift = 312

onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	print("Hello")


func _on_ScrollUpBtn_pressed():
	animation.play("ScrollUp")
	pass # Replace with function body.


func _on_ScrollDownBtn_pressed():
	animation.play("ScrollDown")
	pass # Replace with function body.
