extends KinematicBody2D
class_name Body


var vel:=Vector2.ZERO
export var speed:=200.4


func _physics_process(delta):
	vel=move_and_slide(vel,Vector2.UP)
