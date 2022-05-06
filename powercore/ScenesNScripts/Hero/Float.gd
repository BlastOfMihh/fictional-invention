extends TreeState

var dir=Vector2.ZERO

func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	if dir==Vector2.ZERO:
		return ["_exit", "Idle"]
	if Input.is_action_just_pressed("Attack"):
		return ["_exit", "Attack"]
	if Input.is_action_just_pressed("Dash"):
		return ["_exit", "Dash"]
		# return ["Attack"]
	return null

func _during_state(_delta):
#	Input.get_action_strength()
	dir.x=Input.get_action_strength("Right")-Input.get_action_strength("Left")
	dir.y=-Input.get_action_strength("Up")+Input.get_action_strength("Down")
	# if dir.x!=0:
	# 	pr.vel.x=lerp(pr.vel.x, dir.x*pr.speed, 0.5)
	# if dir.y!=0:
	# 	pr.vel.y=lerp(pr.vel.y, dir.y*pr.speed, 0.5)
	if abs(dir.x*pr.speed)>abs(pr.vel.x):
		pr.vel.x=lerp(pr.vel.x, dir.x*pr.speed, 0.5)
	if abs(dir.y*pr.speed)>abs(pr.vel.y):
		pr.vel.y=lerp(pr.vel.y, dir.y*pr.speed, 0.5)
	# pr.vel=lerp(pr.vel, dir*pr.speed, 0.5)
