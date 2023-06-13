@tool
class_name FieldGridTileLayout
extends Resource


class _TempTileDataCopy:
	extends Object
	
	var flags: int = 0
	var heightmap: PackedFloat32Array
	
	func _init(p_flags: int, p_heightmap: PackedFloat32Array) -> void:
		
		assert(p_heightmap.size() > 3)
		
		flags = p_flags
		heightmap = p_heightmap


class IterationRangesStruct:
	extends RefCounted
	
	var x: Array
	var y: Array
	
	func _init(p_x: Array, p_y: Array) -> void:
		
		x = p_x
		y = p_y



signal resized()



const TileFlag := FieldConstants.TileFlag


const DEFAULT_DIMENSIONS := Rect2i( Vector2i.ZERO, Vector2i.ZERO )
const DEFAULT_TILE_FLAGS: int = TileFlag.CONNECTED_WEST | TileFlag.CONNECTED_EAST | TileFlag.CONNECTED_NORTH | TileFlag.CONNECTED_SOUTH


@export var dimensions: Rect2i = DEFAULT_DIMENSIONS


@export var grid_flags: PackedInt32Array = PackedInt32Array()

@export var grid_heightmap: PackedFloat32Array = PackedFloat32Array()





func resize(new_dimensions: Rect2i) -> void:
	
	var old_dimensions := dimensions
	
	var old_iteration_ranges := get_iteration_ranges(old_dimensions)
	var new_iteration_ranges := get_iteration_ranges(new_dimensions)
	
	var tile_temp_copies: Dictionary = {}
	
	for x in old_iteration_ranges.x:
		for y in old_iteration_ranges.y:
			
			var current_tile := Vector2i( x, y )
			
			var current_tile_flags := get_flags_at_tile(current_tile)
			var current_tile_heightmap := get_heightmap_at_tile(current_tile)
			
			var current_tile_copy := _TempTileDataCopy.new(
				current_tile_flags,
				current_tile_heightmap
			)
			
			tile_temp_copies[current_tile] = current_tile_copy
	
	grid_flags.clear()
	grid_heightmap.clear()
	
	var new_size_flat: int = new_dimensions.size.x * new_dimensions.size.y
	
	grid_flags.resize(new_size_flat)
	grid_heightmap.resize(new_size_flat * 4)
	
	grid_flags.fill(DEFAULT_TILE_FLAGS)
	grid_heightmap.fill(0.0)
	
	
	dimensions = new_dimensions
	
	
	
	for current_tile in tile_temp_copies.keys():
		
		current_tile = current_tile as Vector2i
		
		if has_tile_at(current_tile):
			
			var current_tile_temp_copy := tile_temp_copies[current_tile] as _TempTileDataCopy
			
			set_flags_at_tile(current_tile, current_tile_temp_copy.flags)
			set_heightmap_at_tile(current_tile, current_tile_temp_copy.heightmap)
	
	resized.emit()





func has_tile_at(tile: Vector2i) -> bool:
	
	return \
	not tile.x < dimensions.position.x and \
	not tile.y < dimensions.position.y and \
	tile.x < dimensions.end.x and \
	tile.y < dimensions.end.y










func set_flags_at_tile(at_tile: Vector2i, tile_flags: int) -> void:
	
	var tile_index := two_to_one(at_tile)
	
	assert(tile_index < grid_flags.size())
	
	grid_flags[tile_index] = tile_flags


func get_flags_at_tile(at_tile: Vector2i) -> int:
	
	var tile_index := two_to_one(at_tile)
	
	assert(tile_index < grid_flags.size())
	
	return grid_flags[tile_index]






func set_heightmap_at_tile(at_tile: Vector2i, tile_heightmap: PackedFloat32Array) -> void:
	
	assert(tile_heightmap.size() > 3)
	
	var tile_index := two_to_one(at_tile)
	
	assert(tile_index < grid_heightmap.size() - 3)
	
	var corner_index := 0
	for i in range( tile_index, tile_index + 4, 1 ):
		grid_heightmap[i] = tile_heightmap[corner_index]
		corner_index += 1




func get_heightmap_at_tile(at_tile: Vector2i) -> PackedFloat32Array:
	
	var input_tile_heightmap := PackedFloat32Array()
	
	var tile_index := two_to_one(at_tile)
	
	assert(tile_index < grid_heightmap.size() - 3)
	
	for i in range( tile_index, tile_index + 4, 1 ):
		
		var current_corner_height := grid_heightmap[i]
		input_tile_heightmap.push_back(current_corner_height)
	
	return input_tile_heightmap











func two_to_one(tile_vec2i: Vector2i, offset_to_zero: bool = true) -> int:
	
	if offset_to_zero:
		tile_vec2i -= dimensions.size
	
	var tile_index: int = tile_vec2i.y * dimensions.size.x + tile_vec2i.x
	
	return tile_index


func one_to_two(tile_index: int) -> Vector2i:
	
	var tile_vec2i: Vector2i = Vector2i(tile_index % dimensions.size.x, tile_index / dimensions.size.x)
	tile_vec2i += dimensions.position
	
	return tile_vec2i


func get_iteration_ranges(for_dimensions: Rect2i = dimensions) -> IterationRangesStruct:
	
	return IterationRangesStruct.new(
		range( dimensions.position.x, dimensions.end.x, 1 ),
		range( dimensions.position.y, dimensions.end.y, 1 ),
	)
