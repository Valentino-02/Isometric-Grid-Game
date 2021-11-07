extends Node2D
class_name Unit

export var move_range : int = 4

var cell : Vector2 setget set_cell
var grid: Resource = preload("res://Source/System/Grid.tres")


func _ready() -> void:
	cell = grid.screen_to_cell(position)
	position = grid.cell_to_screen(cell) 
	add_to_group("Units")

func set_cell(value):
	cell = value
	position = grid.cell_to_screen(cell) 

