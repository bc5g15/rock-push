extends Area2D

export(String) var path = ""

func _on_LevelExit_body_entered(_body):
#	print("Exit Level")
	if path != "":
		print("Enter Level: " + path)
		Global.goto_scene("res://" + path + ".tscn")
	pass # Replace with function body.
