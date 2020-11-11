extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var is_open = false
var currentlyOpen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_open:
		_open_doors(null)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open(source):
	var tiles = source.get_used_cells()
	for tile in tiles:
		var i = source.get_cellv(tile)
		source.set_cellv(tile, i+2)
		

func _on_DoorBase_smashed():
#	open($DoorBase)
	#open($DoorCeiling)
	pass # Replace with function body.

func _open_doors(_area):
	if !currentlyOpen:
		currentlyOpen = true
		open($DoorBase)		
		$UpDoorSmash.queue_free()
		$DownDoorSmash.queue_free()
