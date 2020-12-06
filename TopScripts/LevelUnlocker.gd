extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# All but the first level locked by default
var levels = {
	"1-1": true,
	"1-2": false,
	"1-3": false,
	"2-1": false,
	"2-2": false,
	"2-3": false,
	"3-1": false,
	"3-2": false,
	"3-3": false,
	"4-1": false
}

func isLocked(level):
	return !levels[level]
	
func unlock(level):
	levels[level] = true

func unlock_all():
	for level in levels:
		print(level)
		levels[level] = true
