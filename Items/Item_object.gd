extends TextureRect

#export(String, FILE) var this_scene
export(PackedScene) var this_scene
export(StreamTexture) var cursor_texture
export(Vector2) var collision_size
#export(bool) var can_overlap

onready var object_cursor = get_node("/root/Main/Editor")
onready var cursor_sprite = object_cursor.get_node(("Sprite"))

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("gui_input", self, "_item_clicked")
#	connect("gui_input", object_cursor, "_item_moved")

func _item_clicked(event):
	if(event is InputEvent):
		if(event.is_action_pressed("mouse_left")):
			object_cursor.current_item = this_scene
			cursor_sprite.texture = cursor_texture
			object_cursor.object_size = collision_size

