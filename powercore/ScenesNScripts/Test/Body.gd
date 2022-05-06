extends KinematicBody2D

var vel:=Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		vel=lerp(vel, vel+Vector2(230,1000), 0.2)
	vel=move_and_slide(vel, Vector2.UP)
	vel=lerp(vel, Vector2(0,0), 0.1)
		
