extends TreeState

var finished:=false
func _ready():
	pass

func _enter_state():
	pass
#	pr.sprite.play("Death")
func _exit_state():
	pr.queue_free()
	pass
func _get_transition():
	if finished:
		var ap=pr.sprite.duplicate()
		ap.play("Death")
		pr.get_parent().add_child(ap)
		ap.global_position=pr.global_position
#		pr.add_child()
		pr.queue_free()
	return null

func _during_state(_delta):
	pass



func _on_AnimatedSprite_animation_finished():
	finished=true;
	pass # Replace with function body.
