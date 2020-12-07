extends Area2D

export(String) var path = ""

func _on_LevelExit_body_entered(_body):
	if "Levels/" in path:
		var level = path.right(7)
		LevelUnlocker.unlock(level)
	FadeController.fade_to_scene("res://" + path + ".tscn")
