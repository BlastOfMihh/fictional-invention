extends TreeState

onready var timer=$Timer
var target=null
var off_pos:=Vector2.ZERO

func _ready():
	pass

func _enter_state():
	pr.health-=rand_range(30,45)
#	print("knocked")
	pr.states.request_deactivate("Actions")
	pr.sprite.play("Knocked")
#	timer.time_left=int(timer.wait_time)
#	tim
	timer.start()

func _exit_state():
	pr.states.request_activate("Actions")
	pass

func _get_transition():
	if pr.health<=0:
		return ["Die"]
	elif timer.time_left==0:
		return ["_exit"]
	return null

func _during_state(_delta):
	# print(target.name)
	if off_pos.length()<20:
		off_pos*=1.2 #it's a hack but it works
	var dist=target.global_position-pr.global_position + off_pos
	var dir=(dist).normalized()
	pr.vel=dist*100
	# if Vector2.ZERO.distance_to(dist)>=30:
	# 	pr.vel=dir*900
	# else :
	# 	pr.vel=Vector2.ZERO
		# pr.vel=dir*700
		# lerp(pr.vel, dir*500, 0.8)


func _on_Timer_timeout():
	# print("ishfh")
	pass
