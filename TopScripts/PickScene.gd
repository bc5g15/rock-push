extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var path = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _pressed():
	if path != "":
		print("Enter Level: " + path)
		Global.goto_scene("res://Levels/" + path + ".tscn")
	pass # Replace with function body.

