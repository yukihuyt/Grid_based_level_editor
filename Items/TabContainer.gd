extends TabContainer
onready var object_cursor=$"/root/Main/Editor"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# dont allow object placement on select menu area
func _on_TabContainer_mouse_entered():
	object_cursor.can_place = false
	pass # Replace with function body.


func _on_TabContainer_mouse_exited():
	object_cursor.can_place = true
	pass # Replace with function body.


func _on_ScrollContainer_mouse_entered():
	object_cursor.can_place = false
	pass # Replace with function body.

func _on_ScrollContainer_mouse_exited():
	object_cursor.can_place = true
	pass # Replace with function body.
