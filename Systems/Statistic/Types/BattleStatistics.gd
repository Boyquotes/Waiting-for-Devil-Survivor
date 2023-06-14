@tool
class_name BattleStatistics
extends Statistics



enum ID {
	STRENGTH = 0,
	MAGIC = 1,
	VITALITY = 2,
	AGILITY = 3,
}


const BATTLE_STAT_COUNT: int = 4
const BATTLE_STAT_PROPERTY_KEYS: PackedStringArray = [ "strength", "magic", "vitality", "agility" ]
const BATTLE_STAT_NAMES: PackedStringArray = [ "Strength", "Magic", "Vitality", "Agility" ]
const BATTLE_STAT_ABBREVIATIONS: PackedStringArray = [ "St", "Ma", "Vi", "Ag" ]


@export var strength: int = 0:
	set(p_strength):
		strength = p_strength
		_refresh_name()

@export var magic: int = 0:
	set(p_magic):
		magic = p_magic
		_refresh_name()

@export var vitality: int = 0:
	set(p_vitality):
		vitality = p_vitality
		_refresh_name()

@export var agility: int = 0:
	set(p_agility):
		agility = p_agility
		_refresh_name()


static func get_stat_enumeration() -> Dictionary:
	
	return ID


static func get_stat_count() -> int:
	
	return BATTLE_STAT_COUNT


static func get_stat_property_keys() -> PackedStringArray:
	
	return BATTLE_STAT_PROPERTY_KEYS


static func get_stat_names() -> PackedStringArray:
	
	return BATTLE_STAT_NAMES


static func get_stat_abbreviations() -> PackedStringArray:
	
	return BATTLE_STAT_ABBREVIATIONS
