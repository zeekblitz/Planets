@tool
extends Resource
class_name PlanetNoise

@export var noise_map : FastNoiseLite :
	set(noise):
		noise_map = noise
		emit_signal("changed")
		if noise_map != null and not noise_map.is_connected("changed", Callable(self, "on_data_changed")):
			noise_map.connect("changed", Callable(self, "on_data_changed"))

@export var amplitude : float = 1.0 : 
	set(value):
		amplitude = value
		emit_signal("changed")

@export var min_height : float = 0.0 :
	set(value):
		min_height = value
		emit_signal("changed")

@export var use_first_layer_as_mask : bool = false:
	set(value):
		use_first_layer_as_mask = value
		emit_signal("changed")

func on_data_changed():
	emit_signal("changed")
