extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var edge1 = $Edge1
onready var edge2 = $Edge2
onready var center = $Center

var expectedExit = null
var tripped = false

var maxCooldown = 0.2
var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown > 0:
		cooldown -= delta
		if cooldown <= 0:
			tripped = false


func switchOn(vector):
	expectedExit = vector
	tripped = true
	cooldown = maxCooldown

func _on_Edge1_area_entered(_area):
	switchOn(to_global(edge2.transform.origin) - to_global(center.transform.origin))

func _on_Edge2_area_entered(_area):
	switchOn(to_global(edge1.transform.origin) - to_global(center.transform.origin))

func _on_Center_area_entered(area):
	if tripped && area.has_method('on_turn'):
		area.call('on_turn', expectedExit)
	pass # Replace with function body.
