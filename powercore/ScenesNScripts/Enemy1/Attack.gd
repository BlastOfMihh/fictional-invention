extends TreeState

var projectile_tscn=preload("res://ScenesNScripts/Enemy1/Projectile/Projectile.tscn")

func _ready():
	yield(get_tree(),"idle_frame")

var finished:=false

func done():
	finished=true


func _enter_state():
	pr.sprite.play("Attack")
	var projectile=projectile_tscn.instance()
	projectile.dir=(pr.target.global_position-pr.global_position).normalized()
	pr.get_parent().add_child(projectile)
	projectile.global_position=pr.global_position
#	yield(timer, "timeout")

func _exit_state():
	pass

func _get_transition():
	if finished==true:
		finished=false
		return ["_exit","Idle"]
	return null

func _during_state(_delta):
	pass



func _on_AnimatedSprite_animation_finished():
	finished=true
	pass # Replace with function body.
