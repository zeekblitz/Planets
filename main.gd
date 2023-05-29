extends Node3D

var rot = 0.5
@onready var planet = $Planet

func _process(delta):
	planet.rotate_y(rot * delta)
