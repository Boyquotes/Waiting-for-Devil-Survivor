@tool
class_name FieldConstants
extends RefCounted


enum Direction {
	WEST = 0,
	EAST = 1,
	NORTH = 2,
	SOUTH = 3,
}


const DIRECTION_OPPOSITES: Dictionary = {
	Direction.WEST: Direction.EAST,
	Direction.EAST: Direction.WEST,
	Direction.NORTH: Direction.SOUTH,
	Direction.SOUTH: Direction.NORTH,
}


const DIRECTION_VEC2I: Dictionary = {
	Direction.WEST: Vector2i.LEFT,
	Direction.EAST: Vector2i.RIGHT,
	Direction.NORTH: Vector2i.UP,
	Direction.SOUTH: Vector2i.DOWN,
}


const DIRECTION_VEC3: Dictionary = {
	Direction.WEST: Vector3.LEFT,
	Direction.EAST: Vector3.RIGHT,
	Direction.NORTH: Vector3.FORWARD,
	Direction.SOUTH: Vector3.BACK,
}


enum TileFlag {
	CONNECTED_WEST = 1,
	CONNECTED_EAST = 2,
	CONNECTED_NORTH = 4,
	CONNECTED_SOUTH = 8,
	MOVABLE = 16,
}
