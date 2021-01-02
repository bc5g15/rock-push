extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation = $AnimationPlayer
onready var blip = $BlipSFX
onready var gameMusic = $GameMusic
onready var menuMusic = $MenuMusic

var callback = null
var _path = ""
var reset = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play_menu_music():
	gameMusic.stop()
	menuMusic.play()
	
func play_game_music():
	menuMusic.stop()
	gameMusic.play()

func stop_all_music():
	menuMusic.stop()
	gameMusic.stop()

func fade_to_scene(path):
	animation.play("FadeOut")
	_path = path
	reset = false

func fade_reset():
	animation.play("FadeOut")
	reset = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		if reset:
			Global.reset_current_scene()
		else:
			Global.goto_scene(_path)
		animation.play("FadeIn")

func blip():
	blip.play()
