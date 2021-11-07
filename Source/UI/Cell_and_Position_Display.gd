extends Control

var board : Resource = preload("res://Source/System/BoardManager.tres")
var grid : Resource = preload("res://Source/System/Grid.tres")

onready var coursor := get_parent().get_node("Coursor")
onready var cell_label := $Cell 
onready var position_label := $Position 
onready var coursor_position_label := $Coursor_Position
onready var has_unit_label := $Has_Unit


func _ready():
	coursor.connect("left_clicked", self, "_on_Coursor_left_clicked")

func _on_Coursor_left_clicked(cell) -> void:
	coursor_position_label.text = "Coursor Position = " + str(get_global_mouse_position().floor())
	cell_label.text = "Cell = " + str(cell)
	position_label.text = "Position = " + str(grid.cell_to_screen(cell))
	has_unit_label.text = "Has Unit = " + str(board.cell_with_unit.has(coursor.cell))
