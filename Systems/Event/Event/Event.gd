@tool
class_name Event
extends Node


var field: Field = null: get = get_field




















func get_field() -> Field:
	
	field = null
	
	for child in get_children():
		if child is Field:
			field = child
	
	return field
