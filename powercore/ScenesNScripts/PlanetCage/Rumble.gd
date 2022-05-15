extends TreeState

onready var planet_states=pr.get_node("PlanetBody/States/")

func _ready():
	pass

var dead:=false

func _on_dead():
	dead=true

func _enter_state():
	pr.cage.set_collision_layer( 1)
	planet_states.request_activate("Spawn")
	pass
func _exit_state():
	pass
func _get_transition():
	if dead:
		return ["_exit", "Done"]
	return null

func _during_state(_delta):
	pass

