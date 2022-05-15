extends Node2D

var dimensions:Vector2
onready var cage:=$Cage
onready var activation_area:=$StaticBody/ActivationArea

func _ready():
	dimensions=cage.scale

