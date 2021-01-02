extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var music = $VictoryMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	FadeController.stop_all_music()
	music.play()
	print("Play?")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
