extends Area2D

export(String) var path = ""

func _on_LevelExit_body_entered(_body):
	FadeController.fade_to_scene("res://" + path + ".tscn")
