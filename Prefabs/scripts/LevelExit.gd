extends Area2D

export(String) var path = ""
export(String) var current = ""

onready var victorySFX = $VictoryBlip

func _on_LevelExit_body_entered(_body):
	victorySFX.play()
	if "Levels/" in current:
		var l1 = current.right(7)
		LevelUnlocker.complete(l1)
	if "Levels/" in path:
		var l2 = path.right(7)
		LevelUnlocker.unlock(l2)
	FadeController.fade_to_scene("res://" + path + ".tscn")
