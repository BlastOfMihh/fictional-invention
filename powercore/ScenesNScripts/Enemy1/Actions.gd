extends TreeState

var vel:=Vector2.ZERO

func _ready():
	pass

func _enter_state():
	request_activate("Idle")
	pass

func _exit_state():
	for st in state_dic.keys():
		request_deactivate(st)
	pass

func _get_transition():
	# if
	return null

func _during_state(_delta):
	
	pr.vel=lerp(pr.vel, Vector2.ZERO, Globals.lerp_p)

	pass

