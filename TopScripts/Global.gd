extends Node

var current_scene = null

var menu = "TITLE"

var DEBUG = true
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func reset_current_scene():
	call_deferred("_deferred_reset")
	
func _deferred_goto_scene(path):
#	current_scene.free()
	get_tree().current_scene.free()
	
	var s = ResourceLoader.load(path)
	
	current_scene = s.instance()
	
	get_tree().get_root().add_child(current_scene)
	
	get_tree().set_current_scene(current_scene)

func _deferred_reset():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	current_scene = get_tree().current_scene

func set_pause(paused):
	get_tree().paused = paused
