extends Button

#onready var buttons = [$]
# Called when the node enters the scene tree for the first time.
func _ready():
	if LevelUnlocker.all_unlocked():
		visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	text = "Unlocked!"
	icon = load("res://Assets/UI/baseline_lock_open_white_48dp.png")
	FadeController.blip()
	LevelUnlocker.unlock_all()
	get_tree().call_group("LevelButtons", "refresh")
