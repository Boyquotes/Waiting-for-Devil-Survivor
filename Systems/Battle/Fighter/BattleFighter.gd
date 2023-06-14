@tool
class_name BattleFighter
extends Node


var stats := BattleFighterStatisticsSubPouch.new(self)


func _notification(what) -> void:
	
	match what:
		NOTIFICATION_PREDELETE:
			stats.free()
