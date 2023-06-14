@tool
class_name ProgressionStatistics
extends Statistics


enum ID {
	LEVEL = 0,
	EXPERIENCE = 1,
}


const PROGRESSION_STAT_COUNT: int = 2
const PROGRESSION_STAT_PROPERTY_KEYS: PackedStringArray = [ "level", "experience" ]
const PROGRESSION_STAT_NAMES: PackedStringArray = [ "Level", "Experience Points" ]
const PROGRESSION_STAT_ABBREVIATIONS: PackedStringArray = [ "Lv", "EXP" ]


@export var level: int = 0:
	set(p_level):
		level = p_level
		_refresh_name()

@export var experience: int = 0:
	set(p_experience):
		experience = p_experience
		_refresh_name()


static func get_stat_enumeration() -> Dictionary:
	
	return ID


static func get_stat_count() -> int:
	
	return PROGRESSION_STAT_COUNT


static func get_stat_property_keys() -> PackedStringArray:
	
	return PROGRESSION_STAT_PROPERTY_KEYS


static func get_stat_names() -> PackedStringArray:
	
	return PROGRESSION_STAT_NAMES


static func get_stat_abbreviations() -> PackedStringArray:
	
	return PROGRESSION_STAT_ABBREVIATIONS
