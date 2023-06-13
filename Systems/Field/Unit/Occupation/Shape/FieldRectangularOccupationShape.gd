@tool
class_name FieldRectangularOccupationShape
extends FieldOccupationShape


@export var offset := Vector2i.ZERO

@export var size := Vector2i.ONE


func get_covered_tiles() -> Array [Vector2i]:
	
	var covered_tiles := super()
	
	for x in range( offset.x, offset.x + size.x, 1 ):
		for y in range( offset.y, offset.y + size.y, 1 ):
			
			var covered_tile := Vector2i( x, y )
			covered_tiles.append(covered_tile)
	
	return covered_tiles
