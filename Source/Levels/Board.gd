extends Node2D


var board : Resource = preload("res://Source/System/BoardManager.tres")

onready var coursor := $Coursor
onready var overlay := $Overlay


func _ready() -> void:
	coursor.connect("left_clicked", self, "_on_Coursor_left_clicked")
	coursor.connect("right_clicked", self, "_on_Coursor_right_clicked")
	for unit in get_tree().get_nodes_in_group("Units"):
		board.cell_with_unit[unit.cell] = unit

# will later move the overlay functionality, to an overlay script, or the board manager
# will later use an estate machine, and rewrite this
func _on_Coursor_left_clicked(cell):
	if board.cell_has_unit(cell):
		board.select_unit(cell)
		overlay.clear()
		for cells in board.get_cells_between(cell, board.active_unit.move_range):
			overlay.set_cellv(cells, 0)

func _on_Coursor_right_clicked(cell):
	if board.active_unit != null:
		if cell in board.get_walkable_cells(board.active_unit):
			board.move_active_unit(cell)
			overlay.clear()
