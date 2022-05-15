extends TreeState


func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	if pr.target!=null:
		var toPlr=(pr.target.global_position-pr.global_position).normalized()
		var dist=(pr.target.global_position-pr.global_position).length()
		if dist>=pr.attack_range:
			pr.vel=lerp(pr.vel, toPlr*pr.speed, Globals.lerp_p)
	

