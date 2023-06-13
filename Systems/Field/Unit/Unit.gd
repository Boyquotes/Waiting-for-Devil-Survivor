@tool
class_name Unit
extends Node3D


const Direction := FieldConstants.Direction


signal tile_changed(new_tile: Vector2i)

signal direction_changed(new_direction: Direction)

signal modulate_changed(new_modulate: Color)



var tile := Vector2i.ZERO: set = set_tile, get = get_tile

@export var direction := Direction.SOUTH: set = set_direction, get = get_direction

@export var modulate := Color( 1, 1, 1, 1 ): set = set_modulate, get = get_modulate


func set_tile(p_tile: Vector2i) -> void:
	
	tile = p_tile
	tile_changed.emit(p_tile)


func get_tile() -> Vector2i:
	
	return tile


func set_direction(p_direction: Direction) -> void:
	
	direction = p_direction
	direction_changed.emit(p_direction)


func get_direction() -> Direction:
	
	return direction


func set_modulate(p_modulate: Color) -> void:
	
	modulate = p_modulate
	modulate_changed.emit(p_modulate)


func get_modulate() -> Color:
	
	return modulate
