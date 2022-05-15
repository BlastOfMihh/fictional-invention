extends TreeState

export var spawn_count:=1
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
		var real_monster=monster.get_child(0)
		real_monster.target=Globals.player
		real_monster.global_position=pr.position #+Vector2(rand_range(-3,3),rand_range(-3,3))
		monster.remove_child(real_monster)
		monster.queue_free()
		
		var timer = Timer.new()
		timer.wait_time=0.5
		add_child(timer)
		timer.start()
		timer.one_shot=true
		yield(timer,"timeout")
		timer.queue_free()
		pr.get_parent().add_child(real_monster)
	
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	pass

