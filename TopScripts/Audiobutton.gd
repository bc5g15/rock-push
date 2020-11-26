extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var aOn = $AudioOn
onready var aOff = $AudioOff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AudioButton_toggled(button_pressed):
	aOn.visible = !button_pressed
	aOff.visible = button_pressed
	AudioServer.set_bus_mute(0, button_pressed)
	pass # Replace with function body.
