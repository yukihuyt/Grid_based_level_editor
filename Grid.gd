extends TileMap

onready var room = $"/root/Main/Room"
onready var selector = $"/root/Main/Control"
onready var cursor_sprite = get_node("Sprite")
onready var edit_mouse = $"/root/Main/Editor"

const half_vec = Vector2(0.5, 0.5)
const unit_vec = Vector2(1, 1)
const double_vec = Vector2(2, 2)

enum {EMPTY, OBJECT, WALL}
enum {ADD, REMOVE}

var current_item
var can_place
var object_size
var tile_size = get_cell_size()
var half_tile_size = cell_size / 2
var grid_size = Vector2(25, 12)
var grid = []


#var cell_vacant = true

onready var Wall = preload("res://Images/placed_pics/wall.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(EMPTY)
	

func is_cell_vacant(grid, adjust_glo_pos, object_size):
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	for x in range (adjust_grid_pos.x-1, adjust_grid_pos.x+object_size.x-1):
		for y in range (adjust_grid_pos.y-1, adjust_grid_pos.y+object_size.y-1):
			if (grid[x][y] == EMPTY):
				return true
			else:
				return false

func cell_to_pos(grid_pos, tile_size):
	return grid_pos*tile_size.x

func pos_to_cell(pos, tile_size):
	return Vector2(float(int(pos.x)/int(tile_size.x)), float(int(pos.y)/int(tile_size.y)))

func arrange_sprite(object_size):
	cursor_sprite.offset = -tile_size*0.15

func adjust_global_pos(new_pos, object_size):
	var adjusted_pos = pos_to_cell(new_pos, tile_size) * tile_size.x
	return adjusted_pos

func update_child_pos(grid, adjust_glo_pos, object_size, action):
	var adjust_grid_pos = pos_to_cell(adjust_glo_pos, tile_size)
	for x in range (adjust_grid_pos.x-1, adjust_grid_pos.x+object_size.x-1):
		for y in range (adjust_grid_pos.y-1, adjust_grid_pos.y+object_size.y-1):
			if action == ADD:
				grid[x][y] = OBJECT
			if action == REMOVE:
				grid[x][y] = EMPTY


func _process(delta):
	global_position = get_global_mouse_position()
	
	if(current_item != null):
		arrange_sprite(object_size)
		var new_pos = get_global_mouse_position()
		var new_grid_pos = pos_to_cell(new_pos, tile_size)
		
		if Input.is_action_just_pressed("mouse_left"):
				var adjust_glo_pos = adjust_global_pos(new_pos, object_size)
				if (new_grid_pos.x < grid_size.x and new_grid_pos.y < grid_size.y):
					if(is_cell_vacant(grid, adjust_glo_pos, object_size)):
						var new_item = current_item.instance()
						room.add_child(new_item)
						new_item.global_position = adjust_glo_pos
						update_child_pos(grid, adjust_glo_pos, object_size, ADD)
					else:
						print("Can't place overlapping objects.")
		
#		if Input.is_action_just_pressed("mg_right"):
#			if (new_grid_pos.x < grid_size.x and new_grid_pos.y < grid_size.y):
#				if(is_cell_vacant(grid, adjust_glo_pos, object_size)):
#



