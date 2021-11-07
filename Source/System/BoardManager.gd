extends Resource
class_name BoardManager

const DIRECTIONS = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]

# dictionary of keys=cells : value=units
var cell_with_unit := {}
var active_unit : Unit 
var grid  : Resource = preload("res://Source/System/Grid.tres")


# returns array of empty cells. now it only test if the cell has a Unit
func get_cells_between(starting_cell: Vector2, max_distance: int) -> Array:
	var cells := []
	var testing_cells := [starting_cell]
	while not testing_cells.empty():
		var current_cell = testing_cells.pop_back()
		var difference: Vector2 = (current_cell - starting_cell).abs()
		var distance := int(difference.x + difference.y)
		if not grid.is_within_bounds(current_cell):
			continue
		if current_cell in cells:
			continue
		if distance > max_distance:
			continue
		cells.append(current_cell)
		for direction in DIRECTIONS:
			var new_cell: Vector2 = current_cell + direction
			if cell_has_unit(new_cell): 
				continue
			if new_cell in cells:
				continue
			testing_cells.append(new_cell)
	return cells

func get_walkable_cells(unit: Unit) -> Array:
	return get_cells_between(unit.cell, unit.move_range)

func move_active_unit(new_cell: Vector2) -> void:
	cell_with_unit.erase(active_unit.cell)
	active_unit.cell = new_cell
	cell_with_unit[new_cell] = active_unit
	deselect_active_unit()

func select_unit(cell: Vector2) -> void:
	active_unit = cell_with_unit[cell]

func deselect_active_unit() -> void:
	active_unit = null

func cell_has_unit(cell: Vector2) -> bool:
	return cell_with_unit.has(cell)
