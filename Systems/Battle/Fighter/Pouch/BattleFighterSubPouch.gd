@tool
class_name BattleFighterSubPouch
extends Object


var fighter: BattleFighter = null


func _init(p_fighter: BattleFighter) -> void:
	
	assert( is_instance_valid(p_fighter) )
	fighter = p_fighter


func save_snapshot() -> Dictionary:
	
	var snapshot := {}
	
	return snapshot


func load_snapshot(snapshot: Dictionary) -> Error:
	
	var err := OK
	
	return err
