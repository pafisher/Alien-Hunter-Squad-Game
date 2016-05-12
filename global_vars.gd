extends Node
# **************************************************
# SCENE CHANGE
# **************************************************

# scene data for changing scenes without losing data
var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	# defers the call to avoid changing scenes while scene is still running
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	# free the current scene,
	current_scene.free()

	# load new scene
	var s = ResourceLoader.load(path)

	# instance the new scene
	current_scene = s.instance()

	# add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)

	# make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene(current_scene)

# **************************************************
# SETTINGS VARIABLES
# **************************************************

var paused = false

func toggle_pause():
	paused = not paused
	return paused