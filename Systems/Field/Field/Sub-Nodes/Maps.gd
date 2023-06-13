@tool
extends Node


var _maps: Dictionary = {}


func has_map(map_name: String) -> bool:
	
	return _maps.has(map_name)


func get_map(map_name: String) -> FieldMap:
	
	if has_map(map_name):
		var map := _maps[map_name] as FieldMap
		assert( is_instance_valid(map) )
		return map
	
	return null


func get_maps() -> Array [FieldMap]:
	
	var map_list: Array [FieldMap] = []
	
	for map_name in _maps.keys():
		var map := get_map(map_name)
		map_list.append(map)
	
	return map_list


func register_map(map: FieldMap) -> bool:
	
	var map_name := map.name as String
	
	if has_map(map_name):
		return false
	
	_maps[map_name] = map
	return true


func unregister_map(map_name: String) -> bool:
	
	return _maps.erase(map_name)
