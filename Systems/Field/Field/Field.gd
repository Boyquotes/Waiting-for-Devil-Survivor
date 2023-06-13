@tool
class_name Field
extends Node3D


const UNITS_SCRIPT := preload("Sub-Nodes/Units.gd")
const MAPS_SCRIPT := preload("Sub-Nodes/Maps.gd")


@onready var units := $"Units" as UNITS_SCRIPT
@onready var maps := $"Maps" as MAPS_SCRIPT



