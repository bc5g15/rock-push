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

var completeLevels = {
	"1-1": false,
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
	
func isComplete(level):
	return completeLevels[level]
	
func unlock(level):
	levels[level] = true

func complete(level):
	completeLevels[level] = true

func unlock_all():
	for level in levels:
		levels[level] = true

func all_complete():
	for level in completeLevels:
		if completeLevels[level] == false:
			return false
	return true
