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
	pass



func _on_Area2D_body_entered(body: Node) -> void:
	_get_transition()	
