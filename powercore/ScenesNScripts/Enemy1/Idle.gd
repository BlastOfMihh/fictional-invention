extends TreeState


func _ready():
	pass

func _enter_state():
	yield(get_tree(), "idle_frame")
#	if pr.sprite!=null : 
	pr.sprite.play("Idle")

func _exit_state():
	pass
func _get_transition():
#	return ["_exit", "Chase"]
	return null

func _during_state(_delta):
	pass

