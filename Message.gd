extends Sprite2D

func _input(event):
	var actionPressed = Input.is_action_just_pressed("ui_accept");
	var tree = get_tree();
	
	if actionPressed and tree.paused:
		tree.paused = false;
		tree.reload_current_scene();
