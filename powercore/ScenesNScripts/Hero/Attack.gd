extends TreeState

onready var timer=$Timer
# var streak:=0

func _ready():
	pass

func _enter_state():
	
	pr.ap.play("LightAttack")
	pr.hit_shape.disabled=false
	timer.start()
	var plus=( pr.get_global_mouse_position()-pr.global_position).normalized()*300

	pr.vel=lerp(pr.vel, pr.vel+plus, 0.6)
	
func _exit_state():
	pr.hit_shape.disabled=true

func _get_transition():
	if timer.time_left==0:
		return ["_exit", "Idle"]
	return null

func _during_state(_delta):
	pass

# func _on_Timer_timeout():
# 	get_parent().request_deactivate(name)

