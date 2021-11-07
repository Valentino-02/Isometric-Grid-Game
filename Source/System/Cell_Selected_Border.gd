extends Sprite


var grid : Resource = preload("res://Source/System/Grid.tres")

onready var coursor := get_parent().get_node("Coursor")


func _ready():
	coursor.connect("moved", self, "_on_Coursor_moved")
	
func _on_Coursor_moved(cell):
	position = grid.cell_to_screen(cell) 
