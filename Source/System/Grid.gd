extends Resource
class_name Grid


var _grid_size := Vector2(16,16)
var _tile_size := Vector2(40,20)
var _tile_half := _tile_size/2


# gets the position of the middle of the cell
func cell_to_screen(cell : Vector2) -> Vector2:
	var screen : Vector2
	screen.x = (cell.x - cell.y) * _tile_half.x
	screen.y = (cell.x + cell.y) * _tile_half.y + _tile_half.y
	return screen

func screen_to_cell(position : Vector2) -> Vector2:
	var cell : Vector2
	var scaled_position := Vector2(position.x / _tile_half.x , position.y / _tile_half.y)
	cell.x = int(floor( (scaled_position.x + scaled_position.y)/2 ))
	cell.y = int(floor( (scaled_position.y - scaled_position.x)/2 ))
	return cell

func is_within_bounds(cell : Vector2) -> bool:
	return (cell.x >= 0 and cell.x < _grid_size.x) and (cell.y >= 0 and cell.y < _grid_size.y)


#I am not using this at the moment
# Creates an array with nx arrays inside, each of legth ny. All the postions of all the arrays will store the argument "value"
# after creating the matrix, you store a value in cell (x,y) by matrix[x][y]
func create_matrix(nx, ny, value):
	var matrix = []
	# each iteration appends an array of length ny into array a, wich happens nx times --> a = [ [,...,ny], ..., [,...,ny] ]
	for x in range(nx):
		matrix.append([])
		matrix[x].resize(ny)
		# in each of the x iterations, it also stores the value in all of the positions of one of these arrays inside a 
		for y in range(ny):
			matrix[x][y] = value
	return matrix

