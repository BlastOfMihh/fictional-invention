extends TreeState


func _ready():
	pass

func _enter_state():
	if pr.ap!=null:
		pr.ap.play("Idle")
	pass
func _exit_state():
	pass
func _get_transition():
	if Input.is_action_just_pressed("Attack"):
		return ["_exit", "Attack"]
	if pr.move_actions():
		return ["_exit", "Float"]
	if Input.is_action_just_pressed("Dash"):
		return ["_exit", "Dash"]
	return null

func _during_state(_delta):
	pass
