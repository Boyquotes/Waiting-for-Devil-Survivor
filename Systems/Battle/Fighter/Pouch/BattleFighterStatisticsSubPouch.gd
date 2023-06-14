@tool
class_name BattleFighterStatisticsSubPouch
extends BattleFighterSubPouch


class _ActiveConsumable:
	extends Object
	
	
	var maximum := ConsumableStatistics.new()
	var current := ConsumableStatistics.new()
	
	
	func save_snapshot() -> Dictionary:
		
		var snapshot := {}
		
		snapshot["maximum"] = maximum.save_snapshot()
		snapshot["current"] = current.save_snapshot()
		
		return snapshot
	
	
	func load_snapshot(snapshot: Dictionary) -> Error:
		
		var err := OK
		
		maximum.load_snapshot(snapshot["maximum"])
		current.load_snapshot(snapshot["current"])
		
		return err


var progression := ProgressionStatistics.new()
var consumable := _ActiveConsumable.new()
var battle := BattleStatistics.new()
var field := FieldStatistics.new()


func _notification(what) -> void:
	
	if what == NOTIFICATION_PREDELETE:
		consumable.free()



func save_snapshot() -> Dictionary:
	
	var snapshot := super()
	
	snapshot["progression"] = progression.save_snapshot()
	snapshot["consumable"] = consumable.save_snapshot()
	snapshot["battle"] = battle.save_snapshot()
	snapshot["field"] = field.save_snapshot()
	
	return snapshot


func load_snapshot(snapshot: Dictionary) -> Error:
	
	var err := super(snapshot)
	
	progression.load_snapshot(snapshot["progression"])
	consumable.load_snapshot(snapshot["consumable"])
	battle.load_snapshot(snapshot["battle"])
	field.load_snapshot(snapshot["field"])
	
	return err
