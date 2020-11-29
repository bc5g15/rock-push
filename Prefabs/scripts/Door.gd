extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(bool) var isOpen = false

onready var doorCenter = $DoorCenter
onready var frontSmash = $FrontSmash
onready var backSmash = $BackSmash
onready var doorBase = $DoorBase

onready var smallSmash = $SmallSmash
onready var bigSmash = $BigSmash

onready var smallSFX = $SmallSmashSFX
onready var bigSFX = $BigSmashSFX

# Called when the node enters the scene tree for the first time.
func _ready():
	if isOpen:
		open_door()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_door():
	print("Opening")
	doorCenter.queue_free()
#	doorCenter.set_collision_layer_bit(0, false)
#	doorCenter.set_collision_mask_bit(1, false)
#	animation = "open"
	doorBase.animation = "open"
	frontSmash.set_collision_mask_bit(1, false)
	backSmash.set_collision_mask_bit(1, false)

func _on_FrontSmash_body_entered(_body):
	open_door()
	smallSmash.emitting = true
	smallSFX.play()
	pass # Replace with function body.


func _on_BackSmash_body_entered(_body):
	open_door()
	bigSmash.emitting = true
	bigSFX.play()
	pass # Replace with function body.
