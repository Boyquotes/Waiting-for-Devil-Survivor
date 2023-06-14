@tool
class_name FieldOccupier
extends Node3D


const DEFAULT_SHAPE := preload("Shape/Default Shape.tres")


@export var shape: FieldOccupationShape = DEFAULT_SHAPE


func get_covered_tiles() -> Array [Vector2i]:
	
	if is_instance_valid(shape):
		return shape.get_covered_tiles()
	
	return []
