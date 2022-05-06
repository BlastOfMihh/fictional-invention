extends Node
class_name TreeState

#S
export var active:bool=false
onready var pr:=get_parent()
#SM
var root:=false
var state_dic={}


func _ready():
	while is_state(pr)==true:
		pr=pr.get_parent()
	# print(pr.name)
	#SM
	for ch in get_children():
		if is_state(ch):
			state_dic[ch.name]=ch
	#ENDSM
	#S
	if active:
		_enter_state()


# S functions
func _deactivate():
	active=false
func _activate():
	active=true

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	# print(pr)
	# for x in state_dic.values():
	# 	if x.active:
	# 		print(x)
	# 		print(x.root)
	pass

func _physics_process(delta):
	if root: print(name)
	if active:
		#S
#		_during_state(delta);
		#SM
		for x in state_dic.values():
			if x.active:
				if x.active: x._during_state(delta)
				var trans=x._get_transition();
				if trans!=null:
					for y in trans:
						if y=="_exit":
							request_deactivate(x.name)
						else:
							request_activate(y)
#				print(x.name)

# SM functions
func is_state(x)->bool:
	return x.has_method("is_state")

func request_activate(st:String)->void:
	var state=state_dic[st]
	state._activate()
	state._enter_state()

func request_deactivate(st:String)->void:
	var state=state_dic[st]
	state._deactivate()
	state._exit_state()

func is_active(st:String)->bool:
	return state_dic[st].active==true



# func clearDfs( x ):
# 	for y in x.get_children()
# 	pass

# func clear():
# 	for y in get_children():
