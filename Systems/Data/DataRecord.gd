@tool
class_name DataRecord
extends Resource


@export var id_string: StringName = &"": set = set_id_string, get = get_id_string


func set_id_string(p_id_string: StringName) -> void:
	
	id_string = p_id_string


func get_id_string() -> StringName:
	
	return id_string
