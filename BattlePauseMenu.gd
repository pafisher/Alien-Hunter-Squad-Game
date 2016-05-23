
extends PopupPanel

func _ready():
	set_process_input(true)

func _input(event):
	if(event.is_action_released("pause") && global_vars.get_paused()):
		get_tree().set_pause(global_vars.toggle_paused())
		self.hide()
		self.get_tree().set_input_as_handled()