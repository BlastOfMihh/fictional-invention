extends TreeState


func _ready():
	pass

func _enter_state():
	pr.cage.queue_free()
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	pass

