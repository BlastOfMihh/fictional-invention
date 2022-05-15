extends Body

onready var ap=$Visuals/AnimatedSprite
onready var hit_box=$HitBoxContainer/HitBox
onready var hit_shape=$HitBoxContainer/HitBox/CollisionShape2D
onready var hit_box_container=$HitBoxContainer
onready var visuals=$Visuals

func _ready():
	Globals.player=self

var move_action_strs=["Left", "Up", "Down", "Right"]

func move_actions()->bool:
	for s in move_action_strs:
		if Input.is_action_pressed(s):
			return true
	return false
	# return Input.is_action_pressed("Left") or Input.is_action_pressed("Up") or Input.is_action_pressed("Down") or Input.is_action_just_pressed("Right")

func rotate_hitbox():
	hit_box_container.look_at(get_global_mouse_position())
#	var dist=get_global_mouse_position()-self.global_position
##	hit_box_container.rotation=acos(max(dist.x,0.00000001)/dist.y)
#	if dist.x!=0: 
#		hit_box_container.rotation=asin(dist.y/dist.x)
