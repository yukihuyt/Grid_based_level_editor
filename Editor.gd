extends Node2D

export(Vector2) var cell_size
export(Vector2) var map_size

onready var selector = $"/root/Main/Control"
onready var room = get_node("/root/Main/Room")
onready var cursor_sprite = get_node("Sprite")
onready var poped_message = get_node("PopupDialog")
onready var poped_timer = get_node("PopupDialog/Timer")

onready var SELECT_MODE = false
onready var DELETE_MODE = false

const half_vec = Vector2(0.5, 0.5)
const unit_vec = Vector2(1, 1)
const double_vec = Vector2(2, 2)

enum {EMPTY, OBJECT, WALL}

var current_item
var can_place
var object_size

var half_tile_size = cell_size / 2

#the data list to store grid map information
var grid = []
#the dict to store the placed object information
var obj_dict = {}

onready var tile_size = cell_size
onready var grid_size = map_size
var trashbin = load('res://Images/trashbin.png')


#################### ready ######################
func _ready():
	#initilize the scene
	cursor_sprite.centered = false
	poped_message.visible = false
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append([EMPTY, null])
#################################################

#transfer grid cell coordinates to world map position
func cell_to_pos(grid_pos, tile_size):
	return grid_pos*tile_size.x
#the reverse of above
func pos_to_cell(pos, tile_size):
	return Vector2(float(int(pos.x)/int(tile_size.x)), float(int(pos.y) / int(tile_size.y)))

#arrange the cursor sprite offset
func arrange_sprite(object_size):
	cursor_sprite.offset = -tile_size*0.15

#get an corrected global position cuz cursor offset
func adjust_global_pos(new_pos):
	var adjusted_pos = pos_to_cell(new_pos, tile_size) * tile_size.x
	return adjusted_pos

#check if one grid cell is filled with object or not
func is_cell_filled(grid, adjust_glo_pos, object_size):
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	for x in range (adjust_grid_pos.x-1, adjust_grid_pos.x+object_size.x-1):
		for y in range (adjust_grid_pos.y-1, adjust_grid_pos.y+object_size.y-1):
			if (grid[x][y][0] != EMPTY):
				return grid[x][y][1]
	return null

#add the reference of new object to the grid data list
func add_child_pos(grid, obj_dict, adjust_glo_pos, object_size, this_obj):
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	var obj_grids = []
	for x in range (adjust_grid_pos.x-1, adjust_grid_pos.x+object_size.x-1):
		for y in range (adjust_grid_pos.y-1, adjust_grid_pos.y+object_size.y-1):
			grid[x][y] = [OBJECT, this_obj]
			obj_grids.append([x+1,y+1])
	obj_dict[this_obj]=obj_grids
			
#substract the specified object from the grid data list
func substract_child_pos(grid, obj_dict, adjust_glo_pos, this_obj):
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	for x in range (adjust_grid_pos.x-2, adjust_grid_pos.x+2):
		for y in range (adjust_grid_pos.y-2, adjust_grid_pos.y+object_size.y):
			if grid[x][y][1]==this_obj:
				grid[x][y] = [EMPTY, null]
	var removed = obj_dict.erase(this_obj)

#The pop up alert message
func _on_Timer_timeout():
	poped_message.visible = false
	
##################### process ######################
func _process(delta):
	global_position = get_global_mouse_position()
	
	var new_pos = get_global_mouse_position()
	var new_grid_pos = pos_to_cell(new_pos, tile_size)
	var adjust_glo_pos = adjust_global_pos(new_pos)
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	
	if(current_item != null):
		arrange_sprite(object_size)
	
	if SELECT_MODE and current_item:
		current_item = null
		cursor_sprite.texture = null
	
	
	#Left mouse click to place object on grid map
	if Input.is_action_just_pressed("mouse_left"):
		if (!SELECT_MODE) and current_item:
			if (new_grid_pos.x < grid_size.x and new_grid_pos.y < grid_size.y):
				
				if(!is_cell_filled(grid, adjust_glo_pos, object_size)):
					var new_item = current_item.instance(1)
	#					new_item.set_owner(room)
					room.add_child(new_item)
					var new_obj = room.get_children()[-1]
					new_item.global_position = adjust_glo_pos
					add_child_pos(grid, obj_dict, adjust_glo_pos, object_size, new_obj)
				
				else:
					poped_message.set_global_position(global_position)
					poped_message.visible = true
					poped_timer.start(1)
#					print("Can't place overlapping objects.")
			
			
	#Right mouse click to cancle current mouse sprite
	if Input.is_action_just_pressed("mg_right"):
		if(current_item):
			current_item = null
			cursor_sprite.texture = null
	
	#first remove the current cursor sprite when press delete
	if Input.is_action_just_pressed("delete"):
		if(current_item):
			current_item = null
			cursor_sprite.texture = null
	
	#if keep pressing delete, change mouse cursor to trashbin
	#if left mouse left click when delete is pressing, delete an object		
	if Input.is_action_pressed("delete"):
		Input.set_custom_mouse_cursor(trashbin)
		if Input.is_action_just_pressed("mouse_left"):
			var this_object = is_cell_filled(grid, adjust_glo_pos, object_size)
			if(this_object):
				room.remove_child(this_object)
				substract_child_pos(grid,obj_dict,adjust_glo_pos,this_object)
	else:
		Input.set_custom_mouse_cursor(null)
			
#
#	if Input.is_action_just_pressed("cancel_action"):
#		var all_objects=room.get_children()
#		if(all_objects):
#			var last_object = all_objects[-1]
#			room.remove_child(last_object)
#			substract_child_pos(grid,obj_dict,adjust_glo_pos,last_object)

