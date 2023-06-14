@tool
class_name ConsumableStatistics
extends Statistics


enum ID {
	HEALTH = 0,
	MANA = 1,
}


const CONSUMABLE_STAT_COUNT: int = 2
const CONSUMABLE_STAT_PROPERTY_KEYS: PackedStringArray = [ "health", "mana" ]
const CONSUMABLE_STAT_NAMES: PackedStringArray = [ "Health", "Mana" ]
const CONSUMABLE_STAT_ABBREVIATIONS: PackedStringArray = [ "HP", "MP" ]


@export var health: int = 0:
	set(p_health):
		health = p_health
		_refresh_name()

@export var mana: int = 0:
	set(p_mana):
		mana = p_mana
		_refresh_name()


static func get_stat_enumeration() -> Dictionary:
	
	return ID


static func get_stat_count() -> int:
	
	return CONSUMABLE_STAT_COUNT


static func get_stat_property_keys() -> PackedStringArray:
	
	return CONSUMABLE_STAT_PROPERTY_KEYS


static func get_stat_names() -> PackedStringArray:
	
	return CONSUMABLE_STAT_NAMES


static func get_stat_abbreviations() -> PackedStringArray:
	
	return CONSUMABLE_STAT_ABBREVIATIONS
