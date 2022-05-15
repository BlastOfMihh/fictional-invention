extends MarginContainer

# 1-start
# 2-how to
# 3-exit


export(int)var speed: int = 71
var direction =Vector2(0,1)
onready var paralax=$ParallaxBackground


export var first_scene = preload("res://ScenesNScripts/CharacterTest/Character.tscn")
export var second_scene = preload("res://ScenesNScripts/CharacterTest/Character.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/VBoxContainer/Start/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/VBoxContainer/HowTo/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/VBoxContainer/Exit/HBoxContainer/Selector

var current_selection =-1

func _ready():
	set_current_selection(-1)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection<2:
#		print("dadadadad")
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection>0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
	paralax.scroll_offset += direction * speed * delta
	
	
func handle_selection(current_selection):
	if(current_selection==0):
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif(current_selection==1):
		get_parent().add_child(second_scene.instance())
		queue_free()
	elif(current_selection==2):
		get_tree().quit()
			
			
	
	
func set_current_selection(current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if( current_selection == 0 ):
		selector_one.text ='-'
	elif( current_selection == 1 ):
		selector_two.text ='-'
	elif( current_selection == 2 ):
		selector_three.text ='-'
