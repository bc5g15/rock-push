extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_smash(position):
	var myTiles = get_used_cells()
	var pos = world_to_map(position.get_origin())
	var tilePos = check_proximity(pos, myTiles)
	var currentTile = get_cellv(tilePos)
	set_cellv(tilePos, currentTile+4)
	print("TestSmash: ", myTiles)
	
func check_proximity(position, tiles):
	var minTile = null
	var minDist = 99
	for tile in tiles:
		var dist = abs((position.x - tile.x) + (position.y - tile.y))
		if dist < minDist:
			minDist = dist
			minTile = tile
	return minTile
