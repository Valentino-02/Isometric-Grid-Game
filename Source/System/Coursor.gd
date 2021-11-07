class_name Cursor
extends Node2D


signal left_clicked(cell)
signal right_clicked(cell)
signal moved(cell)

var arrow := load("res://Assets/UI/Coursor.png")
var cell : Vector2
var grid : Resource = preload("res://Source/System/Grid.tres")


func _ready() -> void:
	Input.set_custom_mouse_cursor(arrow)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		cell = grid.screen_to_cell(get_global_mouse_position())
		emit_signal("moved", cell)
		
	if event.is_action_pressed("left_click"):
		cell = grid.screen_to_cell(get_global_mouse_position())
		emit_signal("left_clicked", cell)
		get_tree().set_input_as_handled()
		
	if event.is_action_pressed("right_click"):
		cell = grid.screen_to_cell(get_global_mouse_position())
		emit_signal("right_clicked", cell)
		get_tree().set_input_as_handled()


