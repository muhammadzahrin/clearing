@tool # also runs in the editor, so you can see the forest there
extends Node3D

const TREE := preload("res://tree.tscn")
const COUNT := 140
const AREA := 28.0 # half-width of the forest; the boundary walls sit at 30
const CLEARING := 6.0 # keep the spawn point open


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 7 # same forest every run
	var placed := 0
	while placed < COUNT:
		var pos := Vector3(rng.randf_range(-AREA, AREA), 0, rng.randf_range(-AREA, AREA))
		if pos.length() < CLEARING:
			continue
		var tree := TREE.instantiate()
		tree.position = pos
		tree.rotation.y = rng.randf() * TAU
		tree.scale = Vector3.ONE * rng.randf_range(0.8, 1.4)
		add_child(tree)
		placed += 1
