extends Resource
export(bool) var selected
export(Vector2) var obj_size
export(Vector2) var obj_gridpos
export(Vector2) var obj_pos

func _init(p_selected = false, p_obj_size = Vector2(0,0), p_obj_gridpos = Vector2(-1,-1), p_obj_pos = Vector2(-1,-1)):
		p_selected = selected
		p_obj_size = obj_size
		p_obj_gridpos = obj_gridpos
		p_obj_pos = obj_pos
