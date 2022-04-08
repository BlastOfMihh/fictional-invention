extends Node
class_name TreeState

#S
export var active:bool=false
#SM
var state_dic={}

func _ready():
	for ch in get_children():
		state_dic[ch.name]=ch
# S functions

func activate():
	active=true

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	pass

func _during_state(_delta):
	pass

func _physics_process(delta):
	if active:
		#S
		_during_state(delta);
		#SM
		for x in state_dic.values():
			var trans=x._get_transition();
			if trans!=null:
				for y in trans:
					if y=="_exit":
						request_deactivate(x)
					else:
						request_activate(y)


# SM functions
func request_activate(st:String):
	state_dic[st].activate()

func request_deactivate(st:String):
	var state=state_dic[st]
	state.activate()
	state._enter_state()
