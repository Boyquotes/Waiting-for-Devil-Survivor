@tool
class_name FieldHelpers
extends RefCounted



static func find_relevant_field(for_node: Node) -> Field:
	
	if not is_instance_valid(for_node) or not for_node.is_inside_tree():
		printerr("Can't look for field on a Node that isn't present inside the tree.")
		return null
	
	
	# First, search for an ancestor
	var current_parent := for_node
	
	while is_instance_valid(current_parent):
		
		if current_parent is Field:
			return current_parent as Field
		
		current_parent = current_parent.get_parent()
	
	
	# If not a descendant of a field, search using other methods
	if Engine.is_editor_hint():
		var edited_scene_root := for_node.get_tree().edited_scene_root
		if is_instance_valid(edited_scene_root):
			# Only direct children of the edited scene will work, don't nest the field!
			for child in edited_scene_root.get_children(false):
				if child is Field:
					return child as Field
	
	else:
		var event := SceneManager.current_event
		
		if is_instance_valid(event):
			
			return event.get_field() as Field
	
	return null
