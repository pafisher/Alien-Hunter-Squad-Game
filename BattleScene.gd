extends Node2D

# begin processing the game loop
func _ready():
	set_process(true)

# process on each frame
func _process(delta):
	if (Input.is_action_pressed("toggle_pause")):
		get_tree().set_pause(global_vars.toggle_pause())
		if (global_vars.paused == true):
			get_node("BattlePauseMenu").show()

func _on_Return_pressed():
	get_tree().set_pause(global_vars.toggle_pause())
	get_node("BattlePauseMenu").hide()

func _on_Settings_pressed():
	pass # replace with function body

func _on_QuitToMainMenu_pressed():
	global_vars.goto_scene("res://MainMenu.scn")

func _on_QuitToDesktop_pressed():
	get_tree().quit()
