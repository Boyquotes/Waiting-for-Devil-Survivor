@tool
class_name FieldStatistics
extends Statistics


enum ID {
	MOVE_RANGE = 0,
	SPEED = 1,
}


const FIELD_STAT_COUNT: int = 2
const FIELD_STAT_PROPERTY_KEYS: PackedStringArray = [ "move_range", "speed" ]
const FIELD_STAT_NAMES: PackedStringArray = [ "Move Range", "Speed" ]
const FIELD_STAT_ABBREVIATIONS: PackedStringArray = [ "Move", "Speed" ]


@export var move_range: int = 0:
	set(p_move_range):
		move_range = p_move_range
		_refresh_name()

@export var speed: int = 0:
	set(p_speed):
		speed = p_speed
		_refresh_name()


static func get_stat_enumeration() -> Dictionary:
	
	return ID


static func get_stat_count() -> int:
	
	return FIELD_STAT_COUNT


static func get_stat_property_keys() -> PackedStringArray:
	
	return FIELD_STAT_PROPERTY_KEYS


static func get_stat_names() -> PackedStringArray:
	
	return FIELD_STAT_NAMES


static func get_stat_abbreviations() -> PackedStringArray:
	
	return FIELD_STAT_ABBREVIATIONS

