
extends Node


var current_event: Event = null


func save_snapshot() -> Dictionary:
	
	var snapshot := {}
	
	if is_instance_valid(current_event):
		snapshot["current_event"] = current_event.save_snapshot()
	else:
		snapshot["current_event"] = null
	
	return snapshot
