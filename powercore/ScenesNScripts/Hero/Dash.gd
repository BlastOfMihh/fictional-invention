extends TreeState

onready var timer=$Timer

func _ready():
	pass

func _enter_state():
	timer.start()
	var plus=( pr.get_global_mouse_position()-pr.global_position).normalized()*2700
	pr.vel=lerp(pr.vel, pr.vel+plus, 0.3)
	
func _exit_state():
	pass
func _get_transition():
	if timer.time_left==0:
		return ["_exit", "Float"]
	if Input.is_action_just_pressed("Dash"):
#		return ["_exit", "Attack"]
		return [ "Attack"]
	return null

func _during_state(_delta):
	pass

