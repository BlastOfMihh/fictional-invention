extends Body

onready var actions:=get_node("States/Actions")
onready var externals:=get_node("States/External")
onready var states:=get_node("States")
onready var sprite:=get_node("Visuals/AnimatedSprite")

var target=null
export var attack_range=70
