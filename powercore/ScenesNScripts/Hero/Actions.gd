extends TreeState


func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	return null

var smooth_camera_pos:Vector2

func look_at_cam()->void:
	if 0:
		var d=(pr.get_global_mouse_position()-pr.global_position).normalized()
		var ang:float
		if d.x!=0:
			ang=atan(d.y/d.x)
			pr.visuals.rotation=lerp_angle(pr.visuals.rotation, ang, 0.1) 
		if pr.get_global_mouse_position().x-pr.global_position.x>0:
			pr.visuals.scale.x=1
		else :
			pr.visuals.scale.x=-1
	else :
	#	if abs(ang)<=PI/2: 
	#		pass
	#	else :
	#		ang=acos(d.x/d.y)
	#	pr.visuals.rotation=ang
	#	print((asin(d.y/d.x)))
	#	return 
		smooth_camera_pos=lerp(smooth_camera_pos, pr.get_global_mouse_position(), 0.1)
		pr.visuals.look_at(smooth_camera_pos)
		if pr.get_global_mouse_position().x-pr.global_position.x>0:
			pr.visuals.scale.y=1
		else : pr.visuals.scale . y=-1

func _during_state(_delta):
#	func _physics_process(delta):
	# pr.vel=pr.move_and_slide(pr.vel)
	pr.vel=lerp(pr.vel, Vector2.ZERO, 0.0281)
	pr.rotate_hitbox()
	look_at_cam()

