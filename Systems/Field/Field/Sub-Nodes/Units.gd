@tool
extends Node


var _units: Dictionary = {}






func has_unit(unit_name: String) -> bool:
	
	return _units.has(unit_name)


func get_unit(unit_name: String) -> Unit:
	
	if has_unit(unit_name):
		return _units[unit_name]
	
	return null


func get_units() -> Array [Unit]:
	
	var unit_list: Array [Unit] = []
	
	var keys := _units.keys()
	
	for key in keys:
		var unit := _units[key] as Unit
		unit_list.append(unit)
	
	return unit_list


func register_unit(unit_to_register: Unit) -> bool:
	
	var unit_name: String = unit_to_register.name
	if unit_name.is_empty() or has_unit(unit_name):
		var new_unit_name = _generate_valid_unit_name(unit_name)
	
	_units[unit_to_register.name] = unit_to_register
	return true




func _generate_valid_unit_name(current_unit_name: String) -> String:
	
	const NAME_GENERATION_MAX_ATTEMPTS: int = 512
	
	for i in range( 0, NAME_GENERATION_MAX_ATTEMPTS, 1 ):
		
		var new_unit_name: String = current_unit_name + "_" + str( randi_range(0, 9999) ).pad_zeros(4)
		
		if not has_unit(new_unit_name):
			return new_unit_name
		continue
	
	printerr("Failed to generate a unique name within %d attempts.\nThis must be an RNG bug." % NAME_GENERATION_MAX_ATTEMPTS)
	
	return current_unit_name
