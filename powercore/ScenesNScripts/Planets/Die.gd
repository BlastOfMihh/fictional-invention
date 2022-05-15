extends TreeState

signal dead

func _ready():
	pass

func _enter_state():
	connect("dead", pr.get_node("../States/Rumble"), "_on_dead" )
	emit_signal("dead")
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	pass

