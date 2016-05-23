extends Node2D

var current_map
var selector = preload("res://gui/Selector.scn").instance()
var selector_position

# begin processing the game loop
func _ready():
	#set_process(true)
	set_process_input(true)

func _input(event):
	# pause the game and open the pause menu
	if(event.is_action_released("pause") && not global_vars.get_paused()):
		get_tree().set_pause(global_vars.toggle_paused())
		get_node("BattlePauseMenu").show()
		self.get_tree().set_input_as_handled()
	# move the cursor
	if(event.is_action_pressed("ui_up")):
		pass
	if(event.is_action_pressed("ui_down")):
		pass
	if(event.is_action_pressed("ui_left")):
		pass
	if(event.is_action_pressed("ui_right")):
		pass

# process on each frame
func _process(delta):
	pass

func load_map(map_file):
	var current_map_name = map_file
	

# pause menu buttons
func _on_Return_pressed():
	get_tree().set_pause(global_vars.toggle_paused())
	get_node("BattlePauseMenu").hide()

func _on_Settings_pressed():
	pass # replace with function body

func _on_QuitToMainMenu_pressed():
	global_vars.goto_scene("res://MainMenu.scn")

func _on_QuitToDesktop_pressed():
	get_tree().quit()
