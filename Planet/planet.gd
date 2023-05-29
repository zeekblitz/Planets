@tool
extends Node3D

@export var planet_data : Resource:
	set(value): 
		planet_data = value
		on_data_changed()
		if planet_data != null and not planet_data.is_connected("changed", Callable(self, "on_data_changed")):
			planet_data.connect("changed", Callable(self, "on_data_changed"))
	#get: return planet_data

func _ready():
	on_data_changed()

func on_data_changed():
	planet_data.min_height = 99999.0
	planet_data.max_height = 0.0
	for child in get_children():
		var face := child as PlanetMeshFace
		face.regenerate_mesh(planet_data)
