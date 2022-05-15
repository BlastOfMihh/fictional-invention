extends TreeState

var timer:Timer

func _ready():
	pass

var finished:=false

func done():
	finished=true

func _enter_state():
	pr.sprite.play("Attack")
	timer=Timer.new()
	timer.wait_time=pr.attack_speed
	timer.one_shot=true
	add_child(timer)
	timer.start()
	timer.connect("timeout", self, "done")
#	yield(timer, "timeout")
	
	pass
func _exit_state():
	timer.queue_free()
	pass
func _get_transition():
	if finished==true:
		finished=false
		return ["_exit","Idle"]
	return null

func _during_state(_delta):
	pass

