@tool
class_name InstantiableDataRecord
extends DataRecord


var base_record: InstantiableDataRecord = null




func is_instance() -> bool:
	
	return is_instance_valid(base_record)


func is_instance_of_record(record_to_check: InstantiableDataRecord) -> bool:
	
	if is_instance():
		return base_record == record_to_check
	return false


func instantiate() -> InstantiableDataRecord:
	
	if is_instance():
		printerr("Cannot instantiate an instance.")
		return self
	
	var instance := duplicate(false) as InstantiableDataRecord
	instance.base_record = self
	
	return instance






func save_snapshot() -> Dictionary:
	
	var snapshot: Dictionary = {}
	
	if not is_instance():
		printerr("Only instances can be saved as snapshots.")
		return snapshot
	
	snapshot["base_record"] = base_record.resource_path
	
	return snapshot


func load_snapshot(snapshot: Dictionary) -> Error:
	
	var err := OK
	
	return err





static func instantiate_snapshot(snapshot: Dictionary) -> InstantiableDataRecord:
	
	var instance: InstantiableDataRecord
	
	var base_path := str(snapshot.get("base_record", ""))
	
	if ResourceLoader.exists(base_path):
		var base := load(base_path) as InstantiableDataRecord
		if is_instance_valid(base):
			instance = base.instantiate()
	
	if is_instance_valid(instance):
		instance.load_snapshot(snapshot)
	
	return instance
