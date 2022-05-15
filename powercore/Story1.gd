extends ColorRect

onready var selector_one = $Label
onready var selector_two = $Label
onready var selector_three = $Label

export var first_scene = preload("res://test2D.tscn")
export(int)var speed: int = 71
var direction =Vector2(0,1)
onready var paralax=$ParallaxBackground



var current_selection =0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_right") and current_selection<2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_left") and current_selection>0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		get_parent().add_child(first_scene.instance())
		queue_free()
	paralax.scroll_offset += direction * speed * delta
	
	
func set_current_selection(current_selection):
	if(current_selection==0):
		$Label.text="	Having always done the right thing, you realized it was time to retire from inter-galactic fighting and making friends along the way to focus on what matters the most, a stable job and climbing the corporate ladder of course."
	elif(current_selection==1):
		$Label.text="	Having spent hours on the website Intergalactical-In because, apparently, it's hard to find accountant job when you skip high-school to save the day, you finally have a job offer."
	elif(current_selection==2):
		$Label.text="	From a certain Mr. Maze, the CEO of WellDoing Inc. This is great! After reading the motto  WE DON'T ONLY CARE ABOUT MONEY (THIS IS JUST THE COMPANY'S MOTTO AND YOU ARE NOT ALLOWED TO SUE US IF YOU FIND THIS PIECE OF INFORMATION MISLEADING). This corporation seems to be just the thing you were looking for, considering your previous professional background and your good hearted-nature."
		

#	
#func set_current_selection(current_selection):
#	
#		selector_one.text ='-'
#	elif( current_selection == 1 ):
#		selector_two.text ='-'
#	elif( current_selection == 2 ):
#		selector_three.text ='-'
#
