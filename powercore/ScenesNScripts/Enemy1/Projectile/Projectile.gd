extends Area2D

var dir:=Vector2.ZERO
export var speed:=100.0

func _ready():
	look_at(dir)

func _process(delta):
	position+=delta*speed*dir
