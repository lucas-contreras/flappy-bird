extends Node

var Blockers = preload("res://blockers.tscn")

func _on_build_blockers_timeout():
	var blocker = Blockers.instantiate();
	blocker.position.x = 270;
	add_child(blocker);
