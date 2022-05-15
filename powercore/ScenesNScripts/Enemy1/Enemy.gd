extends Body

onready var actions:=get_node("States/Actions")
onready var externals:=get_node("States/External")
onready var states:=get_node("States")
onready var sprite:=get_node("Visuals/AnimatedSprite")
onready var visuals:=$Visuals

var health:=100
var target=null
export var attack_range=160
export var attack_speed:float=1
