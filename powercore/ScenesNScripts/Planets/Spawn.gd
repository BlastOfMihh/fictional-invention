extends TreeState

export var spawn_count:=4
export var monster_tscn=preload("res://ScenesNScripts/Enemy1/Enemy1.tscn")

func _ready():
	pass

func add_timer(wait):
	var timer = Timer.new()
	timer.wait_time=wait
	add_child(timer)
	timer.start()
	timer.one_shot=true
	return timer

func _enter_state():
	for i in range(0, spawn_count):
		var monster=monster_tscn.instance()
		monster.global_position=pr.position
		pr.get_parent().add_child(monster)
	
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	pass

