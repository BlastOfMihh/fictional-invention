extends TreeState

func _ready():
	pass

func _enter_state():
	pass
func _exit_state():
	pass
func _get_transition():
	return null

func _during_state(_delta):
	pass

func _on_HurtBox_area_entered(area):
	request_activate("Knocked")
	var knock=state_dic["Knocked"]
	knock.target=area
	knock.off_pos=-area.global_position+pr.global_position
