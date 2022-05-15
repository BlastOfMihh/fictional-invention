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
var smooth_camera_pos:=Vector2.ZERO
func look_at_plr():
	smooth_camera_pos=lerp(smooth_camera_pos, pr.target.global_position, 0.2)
	pr.visuals.look_at(smooth_camera_pos)
	if pr.target.global_position.x-pr.global_position.x>0:
		pr.visuals.scale.y=1
	else : pr.visuals.scale.y=-1


func _during_state(_delta):
	look_at_plr()
	pr.vel=lerp(pr.vel, Vector2.ZERO, Globals.lerp_p)

	pass

