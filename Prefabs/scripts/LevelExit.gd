extends Area2D

export(String) var path = ""

onready var fadeAnimator = $FadeAnimator

func _ready():
	fadeAnimator.play("FadeIn")

func _on_LevelExit_body_entered(_body):
	fadeAnimator.play("FadeOut")

func _on_FadeAnimator_animation_finished(anim_name):
	if anim_name == "FadeOut":
		if path != "":
			print("Enter Level: " + path)
			Global.goto_scene("res://" + path + ".tscn")
