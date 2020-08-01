extends Node2D

onready var grid = $"/root/Main/Editor"

func _ready():
	pass
#draw the grid
func _draw():
	var LINE_COLOR = Color(.5, .5, .5)
	var LINE_WIDTH = 0.05
#	var window_size = OS.get_window_size()

	for x in range(grid.map_size.x + 1):
		var col_pos = x * grid.cell_size.x
		var limit = grid.map_size.y * grid.cell_size.y
		draw_line(Vector2(col_pos, 0), Vector2(col_pos, limit), LINE_COLOR, LINE_WIDTH)
	for y in range(grid.map_size.y + 1):
		var row_pos = y * grid.cell_size.y
		var limit = grid.map_size.x * grid.cell_size.x
		draw_line(Vector2(0, row_pos), Vector2(limit, row_pos), LINE_COLOR, LINE_WIDTH)
