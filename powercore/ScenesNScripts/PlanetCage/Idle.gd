extends TreeState

var rumble:bool=false

func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	if rumble:
		rumble=false
		return ["_exit", "Rumble"]
	return null

func _during_state(_delta):
	pass



func _on_ActivationArea_body_entered(_body):
	rumble=true
