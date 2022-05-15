extends TreeState

var dist:float=0

func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	if dist<=pr.attack_range:
		return ["_exit", "Attack"]
	return null

func _during_state(_delta):
	if pr.target!=null:
		dist=(pr.target.global_position-pr.global_position).length()
		var toPlr=(pr.target.global_position-pr.global_position).normalized()
		if dist>=pr.attack_range:
			pr.vel=lerp(pr.vel, toPlr*pr.speed, Globals.lerp_p)


