extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var heightShift = 312

onready var animation = $AnimationPlayer
# Title
onready var startButton = $TitleScreen/ScrollLeftBtn
onready var toCredits = $TitleScreen/CreditsBtn

onready var level1 = $LevelSelect/LevelSelect/VBoxContainer/GridContainer/Button
onready var creditsButton = $Credits/FromCredits

onready var fromLevels = $LevelSelect/ScrollRightBtn
onready var unlock = $LevelSelect/LevelSelect/LevelUnlock

# Called when the node enters the scene tree for the first time.
func _ready():
	# Change what we switch to
	if Global.menu == "TITLE":
		disable_credits_focus()
		disable_level_focus()
		enable_title_focus()
		startButton.grab_focus()
	if Global.menu == "LEVEL":
		disable_credits_focus()
		disable_title_focus()
		enable_title_focus()
		level1.grab_focus()
		animation.play("ScrollRight", -1, 0)

func disable_title_focus():
	startButton.focus_mode = Control.FOCUS_NONE
	toCredits.focus_mode = Control.FOCUS_NONE
	
func enable_title_focus():
	startButton.focus_mode = Control.FOCUS_ALL
	toCredits.focus_mode = Control.FOCUS_ALL

func enable_credits_focus():
	creditsButton.focus_mode = Control.FOCUS_ALL

func disable_credits_focus():
	creditsButton.focus_mode = Control.FOCUS_NONE
	
func disable_level_focus():
	get_tree().call_group("LevelButtons", "disable_focus")
	fromLevels.focus_mode = Control.FOCUS_NONE
	unlock.focus_mode = Control.FOCUS_NONE
	
func enable_level_focus():
	get_tree().call_group("LevelButtons", "enable_focus")
	fromLevels.focus_mode = Control.FOCUS_ALL
	unlock.focus_mode = Control.FOCUS_ALL
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ScrollUpBtn_pressed():
	animation.play("ScrollLeft")
	disable_title_focus()
	enable_level_focus()
	level1.focus_mode = Control.FOCUS_ALL
	level1.grab_focus()
	pass # Replace with function body.

func _on_ScrollDownBtn_pressed():
	animation.play("ScrollRight")
	disable_level_focus()
	enable_title_focus()
	startButton.grab_focus()
	pass # Replace with function body.

func _on_FromCredits_pressed():
	animation.play("ScrollDown")
	disable_credits_focus()
	enable_title_focus()
	startButton.grab_focus()
	pass # Replace with function body.


func _on_CreditsBtn_pressed():
	animation.play("ScrollUp")
	disable_title_focus()
	enable_credits_focus()
	creditsButton.grab_focus()
	pass # Replace with function body.
